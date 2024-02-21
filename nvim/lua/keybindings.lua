local vim = vim -- to avoid undefined vim warning all down the file

-- Continuous Indentation
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- Move to Split
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')
-- Create Split
vim.keymap.set('n', '<C-M-h>', '<C-w>v')
vim.keymap.set('n', '<C-M-j>', '<C-w>s')
vim.keymap.set('n', '<C-M-k>', '<C-w>s')
vim.keymap.set('n', '<C-M-l>', '<C-w>v')
-- Close Split
vim.keymap.set('n', '<C-w>', '<C-w>q')
