set nocompatible  " Don't emulate vi. For vim-align

" Hmtl vim indent settings
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

" CtrlP file finder settings
" Sane ignore settings
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$\|node_modules$' 

" Use vim-dispatch to search the results in background
let g:ack_use_dispatch=1

" To disable a plugin, add it's bundle name to the following list
let g:pathogen_disabled = []

if !executable('ctags')
  call add(g:pathogen_disabled, 'tagbar')
endif

if !executable('git')
  call add(g:pathogen_disabled, 'fugitive')
endif

if executable('col') && executable('man')
  runtime ftplugin/man.vim
  nnoremap <silent>K :<C-U>exe "Man" v:count "<cword>"<CR>
endif

runtime bundle/pathogen/autoload/pathogen.vim
call pathogen#infect() 
call pathogen#helptags()

if has('win32') || has('win64')
  behave mswin

  if has("gui_running")
    set guifont=Consolas:h10:cANSI
  endif

  " http://cfc.kizzx2.com/index.php/gvim-e303-unable-to-open-swap-file-for-no-name-recovery-impossible/ "
  set directory=.,$VIM\vimfiles\tmp
endif

" Nicked from tpope/vim-sensible
" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

set hidden          " Background buffer without writing to disk
set autoread        " Re-read on file change
set guioptions=aec " Autoselect, menu and prefer console questions over popups
set mouse=a

" Tab complete up to the point of ambiguity and cycle 
set wildmode=list:longest

" Show nice info in ruler
set ruler
set laststatus=2

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

set autoindent
set expandtab
set softtabstop=2
set shiftwidth=2

syntax on
set showmatch             " Matching braces
set visualbell
set cursorline            " Highlight current line
filetype plugin indent on
set t_Co=256
colorscheme jellybeans 
"set background=dark

let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

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
set pastetoggle=<leader>p " Toggle paste mode to reduce paste indent suckage

" Navigate by editor lines, not real lines
nnoremap j gj
nnoremap k gk

if executable('ctags')
  nmap <Leader>t :TagbarToggle<CR>
endif

" Remap to avoid clobbering autocompletion
let g:ctrlp_map = '<Leader>f'
map <Leader>b :CtrlPBuffer<CR>

" Open vimrc for fast editing
map <Leader>e :e! ~/.vimrc<CR> 

" Hide search highlighting
map <Leader>h :set invhls <CR>

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

  " Syntax highlighting for cakephp templates
  "   http://www.acloudtree.com/ubuntu-vim-cakephp-12-ctp-syntax-highlighting/
  augroup highlight
    au!
    autocmd BufEnter *.ctp set syn=php
  augroup END

endif
