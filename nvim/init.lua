local vim = vim -- to avoid undefined vim warning all down the file


-- Options. :help vim.o
vim.o.guicursor = '' -- Cursor is always block
vim.o.termguicolors = true
vim.o.scrolloff = 8
vim.o.statusline = '%t %m %#Comment#%{FugitiveHead()}%0*%=line %l out of %L' -- %t is filename, %m is modified flag, %#Comment# is beginning of gray highlighting, %{FugitiveHead()} is git branch, %0* is beginning of normal highlighting, %= is space between, %l is current line number, %L is total number of lines
vim.o.laststatus = 2 -- Global statusline
vim.o.updatetime = 100
vim.o.timeoutlen = 500 -- Time to wait for keybinds to complete
vim.g.mapleader = ' ' -- Leader key
vim.g.maplocalleader = ' '
vim.o.completeopt = 'menuone,noselect' -- Set completeopt to have a better completion experience
vim.o.number = false -- Line numbers
vim.o.signcolumn = 'yes:1' -- Always display sign column
vim.opt.fillchars = { eob = ' ' } -- Hide tilde characters that identify non-existent lines
vim.o.wrap = false -- Line wrapping
vim.o.clipboard = 'unnamedplus' -- Enable system clipboard
vim.o.virtualedit = "block"
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.hlsearch = true -- Disable highlight of search results
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.swapfile = false
vim.o.backup = false
vim.o.cursorline = true
-- vim.env.path = '/Users/ive/.nvm/versions/node/v20.9.0/bin' .. (vim.env.path and vim.env.path or '')

-- vim.diagnostic.config({virtual_text = false, signs = true})
vim.diagnostic.config({virtual_text = {
      spacing = 4,
      source = "if_many",
      prefix = "●",
      -- this will set set the prefix to a function that returns the diagnostics icon based on the severity
      -- this only works on a recent 0.10.0 build. Will be set to "●" when not supported
      -- prefix = "icons",
    }, signs = true})


-- Plugins.
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
Plug('kdheepak/lazygit.nvim')
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
-- Formatting
Plug 'stevearc/conform.nvim'
-- Linting
Plug 'mfussenegger/nvim-lint'
-- Telescope
Plug('nvim-lua/plenary.nvim')
Plug('nvim-telescope/telescope.nvim', { ['tag'] = '0.1.5' })
Plug('nvim-telescope/telescope-fzf-native.nvim', { ['do'] = 'make' })
-- Utils
Plug ('echasnovski/mini.pairs', { ['branch'] = 'stable' })
Plug('NvChad/nvim-colorizer.lua')
Plug('ggandor/leap.nvim')
vim.call('plug#end')


-- Treesitter. Defer setup after first render to improve startup time of 'nvim {filename}'
vim.defer_fn(function()
  require('nvim-treesitter.configs').setup {
    -- Add languages to be installed here that you want installed for treesitter
    ensure_installed = { 'c', 'cpp', 'go', 'lua', 'python', 'rust', 'tsx', 'javascript', 'typescript', 'vimdoc', 'vim', 'bash' },

    -- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
    auto_install = false,
    -- Install languages synchronously (only applied to `ensure_installed`)
    sync_install = false,
    -- List of parsers to ignore installing
    ignore_install = {},
    -- You can specify additional Treesitter modules here: -- For example: -- playground = {--enable = true,-- },
    modules = {},
    highlight = { enable = true },
    indent = { enable = true },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = '<c-space>',
        node_incremental = '<c-space>',
        scope_incremental = '<c-s>',
        node_decremental = '<M-space>',
      },
    },
  }
end, 0)


