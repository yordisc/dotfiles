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

"Status Bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plug 'maximbaz/lightline-ale'
"Plug 'itchyny/lightline.vim'

"Interface

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'camspiers/animate.vim'
Plug 'camspiers/lens.vim'

"IDE
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim' "is a general-purpose command-line fuzzy finder.
Plug 'easymotion/vim-easymotion'  "motion on speed!
"Plug 'mhinz/vim-signify'
"Plug 'terryma/vim-multiple-cursors' "Multiple selection
Plug 'Yggdroot/indentLine'
Plug 'alpertuna/vim-header' "Agrega Headers al codigo

"Nerd
Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons' "icons

"Tmux
Plug 'benmills/vimux'
Plug 'christoomey/vim-tmux-navigator'

" Typing
Plug 'jiangmiao/auto-pairs'  "inserts closing quotes and parenthesis as you type
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-surround' "all about surroundings (Delete/change/add parentheses/quotes/XML-tags/much more with ease)

" Commenter
Plug 'tpope/vim-commentary' "Comment stuff out; takes a motion as a target
"Plug 'scrooloose/nerdcommenter'

"Test
Plug 'tyewang/vimux-jest-test'
Plug 'janko-m/vim-test'

"Debugging
"Plug 'puremourning/vimspector'
"Plug 'szw/vim-maximizer'

"Git
Plug 'tpope/vim-fugitive' "A Git wrapper so awesome, it should be illegal
Plug 'tpope/vim-repeat'
"Plug 'airblade/vim-gitgutter'
"Plug 'berdandy/AnsiEsc.vim'
"Plug 'dpelle/vim-LanguageTool'

"Terraform
"Plug 'hashivim/vim-terraform' " Terraform syntax and commands
"Plug 'juliosueiras/vim-terraform-completion'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'

"CoC
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}

"Checking Syntax
Plug 'dense-analysis/ale' "syntax checking and semantic errors 
Plug 'vim-syntastic/syntastic'  "Checking Syntax
"Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
"Plug 'SirVer/ultisnips', {'for': ['sh', 'python', 'markdown',]}
"Plug 'honza/vim-snippets', {'for': ['sh', 'python', 'markdown']}

"Syntax y indentation ==Pack==
Plug 'sheerun/vim-polyglot'  "A collection of language packs
"Plug 'ycm-core/YouCompleteMe'
"Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
"Plug 'norcalli/nvim-colorizer.lua'

"=============Language========================

" Markdown
"Plug 'godlygeek/tabular'
"Plug 'plasticboy/vim-markdown'
"Plug 'mzlogin/vim-markdown-toc'

" EMMET (Autocompletado HTML,CSS,JS)
Plug 'mattn/emmet-vim' "support for expanding abbreviations similar to emmet.

"js
Plug 'pangloss/vim-javascript' "JavaScript Support
Plug 'MaxMEllon/vim-jsx-pretty' "The React syntax highlighting and indenting 
Plug 'styled-components/vim-styled-components' "This project is not currently maintained.
Plug 'leafgarland/typescript-vim' " TypeScript syntax
Plug 'eslint/eslint' "identifying and reporting on patterns found in ECMAScript/JavaScript code

" snippets para javascript
"Plug 'mlaursen/vim-react-snippets'

"Python
Plug 'davidhalter/jedi-vim'
Plug 'vim-python/python-syntax'
Plug 'vim-scripts/indentpython.vim'
"Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
"Plug 'jeetsukumaran/vim-pythonsense' "provides some Python-specific text objects: classes, functions, etc

"PhP
Plug 'StanAngeloff/php.vim'

"GraphQl
"Plug 'jparise/vim-graphql'

" Go
"Plug 'fatih/vim-go'

" Rust
"Plug 'rust-lang/rust.vim'

" GLSL
"Plug 'tikhomirov/vim-glsl'

"COBOL
"Plug 'Jorengarenar/COBOl.vim'

call plug#end()

"==============================================================================
"Plugin Config
"==============================================================================

" NerdTreeConfig
let g:NERDTreeWinSize=40
let g:NERDTreeQuitOnOpen=1
"let NERDTreeShowHidden = 1
let NERDTreeMinimalUI=1
autocmd BufEnter * if tabpagenr('$') == 1 
      \ && winnr('$') == 1 
      \ && exists('b:NERDTree') 
      \ && b:NERDTree.isTabTree()
      \ | quit | endif

" vim-nerdtree-syntax-highlight
let g:NERDTreeHighlightFolders = 1
let g:NERDTreeHighlightFoldersFullName = 1
let g:NERDTreeSyntaxEnabledExtensions = ['rb', 'ruby']

