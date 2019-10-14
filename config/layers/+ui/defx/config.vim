" Defx
call defx#custom#option('_', {
	\ 'columns': 'indent:git:icons:filename',
	\ 'winwidth': 30,
	\ 'split': 'vertical',
	\ 'direction': 'topleft',
	\ 'show_ignored_files': 0,
	\ })

call defx#custom#column('filename', {
	\ 'min_width': 5,
	\ 'max_width': 30,
	\ })

" Events
" ---
" Close defx if it's the only buffer left in the window
autocmd MyAutoCmd WinEnter * if &ft == 'defx' && winnr('$') == 1 | bd | endif

" Move focus to the next window if current buffer is defx
autocmd MyAutoCmd TabLeave * if &ft == 'defx' | wincmd w | endif

autocmd TabClosed * call s:defx_close_tab(expand('<afile>'))

" Define defx window mappings
autocmd FileType defx call s:defx_mappings()



" Internal functions
" ---
function! s:defx_close_tab(tabnr)
	" When a tab is closed, find and delete any associated defx buffers
	for l:nr in range(1, bufnr('$'))
		let l:defx = getbufvar(l:nr, 'defx')
		if empty(l:defx)
			continue
		endif
		let l:context = get(l:defx, 'context', {})
		if get(l:context, 'buffer_name', '') ==# 'tab' . a:tabnr
			silent! execute 'bdelete '.l:nr
			break
		endif
	endfor
endfunction

function! s:defx_toggle_tree() abort
	" Open current file, or toggle directory expand/collapse
	if defx#is_directory()
		return defx#do_action('open_or_close_tree')
	endif
	return defx#do_action('multi', ['drop'])
endfunction

function! s:defx_refresh_cwd(event)
	" Automatically refresh opened Defx windows when changing working-directory
	let l:cwd = get(a:event, 'cwd', '')
	let l:scope = get(a:event, 'scope', '')   " global, tab, window
	let l:is_opened = bufwinnr('defx') > -1
	if ! l:is_opened || empty(l:cwd) || empty(l:scope)
		return
	endif

	" Abort if Defx is already on the cwd triggered (new files trigger this)
	let l:paths = get(getbufvar('defx', 'defx', {}), 'paths', [])
	if index(l:paths, l:cwd) >= 0
		return
	endif

	let l:tab = tabpagenr()
	call execute(printf('Defx -buffer-name=tab%s %s', l:tab, l:cwd))
	wincmd p
endfunction

function! s:jump_dirty(dir) abort
	" Jump to the next position with defx-git dirty symbols
	let l:icons = get(g:, 'defx_git_indicators', {})
	let l:icons_pattern = join(values(l:icons), '\|')

	if ! empty(l:icons_pattern)
		let l:direction = a:dir > 0 ? 'w' : 'bw'
		return search(printf('\(%s\)', l:icons_pattern), l:direction)
	endif
endfunction

function! s:defx_mappings() abort
	" Defx window keyboard mappings
	setlocal signcolumn=no

	nnoremap <silent><buffer><expr> <CR>  defx#do_action('drop')
	nnoremap <silent><buffer><expr> l     <SID>defx_toggle_tree()
	nnoremap <silent><buffer><expr> h     defx#async_action('cd', ['..'])
	nnoremap <silent><buffer><expr> t    defx#do_action('multi', [['drop', 'tabnew'], 'quit'])
	nnoremap <silent><buffer><expr> s     defx#do_action('open', 'botright vsplit')
	nnoremap <silent><buffer><expr> i     defx#do_action('open', 'botright split')
	nnoremap <silent><buffer><expr> P     defx#do_action('open', 'pedit')
	nnoremap <silent><buffer><expr> K     defx#do_action('new_directory')
	nnoremap <silent><buffer><expr> N     defx#do_action('new_multiple_files')
	nnoremap <silent><buffer><expr> dd    defx#do_action('remove_trash')
	nnoremap <silent><buffer><expr> r     defx#do_action('rename')
	nnoremap <silent><buffer><expr> x     defx#do_action('execute_system')
	nnoremap <silent><buffer><expr> .     defx#do_action('toggle_ignored_files')
	nnoremap <silent><buffer><expr> yy    defx#do_action('yank_path')
	nnoremap <silent><buffer><expr> ~     defx#async_action('cd')
	nnoremap <silent><buffer><expr> q     defx#do_action('quit')
	nnoremap <silent><buffer><expr> <Tab> winnr('$') != 1 ?
		\ ':<C-u>wincmd w<CR>' :
		\ ':<C-u>Defx -buffer-name=temp -split=vertical<CR>'

	nnoremap <silent><buffer>       [g :<C-u>call <SID>jump_dirty(-1)<CR>
	nnoremap <silent><buffer>       ]g :<C-u>call <SID>jump_dirty(1)<CR>
	nnoremap <silent><buffer><expr><nowait> \  defx#do_action('cd', getcwd())
	nnoremap <silent><buffer><expr><nowait> &  defx#do_action('cd', getcwd())
	nnoremap <silent><buffer><expr><nowait> c  defx#do_action('copy')
	nnoremap <silent><buffer><expr><nowait> m  defx#do_action('move')
	nnoremap <silent><buffer><expr><nowait> p  defx#do_action('paste')

	nnoremap <silent><buffer><expr><nowait> <Space>
		\ defx#do_action('toggle_select') . 'j'

	nnoremap <silent><buffer><expr> '      defx#do_action('toggle_select') . 'j'
	nnoremap <silent><buffer><expr> *      defx#do_action('toggle_select_all')
	nnoremap <silent><buffer><expr> <C-r>  defx#do_action('redraw')
	nnoremap <silent><buffer><expr> <C-g>  defx#do_action('print')

	nnoremap <silent><buffer><expr> S  defx#do_action('toggle_sort', 'Time')
	nnoremap <silent><buffer><expr> C
		\ defx#do_action('toggle_columns', 'indent:mark:filename:type:size:time')

endfunction
