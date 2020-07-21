" General settins {{{
" set mouse=nv                 " Disable mouse in command-line mode
set report=0                 " Don't report on line changes
set errorbells               " Trigger bell on error
" set visualbell               " Use visual bell instead of beeping
set hidden                   " hide buffers when abandoned instead of unload 使得不可见的缓冲区保持载入
set fileformats=unix,dos,mac " Use Unix as the standard file type
set magic                    " For regular expressions turn magic on
set path+=**                 " Directories to search when using gf and friends
set isfname-==               " Remove =, detects filename in var=/foo/bar
set virtualedit=block        " Position cursor anywhere in visual block
set synmaxcol=2500           " Don't syntax highlight long lines
set helplang=cn
set langmenu=en_US           "zh_CN  " 编码 encoding
let &termencoding=&encoding  " 下面这句只影响普通模式 (非图形界面) 下的 Vim
set fenc=utf-8
set fencs=utf-8,usc-bom,euc-jp,gb18030,gbk,gb2312,cp936 " 自动判断编码时，依次尝试以下编码

set formatoptions+=1         " Don't break lines after a one-letter word
set formatoptions-=t         " Don't auto-wrap text
set formatoptions-=o         " Disable comment-continuation (normal 'o'/'O')
if has('patch-7.3.541')
	set formatoptions+=j       " Remove comment leader when joining lines
endif

if has('vim_starting')
	set encoding=utf-8
	scriptencoding utf-8
endif

" What to save for views and sessions:
set viewoptions=folds,cursor,curdir,slash,unix
set sessionoptions=curdir,help,tabpages,winsize
" mac 系统剪贴板和 vim 剪贴板共享
if has('mac')
	let g:clipboard = {
		\   'name': 'macOS-clipboard',
		\   'copy': {
		\      '+': 'pbcopy',
		\      '*': 'pbcopy',
		\    },
		\   'paste': {
		\      '+': 'pbpaste',
		\      '*': 'pbpaste',
		\   },
		\   'cache_enabled': 0,
		\ }
endif

if has('clipboard')
	set clipboard& clipboard+=unnamedplus
endif
" }}}

