-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local discipline = require("axel.discipline")
--discipline.cowboy()
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Increment/decrement
keymap.set("n", "+", "<C-a>", opts)
keymap.set("n", "-", "<C-x>", opts)

-- Delete a word backwards
keymap.set("n", "dw", "vb_d", opts)

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G", opts)

-- Jumplist
keymap.set("n", "<C-m>", "<C-i>", opts)

-- New tab
keymap.set("n", "te", ":tabedit")
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)

-- Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)

-- Move window
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")

-- Resize window
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><down>", "<C-w>+")
keymap.set("n", "<C-w><up>", "<C-w>-")

-- Diagnostics
keymap.set("n", "<C-j>", function()
  vim.diagnostic.goto_next()
end, opts)

-- Jump to end of word
keymap.set("i", "<C-e>", "<C-o>e", opts)

-- Search and replace the word that you are on.
keymap.set("n", "<leader>sp", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Paste and replace selections
keymap.set("x", "<leader>p", [["_dP]])

-- Yank selected line to system clipboard
keymap.set({ "n", "v" }, "<leader>y", [["+y]])

-- Yank to end of line and copy to system clipboard
keymap.set("n", "<leader>Y", [["+Y]])

-- Join selected items
keymap.set("v", "J", ":m '>+1<CR>gv=gv")

-- Joind selected lines (backward)
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Join lines without adding space
keymap.set("n", "J", "mzJ`z")
-- For making tmux work with vim commands.
