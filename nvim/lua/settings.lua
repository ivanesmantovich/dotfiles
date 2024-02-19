local vim = vim -- to avoid undefined vim warning all down the file

-- Get or set options. Like `:set`. Invalid key is an error. :help vim.o

vim.o.guicursor = '' -- Setup cursor later

-- %t is filename, %m is modified flag, %#Comment# is beginning of gray highlighting, %{FugitiveHead()} is git branch, %0* is beginning of normal highlighting, %= is space between, %l is current line number, %L is total number of lines
vim.o.statusline = '%t %m %#Comment#%{FugitiveHead()}%0*%=line %l out of %L'

vim.o.laststatus = 3

vim.o.updatetime = 100
vim.o.timeoutlen = 300

-- Leader must be set before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- Disable the noise
vim.o.number = false
vim.opt.fillchars = { eob = ' ' } -- Tilde characters that identify non-existent lines
vim.o.signcolumn = 'yes:1'

vim.o.wrap = false
vim.o.clipboard = 'unnamedplus'

vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smartindent = true

vim.o.hlsearch = false
vim.o.incsearch = true
vim.o.ignorecase = true

vim.o.swapfile = false
vim.o.backup = false

vim.o.scrolloff = 8

-- .env variables
vim.env.path = '/Users/ive/.nvm/versions/node/v20.9.0/bin' .. (vim.env.path and vim.env.path or '')