" Wildmenu {{{
if has('wildmenu')
	if ! has('nvim')
    " 命令模式下显示 tab 自动补全
		set wildmode=list:longest " set wildmode=list:longest,full
	endif

	" if has('nvim')
	" 	set wildoptions=pum
	" else
	" 	set nowildmenu
	" 	set wildmode=list:longest,full
	" 	set wildoptions=tagfile
	" endif
	set wildignorecase
	set wildignore+=.git,.hg,.svn,.stversions,*.pyc,*.spl,*.o,*.out,*~,%*
	set wildignore+=*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store
	set wildignore+=**/node_modules/**,**/bower_modules/**,*/.sass-cache/*
	set wildignore+=application/vendor/**,**/vendor/ckeditor/**,media/vendor/**
	set wildignore+=__pycache__,*.egg-info,.pytest_cache,.mypy_cache/**
	set wildcharm=<C-z>  " substitue for 'wildchar' (<Tab>) in macros
endif
" }}}

" Vim Directories {{{
set nobackup
set nowritebackup
set undofile noswapfile
set directory=$DATA_PATH/swap//,$DATA_PATH,~/tmp,/var/tmp,/tmp
set undodir=$DATA_PATH/undo//,$DATA_PATH,~/tmp,/var/tmp,/tmp
set backupdir=$DATA_PATH/backup/,$DATA_PATH,~/tmp,/var/tmp,/tmp
set viewdir=$DATA_PATH/view/
" Use the coc-spell-checker to do this
" set spellfile=$VIM_PATH/spell/en.utf-8.add

" History saving
set history=2000

if has('nvim') && ! has('win32') && ! has('win64')
	set shada=!,'300,<50,@100,s10,h
else
	set viminfo='300,<10,@50,h,n$DATA_PATH/viminfo
endif

augroup user_persistent_undo
	autocmd!
	au BufWritePre /tmp/*          setlocal noundofile
	au BufWritePre COMMIT_EDITMSG  setlocal noundofile
	au BufWritePre MERGE_MSG       setlocal noundofile
	au BufWritePre *.tmp           setlocal noundofile
	au BufWritePre *.bak           setlocal noundofile
augroup END

" If sudo, disable vim swap/backup/undo/shada/viminfo writing
if $SUDO_USER !=# '' && $USER !=# $SUDO_USER
		\ && $HOME !=# expand('~'.$USER)
		\ && $HOME ==# expand('~'.$SUDO_USER)

	set noswapfile
	set nobackup
	set noundofile
	if has('nvim')
		set shada="NONE"
	else
		set viminfo="NONE"
	endif
endif

" Secure sensitive information, disable backup files in temp directories
if exists('&backupskip')
	set backupskip+=/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*,/private/var/*
	set backupskip+=.vault.vim
endif

" Disable swap/undo/viminfo/shada files in temp directories or shm
augroup user_secure
	autocmd!
	silent! autocmd BufNewFile,BufReadPre
		\ /tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*,/private/var/*,.vault.vim
		\ setlocal noswapfile noundofile nobackup nowritebackup viminfo= shada=
augroup END
" }}}

" Tabs and Indents {{{
" set textwidth=80    " Text width maximum chars before wrapping
set expandtab " 不出现制表符 tab键转为空格
" set noexpandtab     " Don't expand tabs to spaces
set tabstop=2         " The number of spaces a tab is <Tab>在文件里使用的空格数2
set shiftwidth=2      " Number of spaces to use in auto(indent) (自动) 缩进使用的步进单位，以空白数目计
set softtabstop=-1    " Automatically keeps in sync with shiftwidth 编辑时 <Tab> 使用的空格数
set smarttab          " Tab insert blanks according to 'shiftwidth' 插入 <Tab> 时使用 ’shiftwidth’
set autoindent        " Use same indenting on new lines 新行使用与前一行一样的缩进
set smartindent       " Smart autoindenting on new lines C 程序只能自动缩进
set shiftround        " Round indent to multiple of 'shiftwidth'  缩进列数对齐到 shiftwidth 的整数倍

if exists('&breakindent')
	set breakindentopt=shift:2,min:20
endif
" }}}

" Timing {{{
set timeout ttimeout
set timeoutlen=500    " Time out on mappings
set updatetime=100	  " Idle time to write swap and trigger CursorHold
set ttimeoutlen=10    " Time out on key codes
set redrawtime=1500   " Time in milliseconds for stopping display redraw
" }}}

" Searching {{{
set ignorecase      " 搜索时大小写不敏感
set smartcase       " 搜索时保存记录
set infercase       " 关键字自动补全的匹配调整大小写
set incsearch       " 输入的过程中就开始搜索
set hlsearch        " highlight 搜索结果
set wrapscan        " Searches wrap around the end of the file

set complete=.,w,b,k  " C-n completion: Scan buffers, windows and dictionary

if exists('+inccommand')
	set inccommand=nosplit
endif

if executable('rg')
		set grepformat=%f:%l:%m
		let &grepprg = 'rg --vimgrep' . (&smartcase ? ' --smart-case' : '')
elseif executable('ag')
		set grepformat=%f:%l:%m
		let &grepprg = 'ag --vimgrep' . (&smartcase ? ' --smart-case' : '')
endif
" }}}

" Behavior {{{
" 自动重载有改动的文件
set autoread                    " Auto readfile
" set autowrite
" set nowrap												" 默认不换行
" set linebreak											" 单词不换行
" set breakat=\ \   ;:,!?						" 作为插入换行地点的字符
set nostartofline               " Cursor in same column for few commands 在缓冲区之间切换时保持光标位置
set whichwrap+=h,l,<,>,[,],~    " Move to following line on certain keys 允许backspace和光标键跨越行边界(不建议)
set splitbelow splitright       " Splits open bottom right
set switchbuf=useopen,vsplit    " Jump to the first open window 通常分割/缓冲相关的命令会分割当前窗口，但是也可以让Vim在已经有窗口打开所指定的缓冲时，切换到那个窗口而不是新建一个
set backspace=indent,eol,start  " Intuitive backspacing in insert mode
" set backspace=2
set diffopt=filler,iwhite       " Diff mode: show fillers, ignore whitespace
" 自定义补全
set completeopt=menu,menuone    " Always show menu, even for one item
set completeopt+=noselect,noinsert

" zz zt zb 保持2行
set scrolloff=2									" Keep at least 2 lines above/below
set sidescrolloff=2							" Keep at least 2 lines left/right

if exists('+completepopup')
	set completeopt+=popup
	set completepopup=height:4,width:60,highlight:InfoPopup
endif

if has('patch-8.1.0360') || has('nvim-0.4')
	set diffopt+=internal,algorithm:patience
	" set diffopt=indent-heuristic,algorithm:patience
endif
" }}}


" Editor UI {{{
set confirm             " when deal with unsaved files ask what to do
if has('termguicolors')					" Enables 24-bit RGB color in the TUI
    set termguicolors
endif

set number											" Show number
set relativenumber							" Show relative number
au FocusLost * :set norelativenumber number
au FocusGained * :set relativenumber
autocmd InsertEnter * :set norelativenumber number " 插入模式下用绝对行号, 普通模式下用相对
autocmd InsertLeave * :set relativenumber

set noshowmode									" Don't show mode on bottom
set noruler											" Disable default status ruler
set shortmess=aFc								" 显示开屏系统版本信息
set scrolloff=2									" Keep at least 2 lines above/below
set fillchars+=vert:\|					" add a bar for vertical splits 添加垂直分隔条

" if has('nvim') && get(g:,'gruvbox_transp_bg',1)
    " set fcs=eob:\								" hide ~
" endif

set list												" 自定义tab显示样式
" set listchars=tab:»·,nbsp:+,trail:·,extends:→,precedes:←
set listchars=tab:\▏\ ,extends:⟫,precedes:⟪,nbsp:␣,trail:·
set title
" Title length.
set titlelen=95
" Title string.
let &g:titlestring="
      \ %{expand('%:p:~:.')}%(%m%r%w%)
      \ %<\[%{fnamemodify(getcwd(), ':~')}\] - Neovim"

set showmatch           " Jump to matching bracket 显示匹配的括号 (,{ => },)
set matchpairs+=<:>     " Add HTML brackets to pair matching HTML文本括号匹配
set matchtime=1         " Tenths of a second to show the matching paren 1/10 秒闪烁时间
set showtabline=2       " Always show the tabs line 始终显示标签行
set winwidth=30         " Minimum width for active window
set winminwidth=10      " Minimum width for inactive windows
" set winheight=4         " Minimum height for active window
set winminheight=1      " Minimum height for inactive window

" 弹出菜单的行数
set pumheight=15        " Pop-up menu's line height
set helpheight=12       " Minimum help window height
set previewheight=12    " Completion preview height
" 命令模式显示当前键入的指令
set showcmd             " Show command in status line
set cmdheight=2         " Height of the command line
set cmdwinheight=5      " Command-line lines
set equalalways         " resize windows on split or close 在拆分或关闭时调整窗口大小
set laststatus=2        " 总是显示底部状态行
" set statusline=-        " hide file name in statusline 隐藏侧边栏 一般 git 代码检查
set colorcolumn=120      " Column highlight at textwidth's max character-limit
set display=lastline

if has('folding')
    set foldenable " 允许折叠
    " 折叠方法
    " manual    手工折叠
    " indent    使用缩进表示折叠
    " expr      使用表达式定义折叠
    " syntax    使用语法定义折叠
    " diff      对没有更改的文本进行折叠
    " marker    使用标记进行折叠, 默认标记是 {{{ 和 }}}
    set foldmethod=indent " 语法高亮来定义折叠
    set foldlevelstart=99  " 关闭vim默认折叠
endif

if has('nvim-0.4')
    set signcolumn=yes:1
else
    set signcolumn=yes           " Always show signs column 总是显示左边git error 状态栏
endif

if has('conceal') && v:version >= 703
    " For snippet_complete marker
    set conceallevel=2 concealcursor=niv
endif

if exists('+previewpopup')
    set previewpopup=height:10,width:60
endif

" neovim && vim8.2 悬浮窗口
if &termguicolors " Pseudo-transparency for completion menu and floating windows
    if exists('&pumblend')
	set pumblend=20
    endif
    if exists('&winblend')
	set winblend=20
    endif
endif

" }}}

" vim: set foldmethod=marker ts=2 sw=2 tw=80 noet :
