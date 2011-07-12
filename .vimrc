filetype off

call pathogen#runtime_append_all_bundles() 

"Background buffer without writing to disk "
set hidden

" Tab complete up to the point of ambiguity and then cycle other options
set wildmode=list:longest

" Begin scrolling three lines from edge of screen "
set scrolloff=3

set autoindent
set expandtab
set softtabstop=2
set shiftwidth=2

syntax on
filetype plugin indent on
colorscheme vividchalk
set incsearch
set shortmess=tI
set visualbell
set nowrap

let mapleader=","

map <Leader><F2> :NERDTreeToggle<CR>
