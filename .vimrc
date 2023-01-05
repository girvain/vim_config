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
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'xolox/vim-misc'
"Plug 'w0rp/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'jiangmiao/auto-pairs'
"Plug 'tpope/vim-vinegar'
Plug 'corntrace/bufexplorer'
Plug 'embear/vim-localvimrc'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'preservim/nerdcommenter'
"Plug 'prettier/vim-prettier'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'christoomey/vim-tmux-navigator'
Plug 'liuchengxu/vim-which-key'
" On-demand lazy load
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
" this needs to be last apparently
Plug 'ryanoasis/vim-devicons'
" To register the descriptions when using the on-demand load feature,
" use the autocmd hook to call which_key#register(), e.g., register for the Space key:
" autocmd! User vim-which-key call which_key#register('<Space>', 'g:which_key_map')
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
set shiftwidth=2
set tabstop=2
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
let g:gruvbox_contrast_dark = 'medium'
colorscheme gruvbox
"colorscheme nord

"fonts and icons
"set guifont=NerdHackFontMono:h14
let g:airline_powerline_fonts = 1

"======================= Plugin Config =============================
" FZF"
set rtp+=/usr/local/opt/fzf
let g:fzf_layout = { 'down':  '30%'}

" Ale linter
"let g:ale_php_phpcs_executable ='/Users/gavinross/Work/wetherspoons/wetherspoons/vendor/wetherspoons/client/vendor/bin/phpcs --standard=sniffs.xml'
"let g:ale_php_phpcs_standard='/Users/gavinross/Work/wetherspoons/wetherspoons/vendor/wetherspoons/client/sniffs.xml'
"let g:ale_php_phpcbf_executable = '/Users/gavinross/Work/wetherspoons/wetherspoons/vendor/wetherspoons/client/vendor/bin/phpcbf'
"let g:ale_php_phpcbf_standard = '/Users/gavinross/Work/wetherspoons/wetherspoons/vendor/wetherspoons/client/sniffs.xml'

"let g:ale_fixers = {'php': ['phpcbf']}
"let b:ale_linters = ['php', 'phpcs', 'javascript', 'eslint']
""let g:ale_root = {'php': ['/Users/gavinross/Work/wetherspoons/wetherspoons']}
"let g:airline#extensions#ale#enabled = 1

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

" python
let g:python3_host_prog = expand('/usr/local/bin/python3')

" Ale
" Fix files with prettier, and then ESLint.
"let b:ale_fixers = {'javascript': ['prettier', 'eslint']}

" Prettier
"let g:prettier#autoformat = 1
"let g:prettier#autoformat_require_pragma = 0

" Vim-Go
let g:go_def_mapping_enabled = 0
let g:go_code_completion_enabled = 0
let g:go_doc_keywordprg_enabled = 0
" Auto formatting and importing
let g:go_fmt_autosave = 1

" WhichKey
let g:mapleader = "\<Space>"
let g:maplocalleader = ','
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>

"======================= Auto Commands =============================

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
nnoremap <leader>t :NERDTreeToggle<cr>

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" linter commands
nnoremap <leader>le :CocDiagnostics<cr>
" Remap keys for applying codeAction to the current line.
nmap <leader>lc  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>lf  <Plug>(coc-fix-current)
" Symbol renaming.
nmap <leader>lr <Plug>(coc-rename)

"nnoremap <leader>le :ALEPopulateLocList<cr>
"nnoremap <leader>lf :ALEFix<cr>
