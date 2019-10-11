" Theme
"==============================================================================
"
" Autoloads theme according to user selected colorschemes


" COLORSCHEME NAME
function! theme#init() abort
    let l:default = 'dracula'
    let l:cache = g:etc#cache_path . '/theme.txt'
    if ! exists('g:colors_name')
        set background=dark
        let l:scheme = filereadable(l:cache) ? readfile(l:cache)[0] : l:default
        silent! execute 'colorscheme' l:scheme
    endif
endfunction

"" vim: set ts=2 sw=2 tw=80 noet :
