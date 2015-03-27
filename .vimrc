"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Management
" run :PluginInstall to install plugins from this file
" run :PluginClean to remove unused plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'      " let Vundle manage Vundle (required)

" Additional Plugins
Plugin 'scrooloose/nerdtree'              " awesome file/directory picker
Plugin 'marijnh/tern_for_vim'             " javascript autocomplete
Plugin 'mustache/vim-mustache-handlebars' " handlebars highlighting
Plugin 'rking/ag.vim'                     " search
Plugin 'tpope/vim-fugitive'               " git wrapper
Plugin 'kien/ctrlp.vim'                   " fuzzy file search
Plugin 'clausreinke/typescript-tools'     " typescript autocomplete
Plugin 'ciaranm/detectindent'             " auto-detect indentation per file

" End Vundle Setup
call vundle#end()



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" toggle nerdtree with t
:nmap t :NERDTreeToggle <CR>


" (autocomplete) auto close preview
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" (autocomplete) enter when omnicomplete is visible will select the current item
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" (autocomplete) jk to move up and down when omnicomplete is visible
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" key/action bindings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" navigate around split views with ctrl + some key
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype on " Enable file type detection
colorscheme badwolf
syntax on " Enable syntax highlighting
let mapleader="," " Change mapleader

set t_Co=256 " 256 colors
set nofoldenable " Disable folding
set nocompatible " Make Vim more useful
set clipboard=unnamed " Use the OS clipboard by default (on versions compiled with '+clipboard')
set wildmenu " Enhance comman-lien completion
set esckeys " Allow cursor keys in insert mode
set backspace=indent,eol,start " Allow backspace in insert mode
set ttyfast " Optimize for fast terminal connections
set gdefault " Add the g flag to search/replace by default
set encoding=utf-8 nobomb " Use UTF-8 without BOM
set nobackup " This isn't the 70s. We don't need backups and swap files
set noswapfile " This isn't the 70s. We don't need backups and swap files
set hidden " Allows opening of files without closing the current file
set nocompatible                " vim not vi
set exrc " Enable per-directory .vimrc files
set secure " Disable unsafe commands in per-directory .vimrc files
set number " Enable line numbers
set cursorline " Highlight current line
set lcs=tab:▸\ ,trail:·,nbsp:_ " Show invisible characters
set list
set hlsearch " Highlight searches
set ignorecase " Ignore case of searches
set incsearch " Highlight dynamically as pattern is typed
set laststatus=2 " Always show status line
set mouse=a " Enable mouse in all modes
set noerrorbells " Disable error bells
set nostartofline " Don't reset cursor to start of line when moving around
set ruler " Show the cursor position
set shortmess=atI " Don't show the intro message when starting Vim
set showmode " Show the current mode
set showcmd " Show the (partial) command as it's being typed
set scrolloff=3 " Start scrolling 3 lines before the horizontal window buffer
set autoindent " turn indenting on
set smartindent " do the right thing (mostly)



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" automatic commands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Automatic commands
" audocmd requires Vim 0.7.3 or greater
autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
autocmd BufReadPost * DetectIndent
autocmd BufRead,BufNewFile *.handlebars,*.hbs set ft=html syntax=handlebars
autocmd BufRead,BufNewFile *.ts setlocal filetype=typescript
autocmd BufReadPost *.jst.ejs set filetype=html
autocmd BufReadPost *.avsc    set syntax=json

" Strip trailing whitespace (,ss)
function! StripWhitespace()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>

