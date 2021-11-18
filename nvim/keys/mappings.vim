" Better nav for omnicomplete
"inoremap <expr> <c-j> ("\<C-n>")
"inoremap <expr> <c-k> ("\<C-p>")

" Use al + hjkl to resize windows
" <M-_> for non-Mac OS
nnoremap ˚     :resize -2<CR>
nnoremap <M-k> :resize -2<CR>
nnoremap ∆     :resize +2<CR>
nnoremap <M-j> :resize +2<CR>
nnoremap ˙     :vertical resize -2<CR>
nnoremap <M-h> :vertical resize -2<CR>
nnoremap ¬     :vertical resize +2<CR>
nnoremap <M-l> :vertical resize +2<CR>

" Switch to NORMAL mode
inoremap jk <Esc>
inoremap kj <Esc>

" Capitalise words
inoremap <c-u> <ESC>viwUi
nnoremap <c-u> viwU<Esc>

" TAB to move to next buffer
nnoremap <TAB> :bnext<CR>
" SHIFT-TAB to move to previous buffer
nnoremap <S-TAB> :bprevious<CR>

" Use control-c instead of escape
nnoremap <C-c> <Esc>

" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" Use < and > for indenting
vnoremap < <gv
vnoremap > >gv

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Scroll the viewport x4 faster
nnoremap <C-e> 4<C-e>
nnoremap <C-y> 4<C-y>

" nnoremap <Leader>o o<Esc>^Da
" nnoremap <Leader>O O<Esc>^Da
nnoremap <silent> <cr> :noh<CR><CR>

