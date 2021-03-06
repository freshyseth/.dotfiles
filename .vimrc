" commented lines start with `"'

scriptencoding utf-8
set encoding=utf-8

" set jj keystroke as escape from insert mode
"inoremap jj <ESC>

" Indentation settings
" automatically indent lines (default)
" set autoindent

" set tab width, default is 8
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" Disable word-wrap
set nowrap

" Search settings
" select case-insenitive search (not default)
set ignorecase

" turn on search highlighting
set hlsearch


" Color/Display settings
" show cursor line and column in the status line
set ruler

" set background to dark for syntax-higlighting purposes
set background=dark

" display mode INSERT/REPLACE/...
set showmode

" show matching brackets
set showmatch

" enable syntax highlighting
syntax on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Folding v
"    Enable folding, but by default make it act like folding is off, because folding is annoying in anything but a few rare cases
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set foldenable " Turn on folding
"set foldmethod=indent " Make folding indent sensitive
"set foldlevel=100 " Don't autofold anything (but I can still fold manually)
"set foldopen-=search " don't open folds when you search into them
"set foldopen-=undo " don't open folds when you undo stuff
"set foldcolumn=3


" Open folds on:
"   - Horizontal movement upon the fold
"   - Movement to a mark
"   - Searches
"   - Movement to a tag
"   - Undo (or redo)
"set foldopen=hor,mark,search,tag,undo
"set foldcolumn=6

"set foldmethod=syntax " Make folding syntax sensitive

"fold all POD comments, nothing else
"set foldlevel=0
let perl_fold_pod=1
"let perl_fold_blocks=1
"let perl_fold=1
let javaScript_fold=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Folding ^
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" set .rpt and .sftp files to use perl syntax
au BufNewFile,BufRead *.rpt,*.sftp,*.cgi   setf perl


" Tabbed editing
" Ctrl_A e awaits a filename then edits that file in a new tab
" Ctrl_A c opens a new tab
" Ctrl_A n moves to the next tab in the list
" Ctrl_A p moves to the previous tab in the list
" Ctrl_A K close the current tab
nmap <C-A>e :tabedit 
nmap <C-A>c :tabnew<CR>
nmap <C-A>n :tabnext<CR>
nmap <C-A>p :tabprevious<CR>
nmap <C-A>K :tabclose<CR>


filetype plugin on
" Taglist settings
filetype on
let Tlist_Use_Horiz_Window = 0
let Tlist_Use_Right_Window = 1
" source ~/.vim/vimfunctions
map gt :call OpenSourceFile()<CR>


" Terminal/other settings
" set number of history items to retain
set history=100

" changes special characters in search patterns (default)
" set magic

" Show line numbers
set number

" Required to be able to use keypad keys and map missed escape sequences
set esckeys

" get easier to use and more user friendly vim defaults
" CAUTION: This option breaks some vi compatibility. 
"          Switch it off if you prefer real vi compatibility
set nocompatible

" Complete longest common string, then each full match
" enable this for bash compatible behaviour
" set wildmode=longest,full

" Ctrl_W e opens a vimshell in a horiz split window
" Ctrl_W E opens a vimshell in a vert split window
" nmap <C-W>e :new \| vimshell bash<CR>
" nmap <C-W>E :vnew \| vimshell bash<CR>

" Try to get the correct main terminal type
if &term =~ "xterm"
    let myterm = "xterm"
else
    let myterm =  &term
endif

if &term == "screen"
  set t_kb=
  fixdel
endif

let myterm = substitute(myterm, "screen",             "xterm", "")
let myterm = substitute(myterm, "cons[0-9][0-9].*$",  "linux", "")
let myterm = substitute(myterm, "vt1[0-9][0-9].*$",   "vt100", "")
let myterm = substitute(myterm, "vt2[0-9][0-9].*$",   "vt220", "")
let myterm = substitute(myterm, "\\([^-]*\\)[_-].*$", "\\1",   "")

" Here we define the keys of the NumLock in keyboard transmit mode of xterm
" which misses or hasn't activated Alt/NumLock Modifiers.  Often not defined
" within termcap/terminfo and we should map the character printed on the keys.
if myterm == "xterm" || myterm == "kvt" || myterm == "gnome"
    " keys in insert/command mode.
    map! <F2>     /
    map! <F3>     *
    map! <F4>     -
    map! <ESC>Ol  +
    map! <ESC>OM  
    map! <ESC>Ow  7
    map! <ESC>Ox  8
    map! <ESC>Oy  9
    map! <ESC>Ot  4
    map! <ESC>Ou  5
    map! <ESC>Ov  6
    map! <ESC>Oq  1
    map! <ESC>Or  2
    map! <ESC>Os  3
    map! <ESC>Op  0
    map! <ESC>On  .
    " keys in normal mode
    map  <F2>     /
    map  <F3>     *
    map  <F4>     -
    map  <ESC>Ol  +
    map  <ESC>OM  
    map  <ESC>Ow  7
    map  <ESC>Ox  8
    map  <ESC>Oy  9
    map  <ESC>Ot  4
    map  <ESC>Ou  5
    map  <ESC>Ov  6
    map  <ESC>Oq  1
    map  <ESC>Or  2
    map  <ESC>Os  3
    map  <ESC>Op  0
    map  <ESC>On  .
endif

