" normal mappings
" 分屏窗口移动, Smart way to move between windows
nnoremap <C-j> <C-W><C-J>
nnoremap <C-k> <C-W><C-K>
nnoremap <C-l> <C-W><C-L>
nnoremap <C-h> <C-W><C-H>
" smart move
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
" Go to home and end using capitalized directions
nnoremap H ^
nnoremap L $
" tab buffer 切换快捷键
nnoremap <leader>, gT
nnoremap <leader>. gt
" tabline operation
" 新建tab Ctrl + t
nnoremap <C-t> :tabnew<CR>
inoremap <C-t> :<Esc>:tabnew<CR>
noremap <leader>tc :tabclose<CR>
noremap <leader>te :tabedit<CR>
noremap <leader>tm :tabmove<CR>
" 复制整行
nnoremap Y y$
" 删除行尾的空格
nnoremap <silent> ,<Space> :<C-u>silent! keeppatterns %substitute/\s\+$//e<CR>
" jj 退出esc
inoremap jj <Esc>`^
" tab 标签页切换快捷键
nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt
nnoremap <leader>6 6gt
nnoremap <leader>7 7gt
nnoremap <leader>8 8gt
nnoremap <leader>9 8gt
nnoremap <leader>0 :tablast<CR>
" 调整缩进后自动选中, 方便再次操作
vnoremap < <gv
vnoremap > >gv
" 滚动 Speed up scrolling of the viewport slightly
nnoremap <C-e> 2<C-e>
nnoremap <C-y> 2<C-y>
