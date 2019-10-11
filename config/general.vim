"==============================================================================
"       -> General Settings 基础设置
"       -> Display Settings 展示/排版等界面格式
"       -> FileEncode Setting 文件编码设置
"       -> Others 其他配置
"       -> TEMP Settings 缓存文件设置
"==============================================================================


" Enable true color
if has('termguicolors')
    set termguicolors
endif

"============================ General Plugin ==================================
" 自动重载有改动的文件
set autoread
set autowrite
set bsdir=buffer
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

set history=1000
" Timing
        set timeout ttimeout
        set timeoutlen=750  " Time out on mappings
        set updatetime=400 " Idle time to write swap and trigger CursorHold
        set ttimeoutlen=10  " Time out on key codes

"==============================================================================


"=========================== Display Settings =================================
" behavior 行为
        " set nowrap              " 默认不换行
        " set linebreak           " 单词不换行
        " set breakat=\ \   ;:,!?     " 作为插入换行地点的字符
        set nostartofline               " 在缓冲区之间切换时保持光标位置
        set whichwrap+=h,l,<,>,[,],~    " 允许backspace和光标键跨越行边界(不建议)
        set splitbelow splitright       " 分割窗口时新窗口在当前窗口之下
        set switchbuf=useopen,usetab            " 通常分割/缓冲相关的命令会分割当前窗口，但是也可以让Vim在已经有窗口打开所指定的缓冲时，切换到那个窗口而不是新建一个
        set switchbuf+=vsplit           "       " 方便函数转跳 新窗口在vsplit
        set backspace=indent,eol,start  " Intuitive backspacing in insert mode
        set backspace=2
        " 自定义补全
        set completefunc=emoji#complete
        set completeopt+=longest
        set completeopt+=menu
        set completeopt-=preview
        " zz zt zb 保持2行
        set scrolloff=2         " Keep at least 2 lines above/below
        set sidescrolloff=5     " Keep at least 5 lines left/right


" Tabs and Indents 标签和缩进
        set expandtab " 不出现制表符 tab键转为空格
        set tabstop=4 " <Tab>在文件里使用的空格数4
        set softtabstop=4 " 编辑时 <Tab> 使用的空格数
        set shiftwidth=4 " (自动) 缩进使用的步进单位，以空白数目计
        set smarttab " 插入 <Tab> 时使用 ’shiftwidth’
        set autoindent " 新行使用与前一行一样的缩进
        set smartindent " C 程序只能自动缩进
        set shiftround " 缩进列数对齐到 shiftwidth 的整数倍

" vim编辑器用户界面外观
        set hidden              " 使得不可见的缓冲区保持载入
        set shortmess=aFc
        set confirm             " when deal with unsaved files ask what to do
        set showtabline=2       " 始终显示标签行
        set laststatus=2        " 总是显示底部状态行
        set statusline=-        " hide file name in statusline 隐藏侧边栏
        set fillchars+=vert:\|  " add a bar for vertical splits 添加垂直分隔条
        if get(g:,'gruvbox_transp_bg',1)
            set fcs=eob:\           " hide ~
        endif
        set signcolumn=yes      " 总是显示左边git error 状态栏
        set list                " 自定义tab显示样式
        " set showbreak=↪       " 换行前聚
        set listchars=tab:\▏\ ,extends:⟫,precedes:⟪,nbsp:␣,trail:·
        " 底部cmd 消息尺寸
        set cmdheight=3         " Height of the command line
        set cmdwinheight=5      " Command-line lines
        " 设置分割窗口尺寸
        set winwidth=30         " Minimum width for active window
        set winminwidth=10      " Minimum width for inactive windows
        set winheight=4         " Minimum height for active window
        set winminheight=1      " Minimum height for inactive window
        set equalalways         " 在拆分或关闭时调整窗口大小
        set colorcolumn=80      " Highlight the 80th character limit
        " 弹出菜单的行数
        set pumheight=15        " Pop-up menu's line height
        set helpheight=12       " Minimum help window height
        set previewheight=12    " Completion preview height
        " 命令模式显示当前键入的指令
        set showcmd             " Show command in status line
        " 相对行号: 行号变成相对，可以用 nj/nk 进行跳转
        set relativenumber number
        au FocusLost * :set norelativenumber number
        au FocusGained * :set relativenumber
        " 插入模式下用绝对行号, 普通模式下用相对
        autocmd InsertEnter * :set norelativenumber number
        autocmd InsertLeave * :set relativenumber
        function! NumberToggle()
            if(&relativenumber == 1)
                set norelativenumber number
            else
                set relativenumber
            endif
        endfunc
        nnoremap <C-m> :call NumberToggle()<cr>

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


