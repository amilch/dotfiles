set nocompatible
set modelines=0
filetype off

"Plugins
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'jacoborus/tender'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'
call vundle#end()
filetype plugin indent on

"Graphics
set ttyfast
syntax enable
set number
"Colorscheme: Tender
if (has("termguicolors"))
    set termguicolors
endif
colorscheme tender
set laststatus=0

"Cursorline
augroup CursorLine
  au!
  au InsertEnter * setlocal cursorline
  au InsertLeave * setlocal nocursorline
augroup END

"Folds
set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=indent
nnoremap <space> za

"Tabs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set copyindent

"Scrolling
set scrolloff=3

"Behaviour
set hidden
set wildmenu                "Tab command completion
set wildmode=list:longest
set visualbell
set noerrorbells
set ignorecase              "Search
set smartcase
set hlsearch
set incsearch
set gdefault
set noswapfile              "Backup
set nobackup
set history=10
set undolevels=1000
set wildignore=*.swp,*.bak,*.o
set backspace=indent,eol,start

"Keybindings
let mapleader=","
vnoremap <C-c> "*y
noremap <leader>d :NERDTreeToggle<CR>
nnoremap <backspace> <NOP>
"Windows
nnoremap <leader>h <C-w>v<C-w>l
nnoremap <leader>j <C-w>s<C-w>j
nnoremap <C-h> <C-w>h
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j

"Pandoc
let g:pandoc#modules#disabled = ["spell"]
let g:pandoc#folding#fdc = 0
let g:pandoc#syntax#conceal#use = 0
