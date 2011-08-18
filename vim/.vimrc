syntax enable

colorscheme candy

set nocompatible
set modelines=0
set autoindent

set history=50
set ruler
set showcmd


"Don't use Ex mode,use Q for formatting
map Q gq

set encoding=utf-8
nnoremap <F12> :e ++enc=gbk

set visualbell

"indent settings
set expandtab 
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smartindent
set cindent
set scrolloff=3
set showmode
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set relativenumber
set laststatus=2
set undofile

let mapleader = ","

nnoremap / /\v
vnoremap / /\v
set incsearch
set ignorecase
set smartcase
set hlsearch
set showmatch
set gdefault
map <leader><space> :noh<cr>
nmap <tab> %
vmap <tab> %

" Soft/hard wrapping
set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=85

nnoremap j gj
nnoremap k gk

" inoremap jj <Esc>`^ 

au FocusLost * :wa

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <leader>w <C-w>v<C-w>l

" Minibuf
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplTabWrap = 1
let g:miniBufExplModSelTarget = 1
"let g:miniBufExplSplitBelow = 1
let g:miniBufExplorerMoreThanOne = 1
let g:miniBufExplSplitToEdge = 0

set winminheight=0      " Allow windows to get fully squashed

"
"" Switch between windows, maximizing the current window
"
" map <C-J> <C-W>j<C-W>_
" map <C-K> <C-W>k<C-W>_ 


" taglist
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
let Tlist_Auto_Open=1

" Pylint
let g:pylint_onwrite=0

" Latex
filetype plugin on
set grepprg=grep\ -nH\ $*


" CScope
if has("cscope")
	set csprg=/usr/bin/cscope
	set csto=0
	set cst
	set nocsverb
	" add any database in current directory
	if filereadable("cscope.out")
		cs add cscope.out
	" else add database pointed to by environment
	elseif $CSCOPE_DB != ""
		cs add $CSCOPE_DB
	endif
	set csverb
	set cscopetag
	set cscopequickfix=s-,g-,c-,d-,t-,e-,f-,i-
endif

if has("autocmd")
	"自动检测文件类型并加载相应的设置
	filetype plugin indent on

	" Python 文件的一般设置，比如不要tab等
	autocmd FileType python setlocal et | setlocal sta | setlocal sw=4

	" Auto-complete
	autocmd FileType python set complete+=k~/.vim/pydiction

	" Python Unittest 的一些设置
	" 可以让我们在编写Python代码及unittest测试时不需要离开vim
	" 键入:make或者点击gvim工具条上的make按钮自动执行测试用例
	autocmd FileType python compiler pylint
"	autocmd FileType python setlocal makeprg=python\ ./alltests.py
"	autocmd BufNewFile,BufRead test*.py setlocal makeprg=python\ %

endif

filetype plugin indent on
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"

:inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
:inoremap { {}<ESC>i
:inoremap } <c-r>=ClosePair('}')<CR>
:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>
:inoremap < <><ESC>i
:inoremap > <c-r>=ClosePair('>')<CR>

function ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
        return a:char
    endif
endf

function! Browser ()
    let line = getline (".")
    let line = matchstr (line, "\%(http://\|www\.\)[^ ,;\t]*")
    exec "!firefox ".line
endfunction
map <Leader>w :call Browser ()<CR>


set runtimepath=~/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,~/.vim/after
