-- Navigate between vim panes using Ctrl + direction
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>') -- Move to the pane above
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>') -- Move to the pane below
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>') -- Move to the pane on the left
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>') -- Move to the pane on the right

-- Clear search highlighting using <leader>h
vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]) -- Search and replace the word that you are on.
