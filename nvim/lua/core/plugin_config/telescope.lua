-- Set up Telescope configuration
require('telescope').setup({
  file_ignore_patterns = { "node%_modules/.*" } -- Ignore files in node_modules directory
})

-- Load Telescope's built-in commands
local builtin = require('telescope.builtin')

-- Map keybindings for Telescope commands
vim.keymap.set('n', '<c-p>', builtin.find_files, {})        -- Find files
vim.keymap.set('n', '<Space><Space>', builtin.oldfiles, {}) -- Open recent files
vim.keymap.set('n', '<Space>fg', builtin.live_grep, {})     -- Live grep/search
vim.keymap.set('n', '<Space>fh', builtin.help_tags, {})     -- Help tags (search in help documentation)
