" Notes : mark z & x used for program
" Notes : mark i,j,k,l,m,n,o,p used for user
" Notes : mark s is temp register for system, only one time use, not persist !, dont use with other macro

" Notes : register 1,2,3... used for saving word (not script or variable)
" Notes : register v,b,n,m used for saving word (not script or variable)
" Notes : register z used for register-appending function
" Notes : register a used for general purpose macro register
" Notes : register s,d,f,g,h is temp register for system, only one time use, not persist !, dont use with other macro
" Notes : register y,x used for mapping X and normal yank

" Notes : global variable g:custom_temp is temp register, only one time use, not persist !
" Notes : global variable g:custom_temp1 is temp register, only one time use, not persist !
" Notes : global variable g:custom_temp{n} is temp register, only one time use, not persist !
" Notes : register q,w,e,r,t used for user register

"================== GENERAL =================

" set title string, for vim-phobic people
set titlestring=%{expand(\"%:p:t\")}%m\ (%{substitute(expand(\"%:p:h\"),'/home/pulpen','~','')})\ -\ Koding
set shiftround	" round tab movement
if !isdirectory($HOME . "/.vim-backups")
    call mkdir($HOME . "/.vim-backups", "p", 0700)
endif
set directory=$HOME/.vim-backups/	" set swp files path
let $TMP="$HOME/.temp"
set nocompatible	" be improved required
set noeol	"prevent adding newline to vi
set nofixendofline "prevent adding newline to vi
filetype off	" required
:command! Mktmpdir call mkdir(fnamemodify(tempname(),":p:h"),"",0777)  


"- All your searches will be case insensitive /\C to make sensitive, use this to be able to get more option on ex command suggestion
set ignorecase 
"- Your search will be case sensitive if it contains an uppercase letter
" set smartcase 
" show command sequence
set showcmd

"set smartindent " auto indent on enter
"set paste " (biar ga auto indent pas paste)
"set pastetoggle=<F3>
set shell=/bin/bash\ -i

let mapleader = ','	"change leader char
set mouse=a	"enable mouse click
" disable automatic wraping
set tw=0

" tag file path
set tags=./tags,tags,/home/user/commontags,$HOME/Documents/.script/settings/tags,$HOME/.vimtags

" CAN MOVE ON EMPTY LINE 
" go to new empty line, keep the cursor in the previous column
" #set ve
" set virtualedit=all 
set virtualedit=onemore
" set virtualedit=block 

"make h and l goto to next/prev line if needed 
set whichwrap+=<>,[,],h,l
" set whichwrap+=hl " actually this one is buggy
" set nocompatible " ini bikin ga bisa whichwrap

": Automatically re-read files if unmodified inside Vim. #autoload
" set autoread

" show hidden item there is cursor at that item's line
set concealcursor=

" hide all concealed item
set conceallevel=2

" advanced ex autocomplete (:h wildmenu)
set wildmenu
set wildmode=longest,full

" persistant undo
" if has("persistent_undo")
set undodir=~/.vim/undodir
set undofile
" endif

"===================VISUALS=================

"speed up syntax highlighting
set lazyredraw
" kalo masih ada left bar disamping, itu gara2 plugin ale / linter
" set guiheadroom=0 
" set guioptions-=e 
set linebreak "dont break at word
set breakindent "wrapping with indent


set winminheight=0
set winminwidth=0


" set white space as character
"set listchars=tab:>·,trail:~,space:.
set encoding=utf8
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:.
set nolist
" set list

set number 							" set line number 
" display partially wrapped long line
:set display+=lastline

" colorscheme atom-dark
" colorscheme solarized
" colorscheme monokai
" light
" colorscheme pyte
" colorscheme mayansmoke

"filetype plugin indent on
" To insert space characters whenever the tab key is pressed,
set expandtab
"how many space on single tab press 
set tabstop=2
"To change all the existing tab characters to match the current tab settings
"retab
"To change the number of space characters inserted for indentation (autoindent '=' follow this), sometimes you need to type manually and reload the file to take effect
set shiftwidth=2
"how many tab unit per tab press in insert mode
" set softtabstop=2

set hlsearch 						" hightlight  search
set incsearch 						" hightlight per input , incremental search

" set split behaviour
set splitbelow "spawn new split below
set splitright "spawn new split right


"===================BUFFER MANAGEMENT MAPPINGS=================
map <c-a-q> :q!<cr>
" tab shortcut
" prev tab
nnoremap <a-q> :tabp<Enter>
inoremap <a-q> <c-o>:tabp<Enter>
" next tab
nnoremap <a-e> :tabn<Enter>
inoremap <a-e> <c-o>:tabn<Enter>
" new tab
nmap <c-e> <Esc>:tabnew<Enter>
" split tab
nmap <c-a-e> <Esc>:tab split<Enter>
" close window
noremap <a-w> <c-w>q 
" move tab
nnoremap <a-s-q> <Esc>:tabm -1<Enter>
nnoremap <a-s-e> <Esc>:tabm +1<Enter>

" goto tab
nnoremap <a-1> 1gt
nnoremap <a-2> 2gt
nnoremap <a-3> 3gt
nnoremap <a-4> 4gt
nnoremap <a-5> 5gt
nnoremap <a-6> 6gt
nnoremap <a-7> 7gt
nnoremap <a-8> 8gt
nnoremap <a-9> 9gt

" goto window
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-h> <C-w><C-h>
nnoremap <leader><c-h> 10<c-w><c-h>
nnoremap <C-l> <C-w><C-l>
nnoremap <leader><c-l> 10<c-w><c-l>
"===================FILE MANAGEMENT MAPPINGS=================
" #### PLUGIN INDEPENDENT ############################################
" save current file path to clipboard, alt+'
nnoremap <a-'> :let @+=expand('%:p')<cr> :echo 'path copied'<cr>
" open file whose path in clipboard 
nmap <Leader>o  :execute 'edit' fnameescape(@+)<cr>


" save , alt+s to save
inoremap <a-s> <Esc>:w<Enter>a
nnoremap <a-s> :w<Enter>
inoremap <c-s> <Esc>:w<Enter>a
nnoremap <c-s> :w<Enter>


"===================MOVEMENT MAPPINGS=================

"Page Up/Down mapping 
" nnoremap zz zz:set showtabline=0<cr>
" nnoremap zt zt:set showtabline=0<cr>
" nnoremap zb zb:set showtabline=0<cr>
nnoremap <PageUp> kzz
nnoremap <PageDown> jzz
inoremap <PageUp> <c-o>k<c-o>zz
inoremap <PageDown> <c-o>j<c-o>zz
nnoremap <s-PageUp> 4kzz
nnoremap <s-PageDown> 4jzz
inoremap <s-PageUp> <c-o>4k<c-o>zz
inoremap <s-PageDown> <c-o>4j<c-o>zz
nnoremap <c-PageUp> 10zh
nnoremap <c-PageDown> 10zl


" up mapping
nnoremap <a-s-k> 4gkzz
"nnoremap <c-k> 10kzz
nnoremap <s-k> 4gkzz
imap <a-k> <up>
inoremap <a-s-k> <esc>4gkzzi
vnoremap <s-k> 4gkzz
" down mapping
nnoremap <a-s-j> 4gjzz
"nnoremap <c-j> 10jzz
nnoremap <s-j> 4gjzz
imap <a-j> <up>
inoremap <a-s-j> <esc>4gjzzi
vnoremap <s-j> 4gjzz

"map tab char
inoremap <c-tab> <c-v><tab>

" map q macro
nnoremap \ @q
vnoremap \ @q
nnoremap \| @w
vnoremap \| @w
" auto copy into register / 
vnoremap <c-\> "+y:let @q=@+<cr>:echo "clipboard setted to register q"<cr>
vnoremap <c-\> "+y:let @q=@+<cr>:echo "clipboard setted to register q"<cr>
nnoremap <c-\> 00v$h"+y:let @q=@+<cr>:echo "clipboard setted to register q"<cr>

" to next/prev blank space
vnoremap <c-a-k> <esc>:hi Search guibg=bg<cr>:let @d=v:hlsearch<cr>:let @s=@/<cr>?^ *\n<cr>:let @/=@s<cr>:let v:hlsearch=@d<cr>zz:hi Search guibg=#ffe792<cr>msgv's
vnoremap <c-a-j> <esc>:hi Search guibg=bg<cr>:let @d=v:hlsearch<cr>:let @s=@/<cr>/^ *\n<cr>:let @/=@s<cr>:let v:hlsearch=@d<cr>zz:hi Search guibg=#ffe792<cr>msgv's
nnoremap <c-a-k> :hi Search guibg=bg<cr>:let @d=v:hlsearch<cr>:let @s=@/<cr>?^ *\n<cr>:let @/=@s<cr>:let v:hlsearch=@d<cr>zz:hi Search guibg=#ffe792<cr>
nnoremap <c-a-j> :hi Search guibg=bg<cr>:let @d=v:hlsearch<cr>:let @s=@/<cr>/^ *\n<cr>:let @/=@s<cr>:let v:hlsearch=@d<cr>zz:hi Search guibg=#ffe792<cr>

" to next/prev non blank column
" nmap <a-j> <down>
" imap <a-j> <down>


" jump to first char in line
nnoremap 0h ^
vnoremap 0h ^
nnoremap 00 0

" // ga bisa pake <s-3>
vnoremap # $h
nnoremap # 00v$h
" mapping escape
inoremap <a-l> <esc>l
nnoremap <a-l> <esc>
vnoremap <a-l> <esc>
cnoremap <a-l> <c-c>

" mapping undo
nnoremap <s-u> <c-r>
nnoremap <a-u> u
nnoremap <a-s-u> <c-r>

" mapping alt+u to undo,  
inoremap <a-u> <c-o>u
" mapping alt+shift+r to redo
inoremap <a-s-u> <c-o><c-r>

" move up/down by visual(hati-hati spasi setelah gk bisa stuck)
map j gj
map k gk

" move by word in insert mode
inoremap <c-right> <esc>ea

"=================== OTHER MAPPINGS =================
nnoremap <up> <up>zz
nnoremap <right> <right>zz
nnoremap <down> <down>zz
nnoremap <left> <left>zz

inoremap <up> <up>
inoremap <right> <right>
inoremap <down> <down>
inoremap <left> <left>

" increase/decrease split width
nnoremap ) :vertical resize +5<cr>
nnoremap ( :vertical resize -5<cr>
" increase/decrease split height
nnoremap <a-9> :res +2<cr>
nnoremap <a-0> :res -2<cr>

" mapping highlighter

" mapping digraph, map pipe, map |
inoremap <a-2> <c-k>VV
nnoremap <Ins> i<Ins>
nnoremap <s-i> i<Ins>

" remap real c-v
nnoremap <c-d> <c-v>
inoremap <c-d> <c-v>

"break undo per space or enter + expand abbrev by space
inoremap <space> <C-]><space><c-g>u
inoremap <s-space> <space>
inoremap <CR> <c-g>u<CR>

"remove hightlight after search found
nnoremap <leader><space> <esc>:nohlsearch<cr>

" set current working dir
nnoremap <a-s-p> :cd %:p:h <bar> echo 'working dir setted to current path'<cr>

" copy in visual mode
vnoremap <c-c> "+y
vnoremap <c-x> "+d
nnoremap <c-x> V"+d
" cut in visual mode
vnoremap x "0d:let @x=@0<cr>
nnoremap <s-x> "xx:let @0=@x<cr>

" paste in visual mode
vnoremap <a-v> "+p
vmap <c-v> <a-v>
vnoremap <c-s-v> "+<s-p>
" ^ this mapping will make paste in visual to visual can be repeated

"" paste in normal mode
nnoremap <a-v> i<space><esc>v"+p:echo 'paste done'<cr>
nmap <c-v> <a-v>
" nnoremap <a-v> iiiii
nnoremap <c-s-v> "+<s-p>

"" paste in insert mode (P=paste immidiately, p=enter then paste)
inoremap <a-v> <space><left><c-o>v"+<s-p><c-o>:echo 'paste done'<cr>
imap <c-v> <a-v>
"" paste in normal sense need capital P

"enter/backsapce insert/removenewline in normal mode 
nmap <cr> i<cr><esc>
" nmap <space> i<space>
" nmap <backspace> i<backspace><esc>l
set backspace=indent,eol,start

"indent
vnoremap > ><cr>gv
vnoremap < <<cr>gv

" select all 
nnoremap <c-a> ggV<s-g>

" select text while in insert mode
imap <s-c-right> <esc>lviw
imap <s-c-left> <esc>hvib

let g:custom_ve_toggle=1
function! VirtualEditToggle()
  if g:custom_ve_toggle == 0
    set ve=onemore
    let g:custom_ve_toggle = 1
    echo 've onemore'
  else
    set ve=all
    let g:custom_ve_toggle = 0
    echo 've all'
  endif
endfunction
:command! VirtualEditToggle call VirtualEditToggle()
nnoremap <leader>ve :VirtualEditToggle<cr>

" delete without put to register #blackhole
nnoremap d "_d
vnoremap d "_d

nnoremap <s-x> ""dd:let @x=@"<cr>
vnoremap <s-x> ""d

"mapping yank
vnoremap y ygv"yy
nnoremap yy msV""y:let @y=@"<cr>`s


" go back to last non whitespace #backspace , delete to start, mark, search last non whitespc, mark, remove highlight,del right. 
nnoremap <s-Backspace> d0mz?\S<cr>lmx`zd`x:nohl<cr>i<del><Esc>
inoremap <s-Backspace> <right><Esc>d0mz?\S<cr>lmx`zd`x:nohl<cr>i<del>
"imap <BS> <Esc>d?\S?e1<CR>i

" new line without moving cursor
" inoremap <s-cr> <c-o><s-o>
inoremap <s-cr> <c-o>v<esc><c-o>o<c-o>gv<esc>

" escape the search string
function! EscapeForSearch()
  let @y = substitute(@y, '\', "\\\\\\", 'g')
  let @y = substitute(@y, '/', '\\/', 'g')
  let @y = substitute(@y, "\n", '\\n', 'g')
  let @y = substitute(@y, "\r", '\\r', 'g')
  let @y = substitute(@y, '[', '\\[', 'g')
  let @y = substitute(@y, ']', '\\]', 'g')
  " let @y = substitute(@y, "(", '\\(', 'g')
  " let @y = substitute(@y, ")", '\\)', 'g')
  let @y = substitute(@y, '*', '\\*', 'g')
  echom @y
endfunction
"# search the selected
vnoremap <c-f> "yy:call EscapeForSearch()/<c-r>yN
" search the word on cursor
nnoremap <c-f> viwy/<c-r>0<cr>
"# replace the selected, start from current to the last line(,$), 
" then repeat the search from beginning line, to the last search position(1,''-&&) 
vnoremap <c-h> y:,$s/<c-r>0/(REPLACE_HERE)/gc\|1,''-&&
" https://stackoverflow.com/questions/7598133/vim-global-search-replace-starting-from-the-cursor-position

