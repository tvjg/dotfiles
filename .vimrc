set nocompatible  " Don't emulate vi. For vim-align

filetype off
call pathogen#runtime_append_all_bundles() 
call pathogen#helptags()


set hidden   " Background buffer without writing to disk
set autoread " Re-read on file change

" Tab complete up to the point of ambiguity and cycle 
set wildmode=list:longest

" Begin scroll three lines from edge 
set scrolloff=3

set autoindent
set expandtab
set softtabstop=2
set shiftwidth=2

syntax on
set showmatch             " Matching braces
set visualbell
set cursorline            " Highlight current line
filetype plugin indent on
colorscheme vividchalk

set shortmess=tI          " Truncate beginning of filename if too long
                          " Suppress vim intro message

set wrap
set linebreak
set showbreak=--->

" Why bother when you have a VCS?
set nobackup
set nowritebackup
set noswapfile
set history=100

" Searching
set incsearch
set ignorecase  " When 'ignorecase' and 'smartcase' are both on, if 
set smartcase   " a pattern contains an uppercase letter, it is case 
                " sensitive, otherwise, it is not. 

"
" Key mappings
"
let mapleader=","
set pastetoggle=<F11> " Toggle paste mode to reduce paste indent suckage

" Navigate by editor lines, not real lines
nnoremap j gj
nnoremap k gk

map <Leader>f :NERDTreeToggle<CR>

" Open vimrc for fast editing
map <Leader>e :e! ~/.vimrc<CR> 

" Hide search highlighting
map <Leader>h :set invhls <CR>

"
" Autocommands
"
if has('autocmd')
  
  " Reload vimrc on save
  "   http://stackoverflow.com/questions/2400264/is-it-possible-to-apply-vim-configurations-without-restarting
  augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
  augroup END
endif