" xterm but without activated keyboard transmit mode
" and therefore not defined in termcap/terminfo.
if myterm == "xterm" || myterm == "kvt" || myterm == "gnome"
    " keys in insert/command mode.
    map! <Esc>[H  <Home>
    map! <Esc>[F  <End>
    " Home/End: older xterms do not fit termcap/terminfo.
    map! <Esc>[1~ <Home>
    map! <Esc>[4~ <End>
    " Up/Down/Right/Left
    map! <Esc>[A  <Up>
    map! <Esc>[B  <Down>
    map! <Esc>[C  <Right>
    map! <Esc>[D  <Left>
    " KP_5 (NumLock off)
    map! <Esc>[E  <Insert>
    " PageUp/PageDown
    map <ESC>[5~ <PageUp>
    map <ESC>[6~ <PageDown>
    map <ESC>[5;2~ <PageUp>
    map <ESC>[6;2~ <PageDown>
    map <ESC>[5;5~ <PageUp>
    map <ESC>[6;5~ <PageDown>
    " keys in normal mode
    map <ESC>[H  0
    map <ESC>[F  $
    " Home/End: older xterms do not fit termcap/terminfo.
    map <ESC>[1~ 0
    map <ESC>[4~ $
    " Up/Down/Right/Left
    map <ESC>[A  k
    map <ESC>[B  j
    map <ESC>[C  l
    map <ESC>[D  h
    " KP_5 (NumLock off)
    map <ESC>[E  i
    " PageUp/PageDown
    map <ESC>[5~ 
    map <ESC>[6~ 
    map <ESC>[5;2~ 
    map <ESC>[6;2~ 
    map <ESC>[5;5~ 
    map <ESC>[6;5~ 
endif

" xterm/kvt but with activated keyboard transmit mode.
" Sometimes not or wrong defined within termcap/terminfo.
if myterm == "xterm" || myterm == "kvt" || myterm == "gnome"
    " keys in insert/command mode.
    map! <Esc>OH <Home>
    map! <Esc>OF <End>
    map! <ESC>O2H <Home>
    map! <ESC>O2F <End>
    map! <ESC>O5H <Home>
    map! <ESC>O5F <End>
    " Cursor keys which works mostly
    " map! <Esc>OA <Up>
    " map! <Esc>OB <Down>
    " map! <Esc>OC <Right>
    " map! <Esc>OD <Left>
    map! <Esc>[2;2~ <Insert>
    map! <Esc>[3;2~ <Delete>
    map! <Esc>[2;5~ <Insert>
    map! <Esc>[3;5~ <Delete>
    map! <Esc>O2A <PageUp>
    map! <Esc>O2B <PageDown>
    map! <Esc>O2C <S-Right>
    map! <Esc>O2D <S-Left>
    map! <Esc>O5A <PageUp>
    map! <Esc>O5B <PageDown>
    map! <Esc>O5C <S-Right>
    map! <Esc>O5D <S-Left>
    " KP_5 (NumLock off)
    map! <Esc>OE <Insert>
    " keys in normal mode
    map <ESC>OH  0
    map <ESC>OF  $
    map <ESC>O2H  0
    map <ESC>O2F  $
    map <ESC>O5H  0
    map <ESC>O5F  $
    " Cursor keys which works mostly
    " map <ESC>OA  k
    " map <ESC>OB  j
    " map <ESC>OD  h
    " map <ESC>OC  l
    map <Esc>[2;2~ i
    map <Esc>[3;2~ x
    map <Esc>[2;5~ i
    map <Esc>[3;5~ x
    map <ESC>O2A  ^B
    map <ESC>O2B  ^F
    map <ESC>O2D  b
    map <ESC>O2C  w
    map <ESC>O5A  ^B
    map <ESC>O5B  ^F
    map <ESC>O5D  b
    map <ESC>O5C  w
    " KP_5 (NumLock off)
    map <ESC>OE  i
endif

if myterm == "linux"
    " keys in insert/command mode.
    map! <Esc>[G  <Insert>
    " KP_5 (NumLock off)
    " keys in normal mode
    " KP_5 (NumLock off)
    map <ESC>[G  i
endif

" This escape sequence is the well known ANSI sequence for
" Remove Character Under The Cursor (RCUTC[tm])
map! <Esc>[3~ <Delete>
map  <ESC>[3~    x

" Only do this part when compiled with support for autocommands. 
if has("autocmd") 
  " When editing a file, always jump to the last known cursor position. 
  " Don't do it when the position is invalid or when inside an event handler 
  " (happens when dropping a file on gvim). 
  autocmd BufReadPost * 
    \ if line("'\"") > 0 && line("'\"") <= line("$") | 
    \   exe "normal g`\"" | 
    \ endif 
    " au FileType xml exe ":silent 1,$!xmllint --format --recover - 2>/dev/null"
 
endif " has("autocmd")

" Changed default required by SuSE security team
set modelines=0

" Added by websters (as from puccerm)
" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
  set undodir=~/.vim/undo
endif

" Change the default vimdiff colorscheme
if &diff
    colorscheme evening
endif

" Pathogen plugin manager for vim
execute pathogen#infect()

" always show status line
set laststatus=2

if !has('gui_running')
  set t_Co=256
endif

" lightline configs
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'component': {
      \   'readonly': '%{&readonly?"⭤":""}',
      \ },
      \ 'separator': { 'left': '⮀', 'right': '⮂' },
      \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
      \ }

let g:tmuxline_separators = {
  \ 'left': '⮀',
  \ 'left_alt': '>',
  \ 'right': '⮂',
  \ 'right_alt': '<',
  \ 'space': ' '}

function! MyModified()
  if &filetype == "help"
    return ""
  elseif &modified
    return "+"
  elseif &modifiable
    return ""
  else
    return ""
  endif
endfunction

function! MyReadonly()
  if &filetype == "help"
    return ""
  elseif &readonly
    return "⭤"
  else
    return ""
  endif
endfunction

function! MyFugitive()
  return exists('*fugitive#head') ? fugitive#head() : ''
endfunction

function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
       \ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
       \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

" get easier to use and more user friendly vim defaults
" /etc/vimrc ends here
