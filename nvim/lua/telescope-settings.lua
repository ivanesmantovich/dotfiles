local vim = vim -- to avoid undefined vim warning all down the file

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
-- To get fzf loaded and working with telescope, you need to call load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')

local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