-- LSP.
require("mason").setup()
local mason_lspconfig = require('mason-lspconfig')
local language_servers_to_install = {
  html = {},      -- HTML
  cssls = {},     -- CSS
  tsserver = {},   -- JavaScript, TypeScript
}
mason_lspconfig.setup({
  ensure_installed = vim.tbl_keys(language_servers_to_install) -- Preinstall Language Servers
})
-- Actions that will execute on every buffer that attaches to Language Server
local function lsp_attach_actions(_, bufnr)
  -- Helper function to set keymaps
  local function nmap(what_to_press, what_to_execute)
    vim.keymap.set('n', what_to_press, what_to_execute, { buffer = bufnr })
  end
  nmap('K', vim.lsp.buf.hover)            -- Press K twice to jump into the floating window. C-o to exit
  nmap('gd', vim.lsp.buf.definition)      -- To go back C-t may be useful! (go back in Tag Stack)
  nmap('ge', vim.diagnostic.open_float)
  nmap('gi', vim.lsp.buf.implementation)
  nmap('gr', vim.lsp.buf.references)
  nmap('<leader>r', vim.lsp.buf.rename)   -- After this we need to do :wa (write all) because it could change multiple buffers across the project
  nmap('[d', vim.diagnostic.goto_prev)
  nmap(']d', vim.diagnostic.goto_next)
end
-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
mason_lspconfig.setup_handlers({
  function(server_name)
    require('lspconfig')[server_name].setup {
      capabilities = capabilities,
      on_attach = lsp_attach_actions
    }
  end
})


-- Completions.
local cmp = require('cmp')
cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
    -- completion = {
    --   border = 'solid'
    -- },
    -- documentation = {
    --   border = 'solid'
    -- },
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<Tab>'] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    ['<CR>'] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),

  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'path' }
  })
})


-- Formatting.
require("conform").setup({
  formatters_by_ft = {
    -- Conform will run multiple formatters sequentially
    -- python = { "isort", "black" },
    -- Use a sub-list to run only the first available formatter
    javascript = { { "biome" } },
    javascriptreact = { { "biome" } },
    typescript = { { "biome" } },
    typescriptreact = { { "biome" } },
    -- javascript = { { "prettierd", "prettier" } },
    -- javascriptreact = { { "prettierd", "prettier" } },
    -- typescript = { { "prettierd", "prettier" } },
    -- typescriptreact = { { "prettierd", "prettier" } },
  },
})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    require("conform").format({ bufnr = args.buf, lsp_fallback = false })
    -- Uncomment to enable async formatting.
    -- require("conform").format({ bufnr = args.buf, lsp_fallback = false, async = true })
  end,
})


-- Linting.
require('lint').linters_by_ft = {
    javascript = {'biomejs'},
    javascriptreact = {'biomejs'},
    typescript = {'biomejs'},
    typescriptreact = {'biomejs'},
}
vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
  callback = function()
    require('lint').try_lint()
  end,
})

-- Telescope.
require('telescope').setup({
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case", the default case_mode is "smart_case"
      override_generic_sorter = true,
      override_file_sorter = true,
    }
  },
  defaults = {
    layout_strategy = 'vertical',
    layout_config = { height = 0.98, width = 0.95 },
    mappings = {
      i = {
        ["<C-h>"] = "which_key"
      }
    }
  }
})
require('telescope').load_extension('fzf') -- We need to call load_extension, somewhere after setup function
local telescope_builtin = require('telescope.builtin')

-- Utils.
-- Bracket Autopairs
require('mini.pairs').setup()
-- Colorizer
require("colorizer").setup({
    user_default_options = {
        tailwind = true
    }
})
-- Leap
require('leap').create_default_mappings()
-- LazyGit
vim.g.lazygit_floating_window_scaling_factor = 0.95


-- Keybindings.
-- Sorry, not sorry
vim.keymap.set('n', '<C-a>', '^')
vim.keymap.set('n', '<C-e>', '$')
-- Paste without yanking
vim.keymap.set('x', 'p', 'P')
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
-- Telescope
vim.keymap.set('n', '<leader>ff', telescope_builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', telescope_builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', telescope_builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', telescope_builtin.help_tags, {})
-- LazyGit
vim.keymap.set('n', '<leader>lg', '<cmd>LazyGit<cr>', {})


-- Colorscheme. :Inspect to check highlighting under the cursor
vim.cmd('colorscheme halftone')