" Search 搜索
        set ignorecase      " Search ignoring case " 搜索时大小写不敏感
        set smartcase       " Keep case when searching with * " 搜索时保存记录
        set infercase       " Adjust case in insert completion mode " 关键字自动补全的匹配调整大小写
        set incsearch       " Incremental search " 输入的过程中就开始搜索
        set hlsearch        " Highlight search results " highlight 搜索结果
        set wrapscan        " Searches wrap around the end of the file
        set showmatch       " Jump to matching bracket " 显示匹配的括号 闪烁0.5秒
        set matchpairs+=<:> " Add HTML brackets to pair matching " HTML文本括号匹配
        set matchtime=1     " Tenths of a second to show the matching paren " 1/10 秒闪烁时间
        set cpoptions-=m    " showmatch will wait 0.5s or until a char is typed " showmatch 闪烁0.5 until 新的输入
        set showfulltag     " Show tag and tidy search in completion 完成显示标签和整洁的搜索
        set grepprg=rg\ --vimgrep\ $*

"==============================================================================


"=========================== FileEncode Settings ==============================
if has('vim_starting')
	set encoding=UTF-8
	scriptencoding UTF-8
endif
set helplang=cn
set langmenu=en_US "zh_CN  " 编码 encoding
let &termencoding=&encoding " 下面这句只影响普通模式 (非图形界面) 下的 Vim
set fenc=utf-8
set fencs=utf-8,usc-bom,euc-jp,gb18030,gbk,gb2312,cp936 " 自动判断编码时，依次尝试以下编码
"==============================================================================


"================================== Others ====================================
"" 不参与自动补全
if has('wildmenu')
    set wildmenu                " set nowildmenu
    " 命令模式下显示 tab 自动补全
    set wildmode=full           " set wildmode=list:longest,full
    set wildoptions=tagfile
    set wildignorecase
    set wildignore+=.git,.hg,.svn,.stversions,*.pyc,*.spl,*.o,*.out,*~,%*
    set wildignore+=*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store
    set wildignore+=**/node_modules/**,**/bower_modules/**,*/.sass-cache/*
    set wildignore+=application/vendor/**,**/vendor/ckeditor/**,media/vendor/**
    set wildignore+=__pycache__,*.egg-info,.pytest_cache
endif
"==============================================================================


"============================= TEMP Settings ==================================
" What to save for views:
set viewoptions-=options
set viewoptions+=slash,unix

" What to save in sessions:
set sessionoptions-=blank
set sessionoptions-=options
set sessionoptions-=globals
set sessionoptions-=folds
set sessionoptions-=help
set sessionoptions-=buffers
set sessionoptions+=tabpages

" Vim Directories
set undofile swapfile backup
set directory=$DATA_PATH/swap//,$DATA_PATH,~/tmp,/var/tmp,/tmp
set undodir=$DATA_PATH/undos//,$DATA_PATH,~/tmp,/var/tmp,/tmp
set backupdir=$DATA_PATH/backups//,$DATA_PATH,~/tmp,/var/tmp,/tmp
set viewdir=$DATA_PATH/view/
if has('nvim')
    set shada='300,<50,@100,s10,h
else
    set viminfo='300,<10,@50,h,n$DATA_PATH/viminfo
endif

" Disable swap/undo/viminfo/shada files in temp directories or shm
augroup MyAutoCmd
	autocmd!
	silent! autocmd BufNewFile,BufReadPre
		\ /tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*,/private/var/*,.vault.vim
		\ setlocal noswapfile noundofile nobackup nowritebackup viminfo= shada=
augroup END
"==============================================================================
