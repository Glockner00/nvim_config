-- Navigate between vim panes using Ctrl + direction
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>') -- Move to the pane above
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>') -- Move to the pane below
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>') -- Move to the pane on the left
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>') -- Move to the pane on the right

-- Clear search highlighting using <leader>h
vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]) -- Search and replace the word that you are on.

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])                                       -- Yank selected line to system clipboard
vim.keymap.set("n", "<leader>Y", [["+Y]])                                                -- Yank to end of line and copy to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])                                       -- Delete selected text
vim.keymap.set("x", "<leader>p", [["_dP]])                                               -- Paste and replace selections

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- Join selected items
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv") -- Joind selected lines (backward)
vim.keymap.set("n", "J", "mzJ`z")            -- Join lines without adding spaces
vim.keymap.set("n", "<C-d>", "<C-d>zz")      -- Scroll half page down
vim.keymap.set("n", "<C-u>", "<C-u>zz")      -- Scroll half page up
vim.keymap.set("n", "n", "nzzzv")            -- Center current line ater search
vim.keymap.set("n", "N", "Nzzzv")            -- Center current line before search
