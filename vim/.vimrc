"==============================================================================
" General
"==============================================================================

filetype off					" Helps force plug-ins to load correctly when it is turned back on below.
filetype plugin indent on		" For plug-ins to load correctly.
se t_Co=256
set scrolloff=8                 " Keep at least 8 lines below cursor 
set encoding=utf-8	     	    " utf8 encode
set number 		      			" Show line numbers
set number relativenumber       " Relative numbers for jumping 
set numberwidth=1
set nu rnu 	            	    " Hybrid. Relative numbers and the current line number 
set mouse=a		  		        " cursor interactive
set showmode					" Display options
set showcmd		    		    " show command
set cursorline					" Muestra líena debajo del cursor.
set clipboard=unnamed
set lazyredraw  
set sw=2
set ruler 		     		    " show cursor position
set showmatch		   		    " show end
set laststatus=2				" Status bar
set ttyfast						" Speed up scrolling in Vim
set nocompatible	     	    " Use Vim settings, rather then Vi settings (much better!).
set history=1000	      	    " command line history
set nobackup
set nowritebackup
set noswapfile
set wildmenu     	  	        " enable visual wildmenu
set backspace=indent,eol,start  " backspace everywhere in insert mode
set autoindent 	 	 	        " autoindent always ON.
set expandtab 		 	        " expand tabs
set tabstop=4					" Ancho en espacios de un tab.
set shiftwidth=4 	   		    " spaces for autoindenting
set softtabstop=4  	     	    " remove a full pseudo-TAB when i press <BS>
set splitbelow splitright       " Set the splits to open at the right side and below 
set wrap						" Automatically wrap text that extends beyond the screen length.
set viminfo='100,<9999,s100		" Store info from no more than 100 files at a time, 9999 lines of text, 100kb of data. Useful for copying large amounts of data between files.
syntax enable 			   		" Turn on syntax highlighting.
let &t_ut=''  	                " To render properly background of the color scheme

" Uncomment below to set the max textwidth. Use a value corresponding to the width of your screen.
set textwidth=79
set formatoptions=tcqrn1
set noshiftround

"search
set nohlsearch     	    	    " clear highlight after a search
set hlsearch				    " Highlight matching search patterns
set incsearch					" Enable incremental search
set ignorecase					" Include matching uppercase words with lowercase search term
set smartcase					" Include only uppercase words with uppercase search term

"Directories
so ~/.vim/plugins.vim
so ~/.vim/maps.vim

" Set status line display
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ [BUFFER=%n]\ %{strftime('%c')}

"==============================================================================
"Color Theme Config
"==============================================================================

"let g:vim_monokai_tasty_italic = 1                    " allow italics, set this before the colorscheme
"colorscheme vim-monokai-tasty                         " set the colorscheme

let g:one_allow_italics = 1
hi Normal guibg=NONE ctermbg=NONE
colorscheme srcery


" Optional themes for airline/lightline
"let g:airline_theme='monokai_tasty'                   " airline theme
let g:airline_theme='base16'
"let g:lightline = { 'colorscheme': 'monokai_tasty' }  " lightline theme

" If you don't like a particular colour choice from `vim-monokai-tasty`, you can
" override it here. For example, to change the colour of the search hightlight:
hi Search guifg=#bada55 guibg=#000000 gui=bold ctermfg=green ctermbg=black cterm=bold

" If you don't know what the name of a particular hightlight is, you can use
" `What`. It will print out the syntax group that the cursor is currently above.
" from https://www.reddit.com/r/vim/comments/6z4aau/how_to_stop_vim_from_autohighlighting_italics_in/
command! What echo synIDattr(synID(line('.'), col('.'), 1), 'name')

" Enable true colors
if exists('+termguicolors')
  " Necessary when using tmux
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" File-types
autocmd BufNewFile,BufRead *.go set filetype=go

" Tabs
set sw=2 ts=2 sts=2 " Default
autocmd FileType html :setlocal sw=2 ts=2 sts=2
autocmd FileType ruby :setlocal sw=2 ts=2 sts=2
autocmd FileType javascript :setlocal sw=2 ts=2 sts=2
autocmd FileType xml :setlocal sw=2 ts=2 sts=2
autocmd FileType python :setlocal sw=4 ts=4 sts=4
autocmd FileType go :setlocal sw=4 ts=4 sts=4

" Make vertical separator pretty
highlight VertSplit cterm=NONE
set fillchars+=vert:\▏

" Get rid of unnecessary highlight for spelling
highlight clear SpellBad