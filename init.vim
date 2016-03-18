set t_Co=256
filetype plugin on
colorscheme Tomorrow-Night
syntax on
nnoremap <S-UP> :m .-1
nnoremap <S-DOWN> :m .+1
set noea
set number
set smartcase ignorecase
set incsearch
set ts=2 sw=2 sts=2 et

set fillchars+=vert:\ 

let mapleader = "\<Space>"

" vim-plug section
call plug#begin('~/.config/nvim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'pangloss/vim-javascript'
Plug 'othree/yajs.vim'
Plug 'othree/es.next.syntax.vim'
Plug 'mxw/vim-jsx'
Plug 'evanmiller/nginx-vim-syntax'
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/vim-easy-align'
Plug 'mhinz/vim-signify'
Plug 'elzr/vim-json'
Plug 'slim-template/vim-slim'
Plug 'benekastah/neomake'
Plug 'jaxbot/github-issues.vim'
Plug 'Shougo/deoplete.nvim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'carlitux/deoplete-ternjs', { 'for': 'javascript' }
Plug 'mtth/scratch.vim'

call plug#end()

nnoremap <silent> <Leader>t :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

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

" tab navigation
nnoremap <F1> 1gt
nnoremap <F2> 2gt
nnoremap <F3> 3gt
nnoremap <F4> 4gt
nnoremap <F5> 5gt
nnoremap <F6> 6gt
nnoremap <F7> 7gt
nnoremap <F8> 8gt
nnoremap <F9> 9gt
nnoremap <F0> 10gt

let g:jsx_ext_required = 0
let NERDTreeQuitOnOpen = 0

let g:scratch_horizontal = 0


map <Leader>sg :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" neomake (for linting)

let g:neomake_verbose = 0
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_jsx_enabled_makers = ['eslint']
let g:neomake_sh_enabled_makers = ['shellcheck']
let g:neomake_scss_enabled_makers = ['scsslint']

let g:neomake_warning_sign = {
  \ 'text': ')=',
  \ 'texthl': 'WarningMsg',
  \ }

let g:neomake_error_sign = {
  \ 'text': 'D=',
  \ 'texthl': 'ErrorMsg',
  \ }

autocmd! BufWritePost * Neomake

" show trailing whitespace
set list
set listchars=tab:•\ ,trail:•,extends:»,precedes:«

" deoplete (for autocomplete)
inoremap <silent><expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_completion_start_length = 1
let g:deoplete#enable_debug = 1
let g:deoplete#omni#input_patterns = {}
let g:deoplete#omni#input_patterns.javascript = ['[^. *\t]\.\w*', '[A-Za-z]+']
let g:deoplete#omni#input_patterns.gitcommit = ['#']

let g:tern_show_signature_in_pum = 1
let g:tern_show_argument_hints = 1
let g:tern_request_timeout = 1
set completeopt-=preview

augroup omnifuncs
  autocmd!
  autocmd FileType javascript setlocal omnifunc=tern#Complete
augroup end

let g:github_access_token = $GITHUB_ACCESS_TOKEN

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
let g:airline_theme = 'base16_tomorrow'

set statusline=\ 

let g:airline_section_b       = airline#section#create_left(['mode'])
let g:airline_section_c       = airline#section#create_left(['branch'])
let g:airline_section_y       = "%3c/%-3{strwidth(getline('.'))}"
let g:airline_section_z       = "%3l\/%3L"

" first line is left side; second is right
let g:airline#extensions#default#layout = [
  \ [ 'b', 'c' ],
  \ [ 'x', 'y', 'z', 'error', 'warning' ]
  \ ]

nnoremap gb :ls<CR>:b<Space>

hi CursorLine cterm=bold ctermbg=234
set cursorline!
set wrap

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

let g:bufferline_echo = 0

command! Resource source ~/.config/nvim/init.vim
