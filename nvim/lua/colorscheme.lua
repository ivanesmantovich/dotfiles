local vim = vim -- to avoid undefined vim warning all down the file

vim.o.background="light"
-- :Inspect to check highlighting under the cursor
vim.cmd([[
  hi clear
  let g:colors_name = 'sun_and_moon'
  highlight StatusLine cterm=bold ctermbg=NONE ctermfg=16 
  highlight StatusLineNC cterm=NONE ctermbg=NONE ctermfg=16

  highlight SignColumn ctermbg=NONE
  highlight CursorLine cterm=bold

  " Tilde characters that identify non-existent lines
  highlight NonText ctermfg=gray

  " All pop-up windows
  highlight Pmenu ctermbg=NONE
  highlight PmenuSel ctermbg=gray

  highlight Constant ctermfg=black
  highlight Error ctermfg=black
  highlight Statement ctermfg=black
  highlight Identifier ctermfg=black
  highlight Special ctermfg=black

  highlight Type ctermfg=yellow
  highlight Function cterm=bold ctermfg=blue
  highlight Comment ctermfg=darkgray

  highlight @keyword cterm=bold ctermfg=black

  highlight @tag cterm=bold ctermfg=blue
  highlight @tag.delimiter cterm=NONE ctermfg=blue
  highlight @tag.attribute cterm=NONE ctermfg=yellow

  highlight MatchParen ctermbg=blue ctermfg=white
  highlight @punctuation.bracket ctermfg=blue
  highlight cssBraces cterm=NONE ctermfg=blue
]])
