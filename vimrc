set nocompatible  " Don't emulate vi. For vim-align

" Hmtl vim indent settings
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

" fzf fuzzy finder settings
let g:fzf_layout = { 'down': '16%' }

" To disable a plugin, add it's bundle name to the following list
let g:pathogen_disabled = []

if !executable('git')
  call add(g:pathogen_disabled, 'fugitive')
endif

runtime pack/tvjg/start/pathogen/autoload/pathogen.vim
call pathogen#infect() 
call pathogen#helptags()

set hidden          " Background buffer without writing to disk
set autoread        " Re-read on file change
set guioptions=aec  " Autoselect, menu and prefer console questions over popups
set mouse=a

if version >= 703
  set relativenumber  " Relative line numbering
endif

" Tab complete up to the point of ambiguity and cycle 
set wildmode=list:longest

" Statusline
set statusline=%<%F       "tail of the filename

"display a warning if fileformat isnt unix
set statusline+=%#warningmsg#
set statusline+=%{&ff!='unix'?'['.&ff.']':''}
set statusline+=%*

"display a warning if file encoding isnt utf-8
set statusline+=%#warningmsg#
set statusline+=%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.']':''}
set statusline+=%*

set statusline+=%h " help file flag
set statusline+=%r " read only flag
set statusline+=%m " modified flag

set statusline+=\  " Space.

" Line and column position and counts.
set statusline+=(line\ %l\/%L,\ col\ %03c)

set statusline+=\      " Space.

set statusline+=%=     " right align.

set statusline+=%{&ft} " filetype (python).

" Begin scroll three lines from edge 
set scrolloff=3

set expandtab
set softtabstop=2
set shiftwidth=2

set showmatch             " Matching braces
set visualbell
set cursorline            " Highlight current line
set cursorcolumn          " Highlight current column

colorscheme torte

set shortmess=tI          " Truncate beginning of filename if too long
                          " Suppress vim intro message

set wrap
set linebreak
set showbreak=--->

" Why bother when you have a VCS?
set nobackup
set nowritebackup
set noswapfile

" Searching
set ignorecase  " When 'ignorecase' and 'smartcase' are both on, if 
set smartcase   " a pattern contains an uppercase letter, it is case 
                " sensitive, otherwise, it is not. 

"
" Key mappings
"
let mapleader=","

" Navigate by editor lines, not real lines
nnoremap j gj
nnoremap k gk

" fzf
map <Leader>f :GitFiles<CR>
map <Leader>b :Buffers<CR>

" Open vimrc for fast editing
map <Leader>e :e! ~/.vimrc<CR> 

" Write buffer out with sudo
"   http://stackoverflow.com/a/96492/623846
if executable('sudo') && executable('tee')
  cmap w!! %!sudo tee > /dev/null %
endif

"
" Autocommands
"
if has('autocmd')
  
  " Reload vimrc on save
  "   http://stackoverflow.com/questions/2400264/is-it-possible-to-apply-vim-configurations-without-restarting
  augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC
  augroup END

endif
