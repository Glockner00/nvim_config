-- Load cmp (completion) plugin
local cmp = require("cmp")
local select_opts = {behavior = cmp.SelectBehavior.Select}

-- Load snippets from VSCode format
require("luasnip.loaders.from_vscode").lazy_load()

-- Set up cmp configuration
cmp.setup({
  -- Mapping configuration for insert mode
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),            -- Scroll documentation up
    ['<C-f>'] = cmp.mapping.scroll_docs(4),             -- Scroll documentation down
    ['<C-o>'] = cmp.mapping.complete(),                 -- Trigger completion
    ['<C-e>'] = cmp.mapping.abort(),                    -- Abort completion
    ['<CR>']  = cmp.mapping.confirm({ select = true }), -- Confirm completion
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item(select_opts)
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item(select_opts)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),

  -- Snippet configuration
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body) -- Expand snippets using luasnip
    end,
  },

  -- Sources for completion
  sources = cmp.config.sources({
    { name = 'nvim_lsp' }, -- Use nvim_lsp as a completion source
    { name = 'luasnip' },  -- Use luasnip as a completion source for snippets
  }, {
    { name = 'buffer' },   -- Use buffer contents as a completion source
  }),
})
