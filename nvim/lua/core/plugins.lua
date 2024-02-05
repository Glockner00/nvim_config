-- Lazy load plugins and set up their configurations
require("lazy").setup({
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 }, -- Example with custom priority
  "tpope/vim-commentary",                                      -- Commenting plugin
  "mattn/emmet-vim",                                           -- Emmet abbreviation expansion
  "nvim-tree/nvim-tree.lua",                                   -- File explorer
  "nvim-tree/nvim-web-devicons",                               -- Icons for nvim-tree
  "ellisonleao/gruvbox.nvim",                                  -- Gruvbox color scheme
  "windwp/nvim-autopairs",                                     -- autopairs
  "dracula/vim",                                               -- Dracula color scheme
  "nvim-lualine/lualine.nvim",                                 -- Statusline
  "nvim-treesitter/nvim-treesitter",                           -- Syntax highlighting
  "vim-test/vim-test",                                         -- Test framework support
  "lewis6991/gitsigns.nvim",                                   -- Git signs
  "preservim/vimux",                                           -- Tmux integration
  "christoomey/vim-tmux-navigator",                            -- Tmux navigation
  "tpope/vim-fugitive",                                        -- Git integration
  "tpope/vim-surround",                                        -- Surround text objects
  "stevearc/oil.nvim",                                         -- Oil language support
  -- Completion
  "hrsh7th/nvim-cmp",                                          -- Completion engine
  "hrsh7th/cmp-nvim-lsp",                                      -- LSP source for nvim-cmp
  "L3MON4D3/LuaSnip",                                          -- Snippet engine
  "saadparwaiz1/cmp_luasnip",                                  -- Luanip source for nvim-cmp
  "rafamadriz/friendly-snippets",                              -- Snippet collection
  --"github/copilot.vim",    -- GitHub Copilot (commented out, uncomment if needed)
  "williamboman/mason.nvim",                                   -- Mason (file template system) support
  "williamboman/mason-lspconfig.nvim",                         -- Mason LSP configuration
  "neovim/nvim-lspconfig",                                     -- LSP configurations
  {
    "vinnymeller/swagger-preview.nvim",
    run = "npm install -g swagger-ui-watcher", -- Install necessary npm package for Swagger preview
  },
  {
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install", -- Install necessary npm packages for Markdown preview
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.4",
    dependencies = { "nvim-lua/plenary.nvim" } -- Telescope (fuzzy finder)
  },
})
