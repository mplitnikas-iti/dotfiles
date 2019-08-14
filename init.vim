" import plugins
call plug#begin()
	Plug 'scrooloose/nerdtree'
	Plug 'tpope/vim-surround'
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'tpope/vim-fugitive'
	Plug 'othree/xml.vim'
	Plug 'Raimondi/delimitMate'
	Plug 'jacquesbh/vim-showmarks'
	Plug 'spiiph/vim-space'
	"Plug 'vim-scripts/L9'
	"Plug 'vim-scripts/FuzzyFinder'

	" colorscheme
	Plug 'mhartington/oceanic-next'
	Plug 'ryanoasis/vim-devicons'

	" python
	Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
	Plug 'deoplete-plugins/deoplete-jedi'
	Plug 'tmhedberg/SimpylFold'

	" vue
	Plug 'posva/vim-vue'

	" cloudformation
	Plug 'pedrohdz/vim-yaml-folds'
	"Plug 'elzr/vim-json'
call plug#end()

" plugin setup
let NERDTreeIgnore = ['\.pyc$', '\~$']
let g:deoplete#enable_at_startup = 1
let g:python3_host_prog = '/usr/local/bin/python3'
let g:python_host_prog = '/usr/bin/python'
let g:SimpylFold_docstring_preview = 1
let g:airline_theme = 'oceanicnext'
let g:showmarks_marks = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
let g:AWSVimValidate = 1
let g:pymode_options_max_line_length = 120
let g:pymode_options_color_column = 1

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
if (has("termguicolors"))
	set termguicolors
endif
syntax enable
colorscheme OceanicNext

" keybinds etc
let mapleader = ","
nnoremap <Leader>n :NERDTreeToggle<CR>
nnoremap <Leader>v :NERDTreeFind<CR>
nnoremap <Leader>g :Gblame<CR>
nnoremap <silent> <Esc><Esc> <Esc>:noh<CR><Esc>

" autocmds
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_inA") | NERDTree | endif
autocmd BufEnter * DoShowMarks
autocmd BufWritePost test*.py !pytest -q %

