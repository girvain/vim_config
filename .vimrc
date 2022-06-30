set nocompatible              " be iMproved, required
filetype off

let g:ale_disable_lsp = 1

"============================= Plugins ==================================
" set the runtime path to include Vundle and initialize
call plug#begin()

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'morhetz/gruvbox'
Plug 'arcticicestudio/nord-vim'
Plug 'vimwiki/vimwiki'
Plug 'w0rp/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'jiangmiao/auto-pairs'
"Plug 'tpope/vim-vinegar'
Plug 'corntrace/bufexplorer'
Plug 'ryanoasis/vim-devicons'

" All of your Plugins must be added before the following line
call plug#end()            " required
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
"colorscheme nord

"fonts and icons
set guifont=NerdHackFontMono:h11
let g:airline_powerline_fonts = 1

"======================= Plugin Config =============================
" FZF"
set rtp+=/usr/local/opt/fzf
let g:fzf_layout = { 'down':  '30%'}

" Ale linter
let g:ale_php_phpcs_executable ='/Users/gavinross/Work/wetherspoons/wetherspoons/vendor/wetherspoons/client/vendor/bin/phpcs --standard=sniffs.xml'
let g:ale_php_phpcs_standard='/Users/gavinross/Work/wetherspoons/wetherspoons/vendor/wetherspoons/client/sniffs.xml'
let b:ale_linters = ['php', 'phpcs', 'javascript', 'eslint']
let g:ale_php_phpcbf_executable = '/Users/gavinross/Work/wetherspoons/wetherspoons/vendor/wetherspoons/client/vendor/bin/phpcbf'
let g:ale_php_phpcbf_standard = '/Users/gavinross/Work/wetherspoons/wetherspoons/vendor/wetherspoons/client/sniffs.xml'
let g:ale_fixers = {'php': ['phpcbf']}
"let g:ale_root = {'php': ['/Users/gavinross/Work/wetherspoons/wetherspoons']}
let g:airline#extensions#ale#enabled = 1

" Coc
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

set guifont=DroidSansMono\ Nerd\ Font:h11

"======================= Keyboard Shortcuts =============================
" remap C-w for window management
nnoremap <leader>w <C-w>
nnoremap <leader>wo :only <cr>
nnoremap <leader>wc :hide <cr>

" buffer shortcuts
"nnoremap <leader>bl :ls <cr>
nnoremap <leader>bn :bn <cr>
nnoremap <leader>bp :bp <cr>
nnoremap <leader>bd :bd <cr>

" remap vimwiki defaults to not clash with window stuff
nmap <Leader>vww <Plug>VimwikiIndex 
nmap <Leader>vws <Plug>VimwikiUISelect

" find files, code and buffers with fzf
"nmap <Leader>f :FZF<CR>
nnoremap <leader>ff :FZF<cr>
nnoremap <leader>fg :Ag<cr>
nnoremap <leader>fb :Buffers<cr>
nnoremap <leader>fr :History<cr>

" toggle buffer list
nnoremap <leader>b :BufExplorer<cr>
nnoremap <leader>bv :BufExplorerVerticalSplit<cr>
nnoremap <leader>bs :BufExplorerHorizontalSplit<cr>

" toggle file explorer
nnoremap <leader>e :Explore<cr>

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" linter commands
nnoremap <leader>le :ALEPopulateLocList<cr>
nnoremap <leader>lf :ALEFix<cr>
