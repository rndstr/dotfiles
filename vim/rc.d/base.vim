"""""""""""""""""""""""""""""
" general
syntax on
" colorscheme for terminal
colorscheme rndstr
set nocompatible
filetype off " required for vundle
set history=1000
" to disable auto-folding in latex: filetype plugin off (there should be another way tho, no?)
filetype indent on
filetype plugin on
set winaltkeys=no
set encoding=utf8
set fileencoding=utf8
set t_Co=256


""""""""""""""""""""""""""""
" testing
set isk+=_,$,@,%,#,-


""""""""""""""""""""""""""""
" files/backups
set backup " create backups
set backupdir=$HOME/.vim/backup " backup files location
set directory=$HOME/.vim/swap " swap files location
" change dirs when switching tabs/buffers
"if exists('+autochdir')
"    set autochdir
"else
"    autocmd BufEnter * silent! lcd %:p:h:gs/ /\\ /
"endif
set wildignore+=.git,.svn,.hg,**/cache/**


""""""""""""""""""""""""""""
" vim ui

set lsp=0 " space out a little more
set ruler " display ruler
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)
set cmdheight=1 " height of command bar
set number
if exists('+relativenumber')
    set relativenumber " line numbers are on
endif
set lz " lazyredraw, do not redrawy while running macros
set backspace=2 " make backspace work normal
set showcmd
set scrolloff=4 " keep cursor away from top/bottom
set showmatch " show matching brackets
set matchtime=5 " how many tenths of a second to blink matahcing brackets for
set laststatus=2 " always show the status line
set wildmode=list:longest,full  " command <Tab> completion, list matches, then longest common part, then all.
" display cues :set list
set lcs=tab:>-,extends:$
if has("gui_running")
  set cursorline
endif

"""""""""""""""""""""""""""""
" folding
"   enable folding, but by default make it act like folding is off
set foldenable
set foldmethod=indent
set foldlevel=100
set fo=""
set foldopen-=search " don't open folds when you search into them
set foldopen-=undo " don't open folds when you undo stuff
let g:DisableAutoPHPFolding = 1

"""""""""""""""""""""""""""""
" formatting
set hlsearch
set incsearch " incremental search, do search/highlight as you type
set ignorecase " case insensitive search
set smartcase " all smaller case search is insensitive, combined with upper case letters is sensitive
set ai " autoindent
set si " smartindent
set cindent " c-style indenting
set tabstop=4
set shiftwidth=4
set expandtab " no real tabs
set nowrap " no wrapping of lines
" highlight tabs

" stop continuing comments when switching to insert mode
set formatoptions-=o
let g:PHP_autoformatcomment = 0

""""""""""""""""""""""""""""
" apps
set grepprg=grep\ -nH\ $*

"""""""""""""""""""""""""""""
" file explorer
let g:explVertical=1
let g:explWinSize=35

""""""""""""""""""""""""""""
" win manager
let g:winManagerWidth=35
let g:winManagerWindowLayout = 'FileExplorer,TagsExplorer|BufExplorer'

"""""""""""""""""""""""""""
" auto commands
au BufEnter *.rb :set tabstop=2 shiftwidth=2

"""""""""""""""""""""""""""
" abbrevations
" :T = :tabedit
command! -nargs=* -complete=file T tabedit <args>
"nnoremap :e :tabedit
nnoremap <silent> = :tabnext<CR>
nnoremap <silent> + :tabprev<CR>
nnoremap <silent> <C-tab> :tabs<CR>
" go to file
nnoremap gf <C-W>gf


" always show the tabline
set showtabline=2
set tabpagemax=20

"""""""""""""""""""""""""""""
" vundle
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" github
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-surround'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/syntastic'
Bundle 'spf13/PIV'
Bundle 'Lokaltog/vim-powerline'
Bundle 'flazz/vim-colorschemes'
Bundle 'majutsushi/tagbar'
Bundle 'tpope/vim-fugitive'
Bundle 'groenewege/vim-less'
"
"Bundle 'sjl/gundo.vim'
"Bundle 'godlygeek/csapprox'
"Bundle 'taxilian/VimDebugger'

