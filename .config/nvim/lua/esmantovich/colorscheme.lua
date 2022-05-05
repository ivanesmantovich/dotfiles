-- local colorscheme = "ayu"

-- local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
-- if not status_ok then
--   vim.notify("Colorscheme " .. colorscheme .. " not found!")
--   return
-- end

-- vim.o.background = 'light'
-- require('ayu').colorscheme()

vim.opt.background = "light" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])
