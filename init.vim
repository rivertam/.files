call plug#begin('~/.config/nvim/plugged')

Plug 'prettier/vim-prettier', {
      \ 'do': 'yarn install',
      \ }

" let g:prettier#autoformat = 1
let g:prettier#config#single_quote = 'true'
let g:prettier#config#trailing_comma = 'all'
let g:prettier#config#bracket_spacing = 'true'
let g:prettier#config#jsx_bracket_same_line = 'false'
let g:prettier#config#arrow_parens = 'avoid'
let g:prettier#config#prose_wrap = 'always'

call plug#end()
