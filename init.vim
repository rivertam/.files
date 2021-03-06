set t_Co=256
set t_AB=^[[48;5;%dm
set t_AF=^[[38;5;%dm
set enc=utf-8
set mouse=a
set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor
let NVIM_TUI_ENABLE_CURSOR_SHAPE = 0
filetype plugin on
syntax on
nnoremap <S-UP> :m .-1
nnoremap <S-DOWN> :m .+1
set noea
set number
au TermOpen * setlocal nonumber norelativenumber
au TermOpen * startinsert
set smartcase ignorecase
set incsearch
set ts=2 sw=2 sts=2 et
set tabstop=3
set clipboard=unnamedplus
set hidden
set wrap

set fillchars+=vert:\ 
let mapleader = "\<Space>"

" vim-plug section
call plug#begin('~/.config/nvim/plugged')

" These really should have no conflicts (very common and well-maintained)
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-vinegar'

Plug 'scrooloose/nerdcommenter'
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'

Plug 'neovim/node-host', { 'do': 'npm install' }
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'LucHermitte/lh-vim-lib'
Plug 'LucHermitte/local_vimrc'
Plug 'morhetz/gruvbox'

Plug 'alvan/vim-closetag'
Plug 'Yggdroot/IndentLine'
Plug 'ryanoasis/vim-devicons'
let g:WebDevIconsNerdTreeAfterGlyphPadding = ''

Plug 'scrooloose/nerdtree'
let NERDTreeQuitOnOpen = 0
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

Plug 'Xuyuanp/nerdtree-git-plugin'

" These might have conflicts
Plug 'yssl/QFEnter'
Plug 'elzr/vim-json'

let g:vim_json_syntax_conceal=0

Plug 'cespare/vim-toml'
Plug 'ruanyl/vim-fixmyjs'
Plug 'kewah/vim-stylefmt'
Plug 'pangloss/vim-javascript'
Plug 'othree/yajs.vim'
Plug 'othree/es.next.syntax.vim'
Plug 'flowtype/vim-flow'
Plug 'reasonml-editor/vim-reason'
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

" Rust
Plug 'racer-rust/vim-racer'
Plug 'mustache/vim-mustache-handlebars'
Plug 'rust-lang/rust.vim'
Plug 'sebastianmarkow/deoplete-rust'

" Rust options
let g:rustfmt_autosave = 1
let g:rustfmt_fail_silently = 1
let g:racer_cmd = "/home/ben/.cargo/bin/racer"
let g:deoplete#sources#rust#racer_binary = "$(which racer)"
autocmd FileType * let b:autoformat_autoindent=1
let g:formatdef_rustfmt = '"cargo fmt"'
let g:formatters_rust = ['rustfmt']

" neomake (for linting)
Plug 'benekastah/neomake'

" neomake relevant stuff

fun! ConditionalNeomake()
  if exists('b:noNeomake')
    return
  endif
  Neomake
endfun

autocmd! BufWritePost * call ConditionalNeomake()

let g:neomake_verbose = 0
let g:neomake_javascript_enabled_makers = ['eslint_d', 'flow']
let g:neomake_jsx_enabled_makers = ['eslint']
let g:neomake_scss_enabled_makers = ['stylelint']
let g:neomake_reason_enabled_makers = ['merlin']
let g:neomake_rust_enabled_makers = ['rustc']
let g:neomake_open_list = 0

let g:neomake_warning_sign = {
      \ 'text': ')=',
      \ 'texthl': 'WarningMsg',
      \ }

let g:neomake_error_sign = {
      \ 'text': 'D=',
      \ 'texthl': 'ErrorMsg',
      \ }

Plug 'benjie/neomake-local-eslint.vim'

" Plug 'Shougo/deoplete.nvim'
Plug 'Shougo/deoplete.nvim'

inoremap <silent><expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
let g:deoplete#enable_at_startup = 1
let g:deoplete#omni#input_patterns = {}
let g:deoplete#omni#input_patterns.gitcommit = ['#']
let g:deoplete#omni#input_patterns.reason = '[.\w]+'
let g:deoplete#file#enable_buffer_path = 1

Plug 'Shougo/neoinclude.vim'
Plug 'steelsojka/deoplete-flow'

" YouCompleteMe (also for autocomplete)
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }

" fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" let $FZF_DEFAULT_COMMAND = 'fd'
let g:fzf_layout = { 'window': 'enew' }
nnoremap <Leader>e :Files<CR>

map <Leader>sg :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
      \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
      \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

Plug 'mtth/scratch.vim'
Plug 'digitaltoad/vim-pug'

" Phoenix development
Plug 'elixir-lang/vim-elixir'
Plug 'avdgaag/vim-phoenix'

autocmd FileType elixir let b:noNeomake=1

" clojure development
Plug 'tpope/vim-fireplace' " for REPL stuff
Plug 'guns/vim-clojure-static' " for basic clojure stuff (highlighting, indentation, omnifunc)
Plug 'guns/vim-clojure-highlight' " more highlighting I guess ?
Plug 'junegunn/rainbow_parentheses.vim' " tasty parens
Plug 'snoe/nvim-parinfer.js' " TASTY parens
Plug 'venantius/vim-eastwood' " Eastwood for linting

" C++
au FileType c,cpp let g:deoplete#enable_at_startup = 0
au FileType c,cpp let b:noNeomake = 1
let g:clang_library_path = '/usr/lib/llvm-3.8/lib/libclang.so.1'

" ROS
Plug 'taketwo/vim-ros'

autocmd BufRead,BufNewFile *.launch setfiletype xml

call plug#end()

" escaping and basic stuff
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>= <C-w>=
nnoremap <Leader>, :noh<CR>
nnoremap <Leader> <C-W>
nnoremap <Leader>t :term<CR>
nnoremap <Leader>np :set nopaste <CR>
inoremap jk <Esc>
inoremap jw <Esc>:w<CR>
inoremap jq <Esc>:wq<CR>

nnoremap <Leader>, :noh<CR>

tnoremap jk <C-\><C-n>

let g:jsx_ext_required = 0

let g:scratch_horizontal = 0


autocmd! BufWritePre *.js call Fixmyjs()
let g:fixmyjs_executable = '/home/ben/.yarn/bin/eslint_d'

autocmd! BufWritePre *.re :ReasonPrettyPrint

au BufWritePre *.css :Stylefmt

" show trailing whitespace
set list
set listchars=tab:•\ ,trail:•,extends:»,precedes:«

set completeopt-=preview

autocmd StdinReadPre * let s:std_in=1

let g:bufferline_echo = 0

let g:loaded_matchparen = 1

" Automatically reloads this file when you save it
autocmd! BufWritePost *.vim :Resource
command! Edit e ~/.config/nvim/init.vim
command! E e ~/.config/nvim/init.vim
command! Resource source ~/.config/nvim/init.vim

" extra colorscheme stuff
set background=dark
let g:gruvbox_italic=1
let g:gruvbox_vert_split="bg1"

hi! link jsObjectKey GruvboxOrange
hi! link jsOperator GruvboxRed

colorscheme gruvbox

" unused stuff I may eventually want but probably not

function! DeleteInactiveBufs()
    "From tabpagebuflist() help, get a list of all buffers in all tabs
    let tablist = []
    for i in range(tabpagenr('$'))
        call extend(tablist, tabpagebuflist(i + 1))
    endfor

    "Below originally inspired by Hara Krishna Dara and Keith Roberts
    "http://tech.groups.yahoo.com/group/vim/message/56425
    for i in range(1, bufnr('$'))
        if bufexists(i) && !getbufvar(i,"&mod") && index(tablist, i) == -1
        "bufno exists AND isn't modified AND isn't in the list of buffers open in windows and tabs
            silent exec 'bwipeout!' i
        endif
    endfor
endfunction

" autocmd BufEnter * :call DeleteInactiveBufs()
