" for nvim

set t_Co=256
syntax on
nnoremap <S-UP> :m .-1
nnoremap <S-DOWN> :m .+1
set noea
set expandtab
set number
set smartcase ignorecase
set incsearch
au FileType ruby setl sw=2 sts=2 et
au FileType javascript setl sw=2 sts=2 et

let mapleader = "\<Space>"

" vim-plug section
call plug#begin('~/.config/nvim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'vim-airline/vim-airline'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'evanmiller/nginx-vim-syntax'
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/vim-easy-align'
Plug 'mhinz/vim-signify'
Plug 'marijnh/tern_for_vim', { 'do': 'npm install' }

call plug#end()

nnoremap <silent> <F2> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
inoremap <F1> <Esc>

nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :wq<CR>
nnoremap <Leader>= <C-w>=
inoremap jk <Esc>
inoremap jw <Esc>:w<CR>
inoremap jq <Esc>:wq<CR>

nnoremap <Leader>, :noh<CR>

vnoremap y "+y
vnoremap jk <Esc>

tnoremap jk <C-\><C-n>

let g:jsx_ext_required = 0
let NERDTreeQuitOnOpen = 0

let g:syntastic_javascript_checkers = ['eslint']

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 2
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#right_sep = ' '
let g:airline#extensions#tabline#right_alt_sep = '|'
let g:airline_left_sep = ' '
let g:airline_left_alt_sep = '|'
let g:airline_right_sep = ' '
let g:airline_right_alt_sep = '|'
let g:airline_theme= 'molokai'

set wildmenu
nnoremap gb :ls<CR>:b<Space>

hi CursorLine cterm=bold ctermbg=234
set cursorline!
set wrap

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

let g:bufferline_echo = 0

command! Resource source ~/.config/nvim/init.v
