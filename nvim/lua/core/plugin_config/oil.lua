-- Load and set up the "oil" plugin
require("oil").setup()

-- Set up a key mapping to open the parent directory using "oil"
vim.keymap.set("n", "-", require("oil").open, { desc = "Open parent directory" })
