execute pathogen#infect()
syntax on
filetype plugin indent on

set expandtab

set listchars=tab:>-,trail:~,extends:>,precedes:<
set list

set tabstop=4
set softtabstop=4
set expandtab

set number
set showcmd
set cursorline

set wildmenu
set lazyredraw
set showmatch

set incsearch
set hlsearch

let mapleader = "\<Space>"
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :wq<CR>
nnoremap <Leader>, :nohlsearch<CR>
inoremap jk <esc>
inoremap jw <esc>:w<CR>
inoremap jq <esc>:wq<CR>

au Vimenter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

