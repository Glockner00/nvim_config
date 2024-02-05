-- Set up Mason LSP configuration
require("mason-lspconfig").setup({
  ensure_installed = { "lua_ls", "tsserver", "clangd" } -- Ensure required language servers are installed
})

-- Load LSP configuration module
local lspconfig = require('lspconfig')

-- Set default LSP configuration
local lsp_defaults = lspconfig.util.default_config

-- Extend LSP capabilities with nvim-cmp's default capabilities
lsp_defaults.capabilities = vim.tbl_deep_extend(
  'force',
  lsp_defaults.capabilities,
  require('cmp_nvim_lsp').default_capabilities()
)

-- Configure specific language servers
require("lspconfig").lua_ls.setup {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          [vim.fn.expand "$VIMRUNTIME/lua"] = true,
          [vim.fn.stdpath "config" .. "/lua"] = true,
        },
      },
    },
  }
}

-- Uncomment the lines below to configure additional language servers
-- require("lspconfig").solargraph.setup({})
require("lspconfig").tsserver.setup({})
require("lspconfig").gopls.setup({})
require("lspconfig").tailwindcss.setup({})
require("lspconfig").clangd.setup({})

-- Set up LSP mappings on LspAttach event
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    vim.bo[ev.buf].omnifunc =
    'v:lua.vim.lsp.omnifunc'                                                    -- Enable completion triggered by <c-x><c-o>
    local opts = { buffer = ev.buf }                                            -- Buffer local mappings for LSP
    vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)                        -- Format using LSP
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)                    -- Jump to declaration
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)                     -- Jump to definition
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)                           -- Show hover information
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)                 -- Jump to implementation
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)    -- Add workspace folder
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts) -- Remove workspace folder

    vim.keymap.set('n', '<space>wl', function()                                 -- List workspace folders
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)

    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)       -- Jump to type definition
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)               -- Rename symbol
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts) -- Code action
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)                  -- Find references

    -- Format document
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})
