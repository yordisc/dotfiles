"==============================================================================
" Plugin Manager
"==============================================================================

call plug#begin('~/.vim/plugged')

" Themes
Plug 'morhetz/gruvbox'
let g:rehash256 = 1

" ColorSchemes
Plug 'srcery-colors/srcery-vim'
Plug 'pacokwon/onedarkhc.vim'
Plug 'julien/vim-colors-green'
Plug 'foxbunny/vim-amber'
Plug 'adrian5/oceanic-next-vim'
Plug 'tckmn/hotdog.vim'

" Icons
Plug 'ryanoasis/vim-devicons' "icons

"Buffer
Plug 'bagrat/vim-buffet'
Plug 'Asheq/close-buffers.vim'

" Status Bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Interface
Plug 'mhinz/vim-startify'
Plug 'nvim-lua/plenary.nvim'
Plug 'camspiers/animate.vim'
Plug 'camspiers/lens.vim'
Plug 'junegunn/goyo.vim' "Modo zen

" IDE
Plug 'editorconfig/editorconfig-vim'
Plug 'thaerkh/vim-workspace'   "Autoguardado y historial
Plug 'dstein64/vim-menu'
Plug 'Yggdroot/indentLine'
Plug 'alpertuna/vim-header' "Agrega Headers al codigo
Plug 'anufrievroman/vim-tex-kawaii' "Latex para Vim"
Plug 'simnalamburt/vim-mundo' "undo history
Plug 'Pocco81/auto-save.nvim'
Plug 'jremmen/vim-ripgrep'

" Terminal
Plug 'voldikss/vim-floaterm'
Plug 'voldikss/fzf-floaterm'
Plug 'windwp/vim-floaterm-repl'
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary' }

" Nerdtree
Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'easymotion/vim-easymotion'  "motion on speed!
Plug 'nvim-tree/nvim-tree.lua'

" Fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim' "is a general-purpose command-line fuzzy finder.

" Tmux
Plug 'benmills/vimux'
Plug 'christoomey/vim-tmux-navigator'

" Register Manager
Plug 'gennaro-tedesco/nvim-peekup'
Plug 'roobert/search-replace.nvim'

" MiniMap
Plug 'wfxr/minimap.vim' "Install https://github.com/wfxr/code-minimap/releases

" Typing
Plug 'jiangmiao/auto-pairs'  "inserts closing quotes and parenthesis as you type
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-surround' "all about surroundings (Delete/change/add parentheses/quotes/XML-tags/much more with ease)
Plug 'machakann/vim-highlightedyank' "yanked color
Plug 'itchyny/vim-highlighturl'
Plug 'kshenoy/vim-signature' "Mark
Plug 'tpope/vim-eunuch'

" Commenter
Plug 'tpope/vim-commentary' "Comment stuff out; takes a motion as a target
"Plug 'scrooloose/nerdcommenter'

" Test
Plug 'janko-m/vim-test'
Plug 'tyewang/vimux-jest-test'

" Debugging
Plug 'puremourning/vimspector'
Plug 'skywind3000/asynctasks.vim'
Plug 'skywind3000/asyncrun.vim'

" Git
Plug 'tpope/vim-fugitive' "A Git wrapper so awesome, it should be illegal
Plug 'tpope/vim-repeat'
"Plug 'airblade/vim-gitgutter'
"Plug 'berdandy/AnsiEsc.vim'
Plug 'sindrets/diffview.nvim'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'

" Checking Syntax
Plug 'dense-analysis/ale' "syntax checking and semantic errors 
Plug 'vim-syntastic/syntastic'  "Checking Syntax
Plug 'sheerun/vim-polyglot'  "A collection of language packs

" Coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}

"Coc-Extensions
let g:coc_global_extensions = [
    \ 'coc-tsserver',
    \ 'coc-vimlsp',
    \ 'coc-marketplace',
    \ 'coc-tabnine',
    \ 'coc-docker',
    \ 'coc-discord',
    \ 'coc-prettier',
    \ 'coc-highlight',
    \ 'coc-snippets',
    \ 'coc-pairs',
    \ 'coc-inline-jest',
    \ 'coc-emoji',
    \ 'coc-emmet',
    \ 'coc-sh',
    \ 'coc-eslint',
    \ 'coc-html-css-support',
    \ 'coc-json',
    \ 'coc-format-json',
    \ 'coc-jedi',
    \ 'coc-python',
    \ 'coc-sql',
    \ 'coc-xml',
    \ 'coc-phpls',
    \ 'coc-clangd',
\ ]

" IA
Plug 'codota/tabnine-nvim', { 'do': './dl_binaries.sh' }
Plug 'aduros/ai.vim'

" Dev Web
Plug 'manzeloth/live-server'

"=============Language========================

" csv
Plug 'chrisbra/csv.vim'

" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }

" js
Plug 'heavenshell/vim-jsdoc', {
  \ 'for': ['javascript', 'javascript.jsx','typescript'],
  \ 'do': 'make install'
\}
Plug 'MaxMEllon/vim-jsx-pretty' "The React syntax highlighting and indenting 
"Plug 'styled-components/vim-styled-components' "This project is not currently maintained.
Plug 'leafgarland/typescript-vim' " TypeScript syntax
Plug 'mlaursen/vim-react-snippets' " snippets para javascript

" Python
Plug 'davidhalter/jedi-vim'
"Plug 'vim-scripts/indentpython.vim'
Plug 'jupyter-vim/jupyter-vim'

" PhP
Plug 'StanAngeloff/php.vim'

" GraphQl
"Plug 'jparise/vim-graphql'

" Go
"Plug 'fatih/vim-go'

" Rust
"Plug 'rust-lang/rust.vim'

" GLSL
"Plug 'tikhomirov/vim-glsl'

" COBOL
Plug 'Jorengarenar/COBOl.vim'

" Godot
"Plug 'habamax/vim-godot'

call plug#end()
