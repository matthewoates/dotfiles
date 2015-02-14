" Vundle Setup
set nocompatible                " vim not vi
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'      " let Vundle manage Vundle (required)

" Additional Plugins
Plugin 'scrooloose/nerdtree'

Plugin 'marijnh/tern_for_vim' " javascript autocomplete
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'rking/ag.vim' " search
Plugin 'tpope/vim-fugitive' " git wrapper
Plugin 'kien/ctrlp.vim' " fuzzy file search
Plugin 'clausreinke/typescript-tools' " typescript autocomplete

call vundle#end()
filetype indent plugin on       " File-type detection
" End Vundle Setup

" GENERAL
syntax on                       " Syntax highlighting
set modelines=0                 " Disable modelines for security reasons
set hidden                      " Keep buffers hidden instead of closing
set wildmenu                    " Command line completion
set wildmode=list:longest
set visualbell                  " No beeping
set number                      " Show line numbers
set ruler                       " Show line number and column for cursor
set cursorline                  " Highlight current line
set scrolloff=10                " Line padding above/below current line
set backspace=indent,eol,start
set title
set laststatus=2                " Show status bar
let mapleader=","               " New leader key
au FocusLost * :wa              " Save when switching to a new window

if has('persistent_undo')
  silent !mkdir -p ~/.vim/backups
  set undodir=~/.vim/backups    " Directory to store all undo files
  set undofile                  " Keep undo file to persist changes
endif

" CODE
set showmatch                   " Show matching braces...
set matchtime=3               " ...for half of a second

" SPACING / TABS
set autoindent
set smartindent
set expandtab                   " Use spaces instead of tab characters
set shiftwidth=2
set tabstop=2
set softtabstop=2

" SEARCHING
set hlsearch                    " Highlight search results
set incsearch                   " Instant feedback on searching
set ignorecase                  " Case insensitive searching...
set smartcase                   " ...unless we have capital letters

" Set syntax highlighting for odd file types
au BufReadPost *.jst.ejs set filetype=html
au BufReadPost *.avsc    set filetype=avsc
au BufReadPost *.avsc    set syntax=json

" THEME
set t_Co=256
colo molokai

" NERDTree plugin
map  <C-n> :NERDTreeToggle<CR>
let NERDTreeWinSize=50

" Command T
let CommandTMaxHeight=10
let CommandTWildIgnore=&wildignore . ',*.swp,*.swo,*~,.keep,node_modules/*'

" Ag - remap Ag to Ag! so the first result isn't opened automatically
ca Ag Ag!

" KEY-MAPPINGS
" Quick escape
inoremap jj <ESC>

" BETTER SPLIT WINDOWS
" (W)indow (N)ew [vertical]
nnoremap <leader>wn <C-w>v<C-w>l
" (W)indow (S)plit [horizontal]
nnoremap <leader>ws <C-w>s<C-w>w
" (W)indow (C)lose
nnoremap <leader>wc <C-w><C-c>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