"indentLine=============================================================
"let g:indentLine_showFirstIndentLevel = 1
"let g:indentLine_fileType = ['javascript', 'c']
let g:indentLine_fileTypeExclude = ["vimwiki", "coc-explorer", "help", "undotree", "diff"]
let g:indentLine_bufTypeExclude = ["help", "terminal"]
"let g:indentLine_bufNameExclude = []
let g:indentLine_indentLevel = 10

" Conceal settings
let g:indentLine_setConceal = 1
let g:indentLine_concealcursor = "incv"
let g:indentLine_conceallevel = 2

"let g:indentLine_char = '|'
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

" Leading Space
"let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_leadingSpaceChar = "•"

" Use Theme Colors
let g:indentLine_setColors = 0

" 16 Color
let g:indentLine_color_tty_light = 7 " (default: 4)
let g:indentLine_color_dark = 1 " (default: 2)

" 256
let g:indentLine_color_term = 239

" True Color
let g:indentLine_color_gui = '#616161'

" Background (256, True)
"let g:indentLine_bgcolor_term = 202
"let g:indentLine_bgcolor_gui = '#FF5F00'

"============================================================

" Terraform config
let g:terraform_fmt_on_save=1

"airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#bufferline#enabled = 1
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''

let g:coc_global_extensions = [ 'coc-tsserver' ]

" vim-devicons
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {}
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['html'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['js'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['json'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['jsx'] = 'ﰆ'
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['md'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['vim'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['yaml'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['yml'] = ''

let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols = {}
let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols['.*vimrc.*'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols['.gitignore'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols['package.json'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols['package.lock.json'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols['node_modules'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols['webpack\.'] = 'ﰩ'

let g:DevIconsEnableFoldersOpenClose = 1

" fzf.vim
let g:fzf_colors= {
      \  'border': ['fg', 'Type' ],
      \  'gutter': ['fg', 'Type' ] }

" Configuración para usar PEP8

au BufNewFile,BufRead *.py
    \ set expandtab | " convierte tab en espacios.
    \ set fileformat=unix

"Python    
let python_highlight_all = 1
let g:python_highlight_string_format = 1
let g:python_highlight_builtin_objs  = 1
let g:pymode_python = 'python3'

" vim-jsx-pretty
hi jsxAttrib ctermfg=3*
hi jsxComponentName ctermfg=4*
hi jsxTagName ctermfg=4*
hi jsxPunct ctermfg=3*
hi jsObjectProp ctermfg=3*
hi jsxCloseString ctermfg=3*

" typescript-vim
let g:typescript_indent_disable = 1
hi javaScriptLineComment ctermfg=4*

" vim-go
let g:go_highlight_structs = 1 
let g:go_highlight_methods = 1
let g:go_highlight_functions = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_string_spellcheck = 1
let g:go_highlight_types = 1
let g:go_highlight_function_calls = 1

" ============="
" ==CustomCmds="
" ============="

" Absolute path of open file to clipboard
function! Cwf()
    let @+=expand('%:p')
endfunction
command! Cwf call Cwf()

" Print working file_path
function! Pfp()
    echo expand('%')
endfunction
command! Pfp call Pfp()

" Relative path of open file to clipboard
function! Cwfr()
    let @+=expand('%')
endfunction
command! Cwfr call Cwfr()

" ex) :Tag h1
function! Tag(name)
    let @"="<" . a:name . "></" . a:name . ">"
    normal! pbbl
    startinsert
endfunction
command! -nargs=1 T call Tag(<f-args>)

" ex) :Jtag HelloWorld
function! Jtag(name)
    let @"="<" . a:name . " />"
    normal! pb
    startinsert
endfunction
command! -nargs=1 J call Jtag(<f-args>)

" Open up nerdtree and a bottom terminal
function In()
  execute "below term++rows=15"
  execute "NERDTreeToggle"
  execute "wincmd l"
endfunction
command! In call In()

" Open up a bottom terminal
function BTerm()
  execute "below term++rows=15"
endfunction
command! BTerm call BTerm()

function GColor()
  execute "echo synIDattr(synIDtrans(synID(line(\".\"), col(\".\"), 1)), \"fg#\")"
endfunction
command! GColor call GColor()

function F()
  execute "NERDTreeFind"
endfunction
command! F call F()

function LineUp()
  " There be a whitespace at the end of next line
  normal! ^dg_k$A 
  normal! pjdd
endfunction
command! LU call LineUp()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" EMMET configuracion
let g:user_emmet_mode='n'
let g:user_emmet_leader_key=','
let g:user_emmet_settings={
\ 'javascript':{
\ 'extends':'jsx'
\ }
\ }

" LSP configuracion
lua << EOF
require'lspconfig'.tsserver.setup{on_attach=require'completion'.on_attach}
EOF

"Git Gutter
let g:gitgutter_enabled = 1
let g:gitgutter_map_keys = 0
let g:gitgutter_highlight_linenrs = 1