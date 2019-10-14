"Plugin key settings

if dein#tap('accelerated-jk')
    nmap <silent>j <Plug>(accelerated_jk_gj)
    nmap <silent>k <Plug>(accelerated_jk_gk)
endif

if dein#tap('coc.nvim')
        " Using CocList
        " Show all diagnostics
        nnoremap <silent> <leader>cd  :<C-u>CocList diagnostics<cr>
        " Manage extensions
        nnoremap <silent> <leader>ce  :<C-u>CocList extensions<cr>
        " Show commands
        nnoremap <silent> <leader>cc  :<C-u>CocList commands<cr>
        " Find symbol of current document
        nnoremap <silent> <leader>co  :<C-u>CocList outline<cr>
        " Search workspace symbols
        nnoremap <silent> <leader>cs  :<C-u>CocList -I symbols<cr>
        " Do default action for next item.
        nnoremap <silent> <leader>cj  :<C-u>CocNext<CR>
        " Do default action for previous item.
        nnoremap <silent> <leader>ck  :<C-u>CocPrev<CR>
        " Resume latest coc list
        nnoremap <silent> <leader>cr  :<C-u>CocListResume<CR>
        " Use `[c` and `]c` for navigate diagnostics
        nmap <silent> ]c <Plug>(coc-diagnostic-prev)
        nmap <silent> [c <Plug>(coc-diagnostic-next)
        " Remap for rename current word
        nmap <leader>cn <Plug>(coc-rename)
        " Remap for format selected region
        vmap <leader>cf  <Plug>(coc-format-selected)
        nmap <leader>cf  <Plug>(coc-format-selected)
        " Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
        xmap <leader>ca  <Plug>(coc-codeaction-selected)
        nmap <leader>ca  <Plug>(coc-codeaction-selected)
        " Remap for do codeAction of current line
        nmap <leader>ac  <Plug>(coc-codeaction)
        " Fix autofix problem of current line
        nmap <leader>qf  <Plug>(coc-fix-current)
        " Remap keys for gotos
        nmap <silent> gd <Plug>(coc-definition)
        nmap <silent> gy <Plug>(coc-type-definition)
        nmap <silent> gi <Plug>(coc-implementation)
        nmap <silent> gr <Plug>(coc-references)
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
        nnoremap <silent> <leader>cg  :<C-u>CocList --normal gstatus<CR>
        " float window scroll
        nnoremap <expr><C-f> coc#util#has_float() ? coc#util#float_scroll(1) : "\<C-f>"
        nnoremap <expr><C-b> coc#util#has_float() ? coc#util#float_scroll(0) : "\<C-b>"
        " multiple cursors
        nmap <silent> <C-c> <Plug>(coc-cursors-position)
        nmap <expr> <silent> <C-m> <SID>select_current_word()
        xmap <silent> <C-d> <Plug>(coc-cursors-range)
        " use normal command like `<leader>xi(`
        nmap <leader>x  <Plug>(coc-cursors-operator)

        function! s:select_current_word()
            if !get(g:, 'coc_cursors_activated', 0)
                return "\<Plug>(coc-cursors-word)"
            endif
            return "*\<Plug>(coc-cursors-word):nohlsearch\<CR>"
        endfunc

        nnoremap <silent> <leader>cm ::CocSearch -w 
        nnoremap <silent> <leader>cw ::CocSearch  
        " use normal command like `<leader>xi(`
        nmap <leader>x  <Plug>(coc-cursors-operator)
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

if dein#tap('vimagit')
    nnoremap <silent> mg :Magit<CR>
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
endif

if dein#tap('vim-go')
    nnoremap <silent> <localleader>gi :GoImpl<CR>
    nnoremap <silent> <localleader>gd :GoDescribe<CR>
    nnoremap <silent> <localleader>gc :GoCallees<CR>
    nnoremap <silent> <localleader>gC :GOCallers<CR>
    nnoremap <silent> <localleader>gs :GoCallstack<CR>
    nnoremap <silent> <localleader>gr :GoRun<CR>
    nnoremap <silent> <localleader>gv :GoVet<CR>
endif

if dein#tap('vim-mundo')
    nnoremap <silent> <leader>m :MundoToggle<CR>
endif

if dein#tap('vim-quickrun')
    nnoremap <silent> <localleader>r :QuickRun<CR>
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