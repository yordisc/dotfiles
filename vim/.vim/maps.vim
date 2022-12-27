"==============================================================================
"Keymaps
"==============================================================================

let mapleader= ","


" Reload init.vim
"nnoremap <silent> <Leader> :source $MYVIMRC<cr>

" Basic shortcut
noremap <Leader>k <cmd>:Menu<CR>
nnoremap <silent> <Leader>. :Startify<cr>
nnoremap <silent> <C-s> :write<CR>
nnoremap <silent> <leader>n :new<CR>
nnoremap <silent> <Leader>as :ASToggle<CR>
nnoremap <silent> <C-q> :q!<CR>
nnoremap <silent> <C-s> :write<CR>
nnoremap <silent> <C-w> :bw<CR>
map <Leader>nf :NERDTreeFind<CR>
nmap <Leader>nt :NERDTreeToggle<cr>
"nnoremap <silent> <F2> :NERDTreeFind<CR>
nnoremap <silent> <F3> :NERDTreeToggle<CR>
nnoremap <silent> <C-E> :NERDTreeToggle<CR>
"nmap <Leader>s <Plug>(easymotion-s2)
nmap <C-F> <Plug>(easymotion-s2)
let g:peekup_open = '<leader>-'

"MiniMap
noremap <leader>mo <cmd>:MiniMap<CR>
noremap <leader>mc <cmd>:MiniMapClose<CR>
" nnoremap <silent> `` :nohlsearch<CR>:call minimap#vim#ClearColorSearch()<CR>

" markdown preview
noremap <leader>mp <cmd>:MarkdownPreview<cr>
noremap <leader>ms <cmd>:MarkdownPreviewStop<cr>

"undo history
nmap <leader>ms <cmd>:MundoShow<cr>
nmap <leader>mh <cmd>:MundoHide<cr>

" Buffers config
nnoremap <C-w> <cmd>:Bdelete this<cr>
nnoremap <leader>t <cmd>:ls<cr>
nnoremap <leader>W <cmd>:tabfirst<cr>
"nnoremap <leader>w <cmd>:tabprevious<cr>
nnoremap <leader>w <cmd>:bprevious<cr>
nnoremap <leader>e <cmd>:bnext<cr>
"nnoremap <leader>e <cmd>:tabnext<cr>
nnoremap <leader>E <cmd>:tablast<cr>
nmap <leader>º <cmd>:Bdelete other<cr>
nmap <leader>ª <cmd>:Bdelete all<cr>
nmap <leader>= <cmd>:Bdelete hidden<cr>
nmap <leader>0 <cmd>:Bdelete menu<cr>
nnoremap <leader>1 <cmd>:buffer 1<cr>
nnoremap <leader>2 <cmd>:buffer 2<cr>
nnoremap <leader>3 <cmd>:buffer 3<cr>
nnoremap <leader>4 <cmd>:buffer 4<cr>
nnoremap <leader>5 <cmd>:buffer 5<cr>
nnoremap <leader>6 <cmd>:buffer 6<cr>
nnoremap <leader>7 <cmd>:buffer 7<cr>
nnoremap <leader>8 <cmd>:buffer 8<cr>
nnoremap <leader>9 <cmd>:buffer 9<cr>

" configuracion de comentarios
nnoremap <F2> :Commentary<CR>
vnoremap <F2> :Commentary<CR>
" nnoremap <C-k> :Commentary<CR>
" vnoremap <C-k>:Commentary<CR>
"nnoremap <C-/> :Commentary<CR>

" Copy to system clipboard
noremap <leader>c "*yy<cr>
vmap <C-C> "+y

" Cut without indent
noremap <leader>x "c<cr>
"noremap <C-X> "d<cr>
"noremap <C-x> "dw<cr>

" Paste without indent
noremap <leader>v "+p<cr>
" noremap <C-v> "+p<cr>

" Abrir terminal
noremap <C-t> <cmd>:FloatermNew<CR>
noremap <C-`> <cmd>:FloatermNew<CR>
noremap <leader>tn <cmd>:FloatermNew<CR>
noremap <leader>tl <cmd>:LeaderF floaterm<CR>
nnoremap <leader>tw <cmd>:FloatermPrev<CR>
nnoremap <leader>te <cmd>:FloatermNext<CR>
nnoremap <leader>tt <cmd>:FloatermToggle<CR>
nnoremap <leader>tx <cmd>:FloatermKill<CR>
noremap <leader>tr <cmd>:FloatermNew ranger<CR>
noremap <leader>tf <cmd>:FloatermNew fzf<CR>
nnoremap <leader>te :FloatermRepl<CR>
vnoremap <leader>te :FloatermRepl<CR>

" Goyo (Zen Mode)
noremap <silent> <C-KZ>:Goyo<cr>
noremap <silent> <C-kz>:Goyo!<cr>

" Debbug
nnoremap <silent>><F5> :call vimspector#Launch()<CR>
nnoremap <Leader>de :call vimspector#Reset()<CR>
nnoremap <Leader>dc :call vimspector#Continue()<CR>
nnoremap <silent>><F9 :call vimspector#ToggleBreakpoint()<CR>
nnoremap <Leader>dT :call vimspector#ClearBreakpoints()<CR>
nmap <Leader>dk <Plug>VimspectorRestart
nmap <Leader>dh <Plug>VimspectorStepOut
nmap <Leader>dl <Plug>VimspectorStepInto
nmap <Leader>dj <Plug>VimspectorStepOver

" Pane navigation
noremap <C-J> <C-W><C-J>
noremap <C-K> <C-W><C-K>
noremap <C-L> <C-W><C-L>
noremap <C-H> <C-W><C-H>

" For vim-terminal
tnoremap <C-J> <C-W><C-J>
tnoremap <C-K> <C-W><C-K>
tnoremap <C-L> <C-W><C-L>
tnoremap <C-H> <C-W><C-H>
tnoremap <C-b> <C-\><C-n>

" fzf.vim
"noremap <leader>p :Files<cr>
noremap <leader>fi :Files<cr>
noremap <leader>fa :Ag<cr>
noremap <leader>fb :Buffers<cr>
noremap <leader>fg :GFiles<cr>

" Plug
"noremap <C-X> :PlugInstall<CR>
nnoremap <silent><leader>pi :PlugInstall<CR>
nnoremap <silent><leader>ps :PlugStatus<CR>
nnoremap <silent><leader>pc :PlugClean<CR>
nnoremap <silent><leader>pu :PlugUpdate<CR>

" Tab autocomplete
inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

" Shift + j/k in visual mode for smart move
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Automatically save and load folds
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview"

noremap <leader><cr> <cr><c-w>h:q<cr>
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Prettier configuracion
command! -nargs=0 Prettier :CocCommand prettier.formatFile
nnoremap <C-D> :Prettier<CR>
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" snippets configuracion
let g:UtilSnipsExpandTrigger="<tab>"

"Coc-Snippet
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)
" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)
" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'
" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'
" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)
" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
let g:coc_snippet_next = '<tab>'