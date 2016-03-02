" --------------------- Miscellaneous stuff ------------------------------
" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed

" Enhance command-line completion
set wildmenu

" Allow cursor keys in insert mode
set esckeys

" Enable mouse in all modes
set mouse=a

" Optimize for fast terminal connections
set ttyfast

" Use UTF-8 without BOM
"set encoding=utf-8 nobomb

" Centralize backups, swapfiles and undo history
set backupdir=~/.config/nvim/backups
set directory=~/.config/nvim/swaps
if exists("&undodir")
    set undodir=~/.config/nvim/undo
endif

set viminfo+=! " make sure vim history works

" Show the cursor position
set ruler

" Show the current mode
set showmode

" Show the filename in the window titlebar
set title

" Disable error bells
set noerrorbells


" -------------------- Searching and replace ----------------------------
" Add the g flag to search/replace by default
set gdefault

" Ignore case of searches
"set ignorecase

" Highlight dynamically as pattern is typed
set incsearch


" -------------------- Editing -----------------------------------------
" Allow backspace in insert mode
set backspace=indent,eol,start

" Don’t add empty newlines at the end of files
set binary
set noeol

" Enable syntax highlighting
syntax on

" Never use tabs, only spaces :)
set expandtab

" Make tabs as wide as two spaces
set tabstop=2

" Number of spaces used for auto indent, I like 2 everywhere
set shiftwidth=2

" Enable line numbers
set number

" Start scrolling three lines before the horizontal window border
set scrolloff=3

" Always show status line
set laststatus=2

" Don’t reset cursor to start of line when moving around.
set nostartofline

" When using diff, show filler lines and always open diff in vertical mode
set diffopt=filler,vertical

" Use virtual edit, cursor should go everywhere, all the time
set virtualedit=all

" Don't wrap long lines, let em be
set nowrap

set wmh=0 " window minimum height or something reduces splits to a single line

"Set format options, see help for fo-table
set formatoptions=qj
set textwidth=80
set colorcolumn=80


" ------------- Filetype based plugin usage and autocommands -----------
" Enable filetype detection and filetype plugins
filetype plugin indent on

" Some autocommands based on filetypes
if has("autocmd")
    " Treat .json files as .js
    autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript

    " Auto fold coffeesript files using indentation, may not need it
    autocmd BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable

    " Delete fugitive buffers after they are hidden
    autocmd BufReadPost fugitive://* set bufhidden=delete
endif

" ------------- Plugin setup ------------------------------------------
" Execute pathogen and load awesome plugins
execute pathogen#infect()
:Helptags

" Setup solarized colorscheme because it is simply right
set t_Co=16
set background=dark
colorscheme solarized

" Use vertical split when using coffeescript watch
let coffee_watch_vert = 1

" Add the current branch using fugitive to the status line
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P


" ------------- Mappings ----------------------------------------------
"
" Change mapleader
let mapleader=" "

" Strip trailing whitespace (,ss)
function! StripWhitespace()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    :%s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfunction

noremap <leader>ss :call StripWhitespace()<CR>

" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

" Window mappings
" ---- Moving between windows using ,
" map <leader>h <C-w>h
" map <leader>j <C-w>j
" map <leader>k <C-w>k
" map <leader>l <C-w>l

map <leader><lt> :tabprevious<CR>
map <leader>> :tabnext<CR>

map <leader>. :tabnext<CR>
map <leader>, :tabprevious<CR>
map <leader>t :tabnew<CR>

noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-x> <C-w>c

noremap <leader>v <C-w>v
noremap <leader>s <C-w>s
noremap <leader>c <C-w>c
noremap <leader>x <C-w>x
noremap <leader>o <C-w>o


" Both the auxilary windows at the pinkies
map <leader>a :NERDTreeToggle<CR>
map <leader>; :TagbarToggle<CR>
"
" noremap <Space> za


" ---- auto complete update ---
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g :YcmCompleter goToDefinitionElseDeclaration<CR>

noremap <F3> :Autoformat<CR>


" ----------- Garbage ------------------------------------------------

"map <C-J> <C-W>j<C-W>_ " open and maximize the split below
"map <C-K> <C-W>k<C-W>_ " open and maximize the split above


" Enable per-directory .vimrc files and disable unsafe commands in them
" set exrc
" set secure
" Show “invisible” characters
"set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
"set list
"
" Highlight searches
" set hlsearch
"
" Respect modeline in files
" set modeline
" set modelines=4


" Don’t show the intro message when starting Vim
" set shortmess=atI
" Show the (partial) command as it’s being typed
" set showcmd