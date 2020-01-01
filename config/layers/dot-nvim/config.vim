"Plugin key settings
if dein#tap('accelerated-jk')
    nmap <silent>j <Plug>(accelerated_jk_gj)
    nmap <silent>k <Plug>(accelerated_jk_gk)
endif

if dein#tap('caw.vim')
    function! InitCaw() abort
		if ! &l:modifiable
			silent! nunmap <buffer> gc
			silent! xunmap <buffer> gc
			silent! nunmap <buffer> gcc
			silent! xunmap <buffer> gcc
		else
			nmap <buffer> gc <Plug>(caw:prefix)
			xmap <buffer> gc <Plug>(caw:prefix)
			nmap <buffer> gcc <Plug>(caw:hatpos:toggle)
			xmap <buffer> gcc <Plug>(caw:hatpos:toggle)
		endif
	endfunction
	autocmd FileType * call InitCaw()
	call InitCaw()
endif

if dein#tap('coc.nvim')
        " Using CocList
        " Use `[c` and `]c` for navigate diagnostics
        nmap <silent> ]c <Plug>(coc-diagnostic-prev)
        nmap <silent> [c <Plug>(coc-diagnostic-next)
        " Remap for do codeAction of current line
        nmap <leader>ac  <Plug>(coc-codeaction)
        " Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph 获取并执行 language server 给出的当前选择区间内的可用操作
        xmap <leader>ca  <Plug>(coc-codeaction-selected)
        nmap <leader>ca  <Plug>(coc-codeaction-selected)
        " Show commands 获取当前缓冲区可用命令列表
        nnoremap <silent> <leader>cc  :<C-u>CocList commands<cr>
        " Show all diagnostics 显示错误信息
        nnoremap <silent> <leader>cd  :<C-u>CocList diagnostics<cr>
        " Manage extensions 显示插件列表
        nnoremap <silent> <leader>ce  :<C-u>CocList extensions<cr>
				nnoremap <silent> <leader>cg  :<C-u>CocList --normal gstatus<CR>
        " Find symbol of current document
        nnoremap <silent> <leader>co  :<C-u>CocList outline<cr>
        " Search workspace symbols
        nnoremap <silent> <leader>cs  :<C-u>CocList -I symbols<cr>
        " Do default action for next item. 对之前列表的下一个选项执行默认操作
        nnoremap <silent> <leader>cj  :<C-u>CocNext<CR>
        " Do default action for previous item. 对之前列表的上一个选项执行默认操作
        nnoremap <silent> <leader>ck  :<C-u>CocPrev<CR>
        " Resume latest coc list 重新打开上一次的列表，输入字符和鼠标位置等信息将自动复原
        nnoremap <silent> <leader>cr  :<C-u>CocListResume<CR>
        " Remap for format selected region 格式化选中区间，可在正常和可视模式下工作
        vmap <leader>cf  <Plug>(coc-format-selected)
        nmap <leader>cf  <Plug>(coc-format-selected)
        " 搜索单词
        nnoremap <silent> <leader>cm ::CocSearch -w
        " Remap for rename current word 重命名光标所在位置符号
        nmap <leader>cn <Plug>(coc-rename)
        " Coc Search
        nnoremap <silent> <leader>cw ::CocSearch
        " Fix autofix problem of current line
        nmap <leader>qf  <Plug>(coc-fix-current)
        " Remap keys for gotos
        nmap <silent>gd <Plug>(coc-definition)
        nmap <silent>gy <Plug>(coc-type-definition)
        nmap <silent>gi <Plug>(coc-implementation)
        nmap <silent>gr <Plug>(coc-references)
        " Use K for show documentation in float window
        nnoremap <silent> K :call CocActionAsync('doHover')<CR>
        " use <c-space> for trigger completion.
        inoremap <silent><expr> <c-space> coc#refresh()
        nmap [g <Plug>(coc-git-prevchunk)
        nmap ]g <Plug>(coc-git-nextchunk)
        " show chunk diff at current position
        nmap gs <Plug>(coc-git-chunkinfo)
        " show commit contains current position
        nmap gm <Plug>(coc-git-commit)
        " float window scroll
        nnoremap <expr><C-f>coc#util#has_float() ? coc#util#float_scroll(1) : "\<C-f>"
        nnoremap <expr><C-b>coc#util#has_float() ? coc#util#float_scroll(0) : "\<C-b>"
        " multiple cursors
        " nmap <silent> <C-c> <Plug>(coc-cursors-position)
        " nmap <expr> <silent> <C-m> <SID>select_current_word()
        " xmap <silent> <C-d> <Plug>(coc-cursors-range)
        " use normal command like `<leader>xi(`
        nmap <leader> x  <Plug>(coc-cursors-operator)

        function! s:select_current_word()
            if !get(g:, 'coc_cursors_activated', 0)
                return "\<Plug>(coc-cursors-word)"
            endif
            return "*\<Plug>(coc-cursors-word):nohlsearch\<CR>"
        endfunc

        " coc-explorer
        noremap <silent> <leader>j :execute 'CocCommand explorer' .
            \ ' --toggle' .
            \ ' --sources=buffer+,file+' .
            \ ' --file-columns=git,selection,icon,clip,indent,filename,size ' . expand('%:p:h')<CR>
endif

if dein#tap('dash.vim')
    nnoremap <silent> <leader>d :Dash<CR>
endif

if dein#tap('defx.nvim')
    nnoremap <silent> <leader>e
            \  :<C-u>Defx -resume -toggle -buffer-name=tab`tabpagenr()`<CR>
    nnoremap <silent> <leader>F
            \  :<C-u>Defx -resume -toggle -search=`expand('%:p')` `getcwd()`<CR>
endif

if dein#tap('denite.nvim')
    nnoremap <silent><LocalLeader>m :<C-u>Denite menu<CR>
    noremap zl :<C-u>call <SID>my_denite_outline(&filetype)<CR>
    noremap zL :<C-u>call <SID>my_denite_decls(&filetype)<CR>
    noremap zT :<C-u>call <SID>my_denite_file_rec_goroot()<CR>

    function! s:my_denite_outline(filetype) abort
    execute 'Denite' a:filetype ==# 'go' ? "decls:'%:p'" : 'outline'
    endfunction
    function! s:my_denite_decls(filetype) abort
    if a:filetype ==# 'go'
        Denite decls
    else
        call denite#util#print_error('decls does not support filetypes except go')
    endif
    endfunction
    function! s:my_denite_file_rec_goroot() abort
    if !executable('go')
        call denite#util#print_error('`go` executable not found')
        return
    endif
    let out = system('go env | grep ''^GOROOT='' | cut -d\" -f2')
    let goroot = substitute(out, '\n', '', '')
    call denite#start(
            \ [{'name': 'file/rec', 'args': [goroot]}],
            \ {'input': '.go'})
    endfunction
