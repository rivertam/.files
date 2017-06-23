set t_Co=256
set t_AB=^[[48;5;%dm
set t_AF=^[[38;5;%dm
set mouse=a
filetype plugin on
colorscheme Tomorrow-Night
syntax on
nnoremap <S-UP> :m .-1
nnoremap <S-DOWN> :m .+1
set noea
set number
au TermOpen * setlocal nonumber norelativenumber
set smartcase ignorecase
set incsearch
set ts=2 sw=2 sts=2 et
set tabstop=3

set fillchars+=vert:\

let mapleader = "\<Space>"

" vim-plug section
call plug#begin('~/.config/nvim/plugged')

Plug 'neovim/node-host', { 'do': 'npm install' }
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'LucHermitte/lh-vim-lib'
Plug 'LucHermitte/local_vimrc'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-vinegar'
Plug 'Yggdroot/IndentLine'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'elzr/vim-json'
Plug 'pangloss/vim-javascript'
Plug 'ruanyl/vim-fixmyjs'
Plug 'kewah/vim-stylefmt'
Plug 'othree/yajs.vim'
Plug 'othree/es.next.syntax.vim'
Plug 'flowtype/vim-flow'
Plug 'ryym/vim-riot'
Plug 'mxw/vim-jsx'
Plug 'jason0x43/vim-js-indent'
Plug 'lambdatoast/elm.vim'
Plug 'Quramy/tsuquyomi'
Plug 'leafgarland/typescript-vim'
Plug 'evanmiller/nginx-vim-syntax'
Plug 'easymotion/vim-easymotion'
Plug 'mhinz/vim-signify'
Plug 'slim-template/vim-slim'
Plug 'benekastah/neomake'
Plug 'benjie/neomake-local-eslint.vim'
Plug 'jaxbot/github-issues.vim'
Plug 'Shougo/deoplete.nvim'
Plug 'steelsojka/deoplete-flow'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mtth/scratch.vim'
Plug 'digitaltoad/vim-pug'
Plug 'racer-rust/vim-racer'
Plug 'mustache/vim-mustache-handlebars'
Plug 'rust-lang/rust.vim'

" Phoenix development
Plug 'elixir-lang/vim-elixir'
Plug 'avdgaag/vim-phoenix'

" clojure development
Plug 'tpope/vim-fireplace' " for REPL stuff
Plug 'guns/vim-clojure-static' " for basic clojure stuff (highlighting, indentation, omnifunc)
Plug 'guns/vim-clojure-highlight' " more highlighting I guess ?
Plug 'junegunn/rainbow_parentheses.vim' " tasty parens
Plug 'snoe/nvim-parinfer.js' " TASTY parens
Plug 'venantius/vim-eastwood' " Eastwood for linting

call plug#end()

nnoremap <silent> <Leader>t :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" escaping and basic stuff
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>= <C-w>=
nnoremap <Leader>, :noh<CR>
nnoremap <Leader> <C-W>
nnoremap <Leader>t :term<CR>
inoremap jk <Esc>
inoremap jw <Esc>:w<CR>
inoremap jq <Esc>:wq<CR>

nnoremap <Leader>, :noh<CR>

vnoremap y "+y

" Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y

" Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P
vnoremap y "+y

tnoremap jk <C-\><C-n>

let g:jsx_ext_required = 0
let NERDTreeQuitOnOpen = 0

let g:scratch_horizontal = 0

" fzf
let $FZF_DEFAULT_COMMAND = 'fd'
let g:fzf_layout = { 'window': 'enew' }
nnoremap <Leader>e :Files<CR>

map <Leader>sg :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
      \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
      \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" neomake (for linting)

let g:tsuquyomi_disable_quickfix = 1
let g:neomake_verbose = 0
let g:neomake_javascript_enabled_makers = ['eslint_d', 'flow']
let g:neomake_jsx_enabled_makers = ['eslint']
let g:neomake_sh_enabled_makers = ['shellcheck']
let g:neomake_scss_enabled_makers = ['stylelint']
let g:neomake_open_list = 0

let g:neomake_warning_sign = {
      \ 'text': ')=',
      \ 'texthl': 'WarningMsg',
      \ }

let g:neomake_error_sign = {
      \ 'text': 'D=',
      \ 'texthl': 'ErrorMsg',
      \ }

fun! ConditionalNeomake()
  if exists('b:noNeomake')
    return
  endif
  Neomake
endfun

autocmd! BufWritePost * call ConditionalNeomake()
autocmd FileType elixir let b:noNeomake=1

autocmd! BufWritePre *.js call Fixmyjs()
let g:fixmyjs_executable = '/home/ben/.yarn/bin/eslint_d'

au BufWritePre *.css :Stylefmt

" show trailing whitespace
set list
set listchars=tab:•\ ,trail:•,extends:»,precedes:«


" deoplete (for autocomplete)
inoremap <silent><expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
let g:deoplete#enable_at_startup = 1
let g:deoplete#omni#input_patterns = {}
let g:deoplete#omni#input_patterns.javascript = ['[^. *\t]\.\w*', '[A-Za-z]+']
let g:deoplete#omni#input_patterns.typescript = '[.\.]*'
let g:deoplete#omni#input_patterns.gitcommit = ['#']
let g:deoplete#file#enable_buffer_path = 1

set completeopt-=preview

function! neomake#makers#ft#rust#EnabledMakers()
    return ['rustc']
endfunction

let g:closetag_filenames = "*.html,*.js,*.jsx"

function! neomake#makers#ft#rust#rustc()
    return {
        \ 'args': ['rustc', '-Zno-trans'],
        \ 'exe': 'cargo',
        \ 'append_file': 0,
        \ 'errorformat':
            \ '%-G%f:%s:,' .
            \ '%f:%l:%c: %trror: %m,' .
            \ '%f:%l:%c: %tarning: %m,' .
            \ '%f:%l:%c: %m,'.
            \ '%f:%l: %trror: %m,'.
            \ '%f:%l: %tarning: %m,'.
            \ '%f:%l: %m',
        \ }
  endfunction

autocmd FileType * let b:autoformat_autoindent=0
autocmd FileType rust let b:autoformat_autoindent=1

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

let g:airline_theme = 'base16_tomorrow'


let g:airline_section_a       = '%t'
let g:airline_section_b       = airline#section#create_left(['mode'])
let symbol = get(g:, 'airline#extensions#branch#symbol', g:airline_symbols.branch)
let g:airline_section_c       = symbol . ' %{fugitive#head()}'
let g:airline_section_y       = "%3c/%-3{strwidth(getline('.'))}"
let g:airline_section_z       = "%3l\/%3L"

" first line is left side; second is right
let g:airline#extensions#default#layout = [
      \ [ 'a', 'b', 'c' ],
      \ [ 'x', 'y', 'z', 'error', 'warning' ]
      \ ]

nnoremap gb :ls<CR>:b<Space>

hi CursorLine cterm=bold ctermbg=234
set cursorline!
set wrap

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

let g:bufferline_echo = 0
let g:formatdef_rustfmt = '"rustfmt"'
let g:formatters_rust = ['rustfmt']

let g:vim_json_syntax_conceal=0

command! Resource source ~/.config/nvim/init.vim
