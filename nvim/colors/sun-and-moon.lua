local vim = vim -- to avoid undefined vim warning all down the file

vim.o.background='light'
vim.cmd([[
  hi clear
  let g:colors_name = 'sun_and_moon'
  highlight StatusLine cterm=bold ctermbg=NONE ctermfg=16
  highlight StatusLineNC cterm=NONE ctermbg=NONE ctermfg=16

  highlight SignColumn ctermbg=NONE
  highlight CursorLine cterm=bold
  highlight Visual ctermbg=153 " Light blue selection

  " Tilde characters that identify non-existent lines
  highlight NonText ctermfg=gray

  " All pop-up windows
  highlight Pmenu ctermbg=NONE
  highlight PmenuSel ctermbg=gray

  highlight VertSplit ctermfg=black ctermbg=NONE

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

  highlight MatchParen ctermbg=blue ctermfg=black
  highlight @punctuation.bracket ctermfg=blue
  highlight cssBraces cterm=NONE ctermfg=blue

  highlight @type.css cterm=bold ctermfg=blue
  highlight @constant.css cterm=bold ctermfg=blue

  highlight @markup.heading cterm=bold
  highlight @markup.list cterm=bold
  highlight @markup.italic cterm=italic
  highlight @markup.strong cterm=bold
  highlight @markup.link.label ctermfg=yellow
  highlight @markup.link.url cterm=underline ctermfg=blue

  highlight diffRemoved ctermbg=red
  highlight diffAdded ctermbg=yellow
]])
