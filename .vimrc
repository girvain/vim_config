set nocompatible              " be iMproved, required
filetype off

"============================= Plugins ==================================
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'vim-airline/vim-airline'
Plugin 'morhetz/gruvbox'
Plugin 'vimwiki/vimwiki'

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
