syntax enable
colorscheme OceanicNext

" Make Vim more useful
set nocompatible

" Vundle Plugin Management
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" General
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'junegunn/vim-easy-align'

" Autocompleting
"Plugin 'Valloric/YouCompleteMe'

"Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'ervandew/supertab'

" Fuzzy file searching
Plugin 'ctrlpvim/ctrlp.vim'

" Front End
Plugin 'mattn/emmet-vim'
" JS
Plugin 'pangloss/vim-javascript'
Plugin 'leafgarland/typescript-vim'
Plugin 'peitalin/vim-jsx-typescript'


" PHP
Plugin 'StanAngeloff/php.vim'
Plugin 'shawncplus/phpcomplete.vim'

" Wordpress
Plugin 'dsawardekar/wordpress.vim'

" Ruby/Rails
Plugin 'tpope/vim-rails'
Plugin 'vim-ruby/vim-ruby' 

" Elixir
Plugin 'elixir-lang/vim-elixir'

" Writing prose-style
Plugin 'reedes/vim-pencil'
Plugin 'reedes/vim-wordy'

" Keep a local vimrc for project specific config
Plugin 'LucHermitte/lh-vim-lib'
Plugin 'LucHermitte/local_vimrc'

call vundle#end()
"End Vundle Config
filetype plugin indent on

" UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<c-j>"
let g:UltiSnipsJumpForwardTrigger = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-k>"

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" YouCompleteMe settings
" let g:ycm_server_keep_logfiles=1
" let g:ycm_python_binary_path = '/usr/local/bin/python3'
" Use the OS clipboard by default (on versions compiled with `+clipboard`)
if $TMUX == ''
  set clipboard+=unnamed
endif
" Enhance command-line completion
set wildmenu
" Allow cursor keys in insert mode
set esckeys
" Allow backspace in insert mode
set backspace=indent,eol,start
" Optimize for fast terminal connections
set ttyfast
" Add the g flag to search/replace by default
set gdefault
" Use UTF-8 without BOM
set encoding=utf-8 nobomb
" Change mapleader
let mapleader=","
" Don’t add empty newlines at the end of files
set binary
set noeol
" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
	set undodir=~/.vim/undo
endif

" Don’t create backups when editing files in certain directories
set backupskip=/tmp/*,/private/tmp/*

" Respect modeline in files
set modeline
set modelines=4
" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure
" Enable line numbers
set number
" Enable syntax highlighting
syntax on
" Highlight current line
set cursorline

" Make tabs as wide as two spaces
set tabstop=2
set softtabstop=2
set shiftwidth=2
" use spaces
set expandtab

" Use PEP8 styles for python files
au BufNewFile,BufRead, *.py 
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set fileformat=unix |

"python with virtualenv support
" py << EOF
" import os
" import sys
" if 'VIRTUAL_ENV' in os.environ:
"   project_base_dir = os.environ['VIRTUAL_ENV']
"   activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"   execfile(activate_this, dict(__file__=activate_this))
" EOF

" Show “invisible” characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list
" Highlight searches
set hlsearch
" Ignore case of searches
set ignorecase
" Highlight dynamically as pattern is typed
set incsearch
" Always show status line
set laststatus=2
" Disable error bells
set noerrorbells
" Don’t reset cursor to start of line when moving around.
set nostartofline
" Show the cursor position
set ruler
" Don’t show the intro message when starting Vim
set shortmess=atI
" Show the current mode
set showmode
" Show the filename in the window titlebar
set title
" Show the (partial) command as it’s being typed
set showcmd
" Copy indent from last line when starting new line
set autoindent 
" Folding settings
set foldmethod=manual
set nofoldenable
set foldlevel=1
set foldnestmax=10

"Use matchit.vim
packadd! matchit

set wildchar=<TAB> " Character for CLI expansion (TAB-completion)
set wildignore+=.DS_Store
set wildignore+=*.jpg,*.jpeg,*.gif,*.png,*.gif,*.psd,*.o,*.obj,*.min.js
set wildignore+=*/bower_components/*,*/node_modules/*
set wildignore+=*/smarty/*,*/vendor/*,*/.git/*,*/.hg/*,*/.svn/*,*/.sass-cache/*,*/log/*,*/tmp/*,*/build/*,*/ckeditor/*,*/doc/*,*/source_maps/*,*/dist/*
" Hitting TAB in command mode will show possible completions above command line
set wildmenu
" Complete only until point of ambiguity
set wildmode=list:longest 

" Use relative line numbers
if exists("&relativenumber")
	set relativenumber
	au BufReadPost * set relativenumber
endif
" Start scrolling three lines before the horizontal window border
set scrolloff=3

" Strip trailing whitespace (,ss)
function! StripWhitespace()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>
" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

" Powerline
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup

" Automatic commands
if has("autocmd")
	" Enable file type detection
	filetype on
	" Treat .json files as .js
	autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
	" Treat .md files as Markdown
	autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
  " JSP fragments as JSP
  autocmd BufNewFile,BufRead *.jspf set filetype=jsp
  autocmd BufNewFile,BufRead *.tag set filetype=jsp
  " Treat .hbs (handlebars) as html
  autocmd BufNewFile,BufRead *.hbs set filetype=html
endif
