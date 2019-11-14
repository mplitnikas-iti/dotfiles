" import plugins
call plug#begin()
	Plug 'jacquesbh/vim-showmarks'
	Plug 'othree/xml.vim'
	Plug 'Raimondi/delimitMate'
	Plug 'scrooloose/nerdtree'
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
	Plug 'Shougo/neosnippet.vim'
	Plug 'Shougo/neosnippet-snippets'
	Plug 'spiiph/vim-space'
	Plug 'tpope/vim-commentary'
	Plug 'tpope/vim-fugitive'
	Plug 'tpope/vim-surround'
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'

	" colorscheme
	" Plug 'mhartington/oceanic-next'
	Plug 'joshdick/onedark.vim'
	Plug 'ryanoasis/vim-devicons'
	Plug 'sheerun/vim-polyglot'

	" python
	Plug 'deoplete-plugins/deoplete-jedi'
	Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
	Plug 'tmhedberg/SimpylFold'

	" vue
	Plug 'jelera/vim-javascript-syntax'
	Plug 'posva/vim-vue'

	" cloudformation
	Plug 'pedrohdz/vim-yaml-folds'

	" ruby / rails
	Plug 'tpope/vim-endwise'
	Plug 'tpope/vim-rails'
	
call plug#end()

" plugin setup
let NERDTreeIgnore = ['\.pyc$', '\~$', '\.zip$']
let g:deoplete#enable_at_startup = 1
let g:python3_host_prog = '/usr/local/bin/python3'
let g:python_host_prog = '/usr/bin/python'
let g:SimpylFold_docstring_preview = 1
" let g:airline_theme = 'oceanicnext'
let g:airline_theme = 'onedark'
let g:showmarks_marks = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
let g:AWSVimValidate = 1
let g:pymode_options_max_line_length = 120
let g:pymode_options_color_column = 1
set rtp+=/usr/local/opt/fzf

" display settings
syntax on
set encoding=utf-8
set tabstop=2
set shiftwidth=2
set scrolloff=5
set sidescrolloff=5
set number
set autoindent
set cindent
set showmatch
set updatetime=100

" colorscheme setup
if (has("nvim"))
	let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
if (has("termguicolors"))
	set termguicolors
endif
syntax on
colorscheme onedark
"colorscheme OceanicNext

" keybinds etc
let mapleader = ","
nnoremap <Leader>n :NERDTreeToggle<CR>
nnoremap <Leader>g :Gblame<CR>
"nnoremap <Leader>t :!pytest -q %<CR>
nnoremap <silent> <Esc><Esc> <Esc>:noh<CR><Esc>
nnoremap <Leader>m :DoShowMarks<CR>
map <Leader>f :FZF<CR>
" nnoremap <Leader>/ :Ag<SPACE><C-R><C-W><SPACE>
":cw<CR>

" autocmds
autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_inA") | NERDTree | endif
autocmd BufEnter * DoShowMarks
autocmd BufEnter *.vue,*.js set expandtab
" autocmd BufWritePost test*.py !pytest -q %

