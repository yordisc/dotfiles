"==============================================================================
" General
"==============================================================================

"Directories
so ~/.vim/plugins.vim
so ~/.vim/pluginsconfig.vim
so ~/.vim/maps.vim
so ~/.vim/color.vim

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
set cursorline					" Muestra línea debajo del cursor.
set clipboard=unnamed
set lazyredraw
set sw=2
set ruler 		     		    " show cursor position
set showmatch		   		    " show end
set laststatus=2				" Status bar
set ttyfast						" Speed up scrolling in Vim
set nocompatible
set history=1000	      	    " command line history
set undolevels=1000
set undofile
set undodir=~/.vim/undo
set nobackup
set nowritebackup
set noswapfile
set hidden						" move buffers whith save
set wildmenu     	  	        " enable visual wildmenu
set wildoptions=pum
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
set splitright

" Uncomment below to set the max textwidth. Use a value corresponding to the width of your screen.
set textwidth=79
set formatoptions=tcqrn1
set noshiftround
set termguicolors

"search
set nohlsearch     	    	    " clear highlight after a search
set hlsearch				    " Highlight matching search patterns
set incsearch					" Enable incremental search
set ignorecase					" Include matching uppercase words with lowercase search term
set smartcase					" Include only uppercase words with uppercase search term
set grepprg=rg\ --vimgrep\ --smart-case\ --follow					" plugin ripgrep
" Set status line display
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ [BUFFER=%n]\ %{strftime('%c')}

" Debug
echom "Loaded <filename>"