"""""
" check the fuck out
"Bundle 'mileszs/ack.vim'
"Bundle 'sessionman.vim'
"Bundle 'Lokaltog/vim-easymotion'

" vim-scripts
Bundle 'L9'
Bundle 'matchit.zip'
Bundle 'Indent-Guides'



" local bundles
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

" try out
Bundle 'altercation/vim-colors-solarized'
"Bundle 'spf13/vim-colors'

filetype plugin indent on


" overwrite PIV settings which does also wrap normal code lines.
setlocal textwidth=115

" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..


"""""""""""""""""""""""""""
" abbrevations
iab xdate <c-r>=strftime("%Y-%m-%d")<cr>
iab xdatetime <c-r>=strftime("%Y-%m-%d %H:%M:%S")<cr>
iab xdatec <c-r>=strftime("%c")<cr>
iab xcpp // -----------------------------------------------------------------------------<cr>
iab xc /* ----------------------------------------------------------------------------- */<cr>

iab functino function

""""""""""""""""""""""""""""
" mappings
let mapleader = ","

nmap <leader>s :source ~/.vimrc<CR>
nmap <leader>g :source ~/.vimrc<CR>:source ~/.gvimrc<CR>
nmap <leader>v :tabnew ~/.vimrc<CR>
nmap <leader>c :tabnew ~/.vim/doc/cheatsheet.txt<CR>

nmap <leader>cs :let @*=expand("%")<CR>
nmap <leader>cp :let @*=expand("%:p")<CR>
nmap <leader>cd :let @*=expand("%:p:h")<CR>

vmap <leader>px !xmllint --format -<CR>

nmap <leader>wp !opera http://php.net/<cword><CR>

" open new vertsplit window and move to it
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-q> <C-w>q

" uncommenting lines
map <leader>/ :s/^/\/\//<CR>

" list lines with word under cursor and jump
map <leader>l [I:let nr = input("line: ")<Bar>exe"normal ".nr."[\t"<CR>

" remap code completion to Ctrl+Space {{{2
if has("gui")
    " C-Space seems to work under gVim on both Linux and win32
    inoremap <C-Space> <C-n>
else " no gui
  if has("unix")
    inoremap <Nul> <C-n>
  endif
endif

function! ToggleNumberMode()
   if &rnu == 1
        set nornu
    else
        set rnu
    endif
endfunc
nnoremap <C-n> :call ToggleNumberMode()<CR>


function! ToggleShiftwidth()
  if &shiftwidth == 4
    set shiftwidth=2 tabstop=2 shiftwidth? 
  else
    set shiftwidth=4 tabstop=4 shiftwidth?
  endif
endfunction
nnoremap <silent> <C-i> <Esc>:call ToggleShiftwidth()<CR>



nnoremap <C-p> :set invpaste paste?<CR>

" paste and reformat/reindent
" this seems to do paste stuff whenever i open a file on certain machines
"nnoremap <Esc>P P'[v']=
"nnoremap <Esc>p p'[v']=

nmap X ci'
" backspace deletes in edit mode
vmap <BS> x


" piece-wise copying of line above current oen
"imap <C-m> @@@<Esc>hhkywjl?@@@<CR>P/@@@<CR>3s


"" vimdiff for git
if &diff
  " get local chunk and move to next
  nmap <C-left> :diffget 1<CR>]c
  " get remote chunk and move to next
  nmap <C-right> :diffget 3<CR>]c
  nmap <C-down> ]c
  nmap <C-up> [c
endif

" skip words camelCase
nnoremap <silent><C-h> :<C-u>call search('\<\<Bar>\U\@<=\u\<Bar>\u\ze\%(\U\&\>\@!\)\<Bar>\%^','bW')<CR>
nnoremap <silent><C-l> :<C-u>call search('\<\<Bar>\U\@<=\u\<Bar>\u\ze\%(\U\&\>\@!\)\<Bar>\%$','W')<CR>
inoremap <silent><C-h> <C-o>:call search('\<\<Bar>\U\@<=\u\<Bar>\u\ze\%(\U\&\>\@!\)\<Bar>\%^','bW')<CR>
inoremap <silent><C-l> <C-o>:call search('\<\<Bar>\U\@<=\u\<Bar>\u\ze\%(\U\&\>\@!\)\<Bar>\%$','W')<CR>


" Fast window resizing with +/- keys (horizontal); / and * keys (vertical)
if bufwinnr(1)
  map <kPlus> <C-W>+
  map <kMinus> <C-W>-
  map <kDivide> <c-w><
  map <kMultiply> <c-w>>
endif

map <Up> <c-w>k<c-w>_<c-w><Bar>
map <Down> <c-w>j<c-w>_<c-w><Bar>
map <Left> <c-w>h<c-w>_<c-w><Bar>
map <Right> <c-w>l<c-w>_<c-w><Bar>
