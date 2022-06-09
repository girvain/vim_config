set nocompatible              " be iMproved, required
filetype off

let g:ale_disable_lsp = 1

"============================= Plugins ==================================
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'morhetz/gruvbox'
Plugin 'vimwiki/vimwiki'
Plugin 'w0rp/ale'
Plugin 'neoclide/coc.nvim'
Plugin 'sheerun/vim-polyglot'
Plugin 'preservim/nerdtree'
Plugin 'tpope/vim-fugitive'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"======================= Basic Editor config =============================
inoremap jk <ESC>
let mapleader = "\<Space>"
syntax on
set number
set smartindent
set cursorline
set clipboard=unnamed " lets be able to cut and paste
set shiftwidth=4
set tabstop=4
"set expandtab " spaces instead of tab
set autoindent
set backspace=indent,eol,start

"remap exiting termainl to esc
:tnoremap <Esc> <C-\><C-n>

"search settings (this is a comment in vim)
set incsearch
set ignorecase
set hlsearch

" set colorscheme
let g:gruvbox_bold = '1' 
let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox

"======================= Plugin Config =============================
set rtp+=/usr/local/opt/fzf


" Ale linter
let g:ale_php_phpcs_executable ='/Users/gavinross/Work/wetherspoons/wetherspoons/vendor/wetherspoons/client/vendor/bin/phpcs --standard=sniffs.xml'
let g:ale_php_phpcs_standard='/Users/gavinross/Work/wetherspoons/wetherspoons/vendor/wetherspoons/client/sniffs.xml'
let b:ale_linters = ['php', 'phpcs']
let g:ale_php_phpcbf_executable = '/Users/gavinross/Work/wetherspoons/wetherspoons/vendor/wetherspoons/client/vendor/bin/phpcbf'
let g:ale_php_phpcbf_standard = '/Users/gavinross/Work/wetherspoons/wetherspoons/vendor/wetherspoons/client/sniffs.xml'
let g:ale_fixers = {'php': ['phpcbf']}
"let g:ale_root = {'php': ['/Users/gavinross/Work/wetherspoons/wetherspoons']}
let g:airline#extensions#ale#enabled = 1

" Coc
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

"======================= Keyboard Shortcuts =============================
" remap C-w for window management
nnoremap <leader>w <C-w>
nnoremap <leader>wo :only <cr>
" buffer shortcuts
nnoremap <leader>bl :ls <cr>
nnoremap <leader>bn :bn <cr>
nnoremap <leader>bp :bp <cr>
" remap vimwiki defaults to not clash with window stuff
nmap <Leader>vww <Plug>VimwikiIndex 
nmap <Leader>vws <Plug>VimwikiUISelect
" find files with fzf
nmap <Leader>f :FZF<CR>


" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
