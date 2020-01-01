let g:which_key_map = {}
let g:which_key_map = {
    \  'name': 'dot-nvim',
    \ '1' : 'select window-1'      ,
    \ '2' : 'select window-2'      ,
    \ '3' : 'select window-3'      ,
    \ '4' : 'select window-4'      ,
    \ '5' : 'select window-5'      ,
    \ '6' : 'select window-6'      ,
    \ '7' : 'select window-7'      ,
    \ '8' : 'select window-8'      ,
    \ '9' : 'select window-9'      ,
    \ '0' : 'select window-10'      ,
    \  'a': {
            \  'name': 'coc-code-action',
            \  'c': 'code action',
            \  },
    \  'b': 'toggle fold',
    \  'c': {
            \ 'name': 'coc list',
            \ 'a': 'coc CodeActionSelected',
            \ 'c': 'coc Commands',
            \ 'd': 'coc Diagnostics',
            \ 'e': 'coc Extensions',
            \ 'f': 'coc Format',
            \ 'g': 'coc Gitstatus',
            \ 'j': 'coc Next',
            \ 'k': 'coc Prev',
            \ 'm': 'coc search word to multiple cursors',
            \ 'n': 'coc Rename',
            \ 'o': 'coc OutLine',
            \ 'r': 'coc Resume',
            \ 's': 'coc Isymbols',
        \  },
    \  'd': 'search cursor word on Dash.app',
    \  'e': 'oepn file explorer',
    \  '-': 'choose window by {prompt char}',
    \  'f': {
            \ 'name': 'search {file cursorword word outline}',
            \ 'b': 'buffer list',
            \ 'c': 'change colorscheme',
            \ 'f': 'find file',
            \ 'r': 'search {word}',
            \ 'w': 'search cursorword',
            \ 'v': 'search outline',
            \  },
    \  'F': 'find current file',
    \  'g': {
            \ 'name': 'git-operate',
            \ 'b': 'Gblame',
            \ 'B': 'Gbrowse',
            \ 'c': 'Gcommit',
            \ 'd': 'Gdiff',
            \ 'p': 'git push',
            \ 'S': 'Gstatus',
            \  },
    \  'j': 'open coc-explorer',
    \  'm': 'open mudotree',
    \  'n': 'set number/relativenumber',
    \  'q': {
            \ 'name': 'quickrun',
            \ 'r': 'quick run',
            \ 'f': 'coc Quickfix fixcurrent',
            \ },
    \  't': {
            \ 'name': 'tab-operate',
            \ 'c': 'tab close',
            \ 'e': 'edit tab',
            \ 'm': 'move tab',
            \ 'n': 'new tab',
            \ },
    \  'w': 'save file',
    \  'x': 'coc cursors operate',
    \}

let g:which_key_map[' '] = {
      \ 'name' : '+easymotion-jumpto-word ' ,
      \ 'b' : ['<plug>(easymotion-b)' , 'beginning of word backward'],
      \ 'f' : ['<plug>(easymotion-f)' , 'find {char} to the left'],
      \ 'h' : ['<plug>(easymotion-h)' , 'beginning of linebackward'],
      \ 'j' : ['<plug>(easymotion-j)' , 'beginning of bottom line'],
      \ 'k' : ['<plug>(easymotion-k)' , 'beginning of top line'],
      \ 'l' : ['<plug>(easymotion-l)' , 'beginning of lineforward'],
      \ 'w' : ['<plug>(easymotion-w)' , 'beginning of word forward'],
      \ }


let g:which_key_rsbgmap = {
    \ 'name': 'Right Squarebrackets',
    \   'b'    : 'next buffer',
    \   'c': 'coc nextdiagnostics',
    \   'g'    : 'coc gitnextchunk',
    \   ']'    : 'jump prefunction-golang',
    \ }

let g:which_key_lsbgmap = {
      \ 'name' : 'Left Squarebrackets',
      \ 'b'    : 'pre buffer',
      \ 'c'    : 'coc prediagnostics',
      \ 'g'    : 'coc gitprevchunk',
      \ '['    : 'jump nextfunction-golang',
      \ }


let g:which_key_localmap ={
      \ 'name' : 'Local LeaderKey'  ,
      \ 'g' : {
            \ 'name' : '+golang-toolkit',
            \ 'i'    : 'go impl',
            \ 'd'    : 'go describe',
            \ 'c'    : 'go callees',
            \ 'C'    : 'go callers',
            \ 's'    : 'go callstack',
            \ 'r'    : 'go run',
            \ 'v'    : 'go vet',
            \ },
      \ 'm'    : 'toolkit Menu',
      \ 'v'    : 'open vista show outline',
      \ }

let s:current_colorscheme = get(g:,"colors_name","")
if  s:current_colorscheme == "base16-default-dark"
    highlight WhichKeySeperator guibg=NONE ctermbg=NONE guifg=#a1b56c ctermfg=02
endif
