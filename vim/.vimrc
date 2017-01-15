set nocompatible
set modelines=0

"Plugins
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()
"Plugin 'vim-pandoc/vim-pandoc'
"Plugin 'vim-pandoc/vim-pandoc-syntax'
filetype plugin indent on

"Graphics
set ttyfast
syntax enable
set number
set laststatus=0
"Colorscheme
syntax on
color molokai
highlight LineNr ctermbg=NONE ctermfg=59
highlight VertSplit ctermbg=NONE ctermfg=59

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
"nnoremap p "*p
"nnoremap y "+y

"Window Titles
autocmd BufReadPost,FileReadPost,BufNewFile,BufEnter * call system("tmux rename-window 'vim | " . expand("%:t") . "'")
autocmd VimLeave * call system("tmux rename-window 'tmux'")

"Keybindings
let mapleader=","
vnoremap <C-c> "*y
nnoremap <backspace> <NOP>
"Windows
nnoremap <leader>/ <C-w>v<C-w>l
nnoremap <leader>. <C-w>s<C-w>j
nnoremap <C-h> <C-w>h
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j

"Window Title
autocmd BufEnter * let &titlestring = "vim | " . expand("%:t")
autocmd BufReadPost,FileReadPost,BufNewFile,BufEnter * call system("tmux rename-window 'vim | " . expand("%:t") . "'")
autocmd VimLeave * call system("tmux setw automatic-rename")

"nerdcommenter
let g:NERDSpaceDelims = 1

"nerdtree
nnoremap <leader>d :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.o$', '\.d$']
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"Pandoc
let g:pandoc#modules#disabled = ["spell"]
let g:pandoc#folding#fdc = 0
let g:pandoc#syntax#conceal#use = 0

"Ctags
set tags=tags; "The semicolon makes vim search in parent dir's, too

"Case SENSITIVE matching for tags
" fun! MatchCaseTag()
    " let ic = &ic
    " set noic
    " try
        " exe 'tjump ' . expand('<cword>')
    " finally
       " let &ic = ic
    " endtry
" endfun
" nnoremap <silent> <c-]> :call MatchCaseTag()<CR>