endif

if dein#tap('emmet-vim')
        autocmd MyAutoCmd FileType html,css,javascript,javascriptreact
					\ EmmetInstall
					\ | imap <buffer> <C-Return> <Plug>(emmet-expand-abbr)
endif

if dein#tap('fzf.vim')
    nnoremap <silent> <leader>fc :Colors<CR>
    nnoremap <silent> <leader>fb :Buffers<CR>
    nnoremap <silent> <leader>ff :call Fzf_dev()<CR>
    nnoremap <silent> <leader>fr :Rg<CR>
    nnoremap <silent> <leader>fw :Rg <C-R><C-W><CR>
endif

if dein#tap('gina.vim')
    nnoremap <silent><leader>gp :Gina push<CR>
endif

if dein#tap('python_match.vim')
	nmap <buffer> {{ [%
	nmap <buffer> }} ]%
endif

if dein#tap('vim-mundo')
    nnoremap <silent><leader>m :MundoToggle<CR>
endif

if dein#tap('vimagit')
    nnoremap <silent>mg :Magit<CR>
endif

if dein#tap('vim-asterisk')
	map *   <Plug>(asterisk-g*)
	map g*  <Plug>(asterisk-*)
	map #   <Plug>(asterisk-g#)
	map g#  <Plug>(asterisk-#)

	map z*  <Plug>(asterisk-z*)
	map gz* <Plug>(asterisk-gz*)
	map z#  <Plug>(asterisk-z#)
	map gz# <Plug>(asterisk-gz#)
endif

if dein#tap('vim-choosewin')
    nmap -         <Plug>(choosewin)
    nmap <leader>- :<C-u>ChooseWinSwapStay<CR>
endif

if dein#tap('vim-easy-align')
    " Start interactive EasyAlign in visual mode (e.g. vipga)
    xmap ga <Plug>(EasyAlign)
    " Start interactive EasyAlign for a motion/text object (e.g. gaip)
    nmap ga <Plug>(EasyAlign)
endif

if dein#tap('vim-easygit')
    nnoremap <silent> <leader>gd :Gdiff<CR>
    nnoremap <silent> <leader>gc :Gcommit<CR>
    nnoremap <silent> <leader>gb :Gblame<CR>
    nnoremap <silent> <leader>gB :Gbrowse<CR>
    nnoremap <silent> <leader>gS :Gstatus<CR>
endif

if dein#tap('vim-easymotion')
    nmap <leader><leader>w <Plug>(easymotion-w)
    nmap <leader><leader>f <Plug>(easymotion-f)
    nmap <leader><leader>b <Plug>(easymotion-b)
    nmap <leader><leader>h <Plug>(easymotion-linebackward)
    nmap <leader><leader>j <Plug>(easymotion-j)
    nmap <leader><leader>k <Plug>(easymotion-k)
    nmap <leader><leader>l <Plug>(easymotion-lineforward)
endif

if dein#tap('vim-go')
    autocmd MyAutoCmd FileType go
        \ nnoremap <silent> <localleader>gi :GoImpl<CR>
        \ | nnoremap <silent> <localleader>gd :GoDescribe<CR>
        \ | nnoremap <silent> <localleader>gc :GoCallees<CR>
        \ | nnoremap <silent> <localleader>gC :GOCallers<CR>
        \ | nnoremap <silent> <localleader>gs :GoCallstack<CR>
        \ | nnoremap <silent> <localleader>gr :GoRun<CR>
        \ | nnoremap <silent> <localleader>gv :GoVet<CR>
endif

if dein#tap('vim-quickhl')
	nmap mt <Plug>(quickhl-manual-this)
	xmap mt <Plug>(quickhl-manual-this)
	nmap mC <Plug>(quickhl-manual-reset)
endif

if dein#tap('vim-quickrun')
    nnoremap <silent> <leader>qr :QuickRun<CR>
endif

if dein#tap('vim-which-key')
    nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
    nnoremap <silent> <localleader> :<c-u>WhichKey ';'<CR>
    nnoremap <silent> [             :<c-u>WhichKey '['<CR>
    nnoremap <silent> ]             :<c-u>WhichKey ']'<CR>
endif

if dein#tap('vista.vim')
    nnoremap <silent><localleader>v :Vista!!<CR>
    nnoremap <silent><leader>fv     :Vista finder coc<CR>
endif

" vim: set ts=2 sw=2 tw=80 noet :
