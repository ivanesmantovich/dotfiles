local vim = vim -- to avoid undefined vim warning all down the file

-- Uncomment to install plugin manager
-- vim.cmd [[
--  let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
--  if empty(glob(data_dir . '/autoload/plug.vim'))
--      silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
--      autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
--  endif
-- ]]

local Plug = vim.fn['plug#']

vim.call('plug#begin')

-- tpope
Plug('tpope/vim-vinegar')
Plug('tpope/vim-commentary')
Plug('tpope/vim-surround')
Plug('tpope/vim-repeat')
Plug('tpope/vim-sleuth')
Plug('tpope/vim-unimpaired')

-- Git
Plug('tpope/vim-fugitive')
Plug('lewis6991/gitsigns.nvim')

-- Syntax tree parser, highlight, edit, and navigate code
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' })
Plug('nvim-treesitter/nvim-treesitter-textobjects')

-- Language Server Protocol
Plug('williamboman/mason.nvim')
Plug('williamboman/mason-lspconfig.nvim')
Plug('neovim/nvim-lspconfig')

-- Completions Engine
Plug('hrsh7th/nvim-cmp')
Plug('L3MON4D3/LuaSnip')
-- Completions Sources
Plug('hrsh7th/cmp-nvim-lsp')
Plug('hrsh7th/cmp-path')

-- Telescope
Plug('nvim-lua/plenary.nvim')
Plug('nvim-telescope/telescope.nvim', { ['tag'] = '0.1.5' })
Plug('nvim-telescope/telescope-fzf-native.nvim', { ['do'] = 'make' })

vim.call('plug#end')
