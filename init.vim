" import plugins
call plug#begin()
	Plug 'jacquesbh/vim-showmarks'
	Plug 'jremmen/vim-ripgrep'
	Plug 'Raimondi/delimitMate'
	Plug 'scrooloose/nerdtree'
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
	Plug 'Shougo/neosnippet.vim'
	Plug 'Shougo/neosnippet-snippets'
	Plug 'spiiph/vim-space'
	Plug 'tpope/vim-commentary'
	Plug 'tpope/vim-fugitive'
	Plug 'tpope/vim-sleuth'  " match indent settings to present file
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
	Plug 'othree/xml.vim'
	Plug 'posva/vim-vue'

	" cloudformation
	Plug 'pedrohdz/vim-yaml-folds'

	" ruby / rails
	Plug 'takkii/Bignyanco'
	Plug 'tpope/vim-endwise'
	Plug 'tpope/vim-rails'

call plug#end()

" plugin setup
let NERDTreeIgnore = ['\.pyc$', '\~$', '\.zip$']
let g:deoplete#enable_at_startup = 1
let g:python_host_prog = '/Users/matt.plitnikas/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = '/Users/matt.plitnikas/.pyenv/versions/neovim3/bin/python'
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
set shiftwidth=0
set scrolloff=100
set sidescrolloff=5
set number
set autoindent
set cindent
set showmatch
set updatetime=100
set switchbuf+=usetab,newtab

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
map <Leader>s :Rg<space>
nnoremap <silent> <Esc><Esc> <Esc>:noh<CR><Esc>
nnoremap <Leader>m :DoShowMarks<CR>
map <Leader>f :FZF<CR>
command! -nargs=+ HG execute 'silent grep! <args>' | copen 33
noremap H :tabprevious<CR>
noremap L :tabnext<CR>
noremap <C-y> :+tabmove<CR>
noremap <C-t> :-tabmove<CR>
" if ruby / rails
autocmd FileType ruby nnoremap <Leader>t :Rails<CR>
autocmd FileType ruby nnoremap <Leader>y :.Rails<CR>
" this doesn't work yet :(
" autocmd FileType ruby nnoremap <Leader>b Obyebug<Esc>j
autocmd FileType ruby set foldmethod=syntax
"let g:ruby_host_prog = '~/.rvm/gems/ruby-2.7.0/gems/neovim-0.8.1/exe/neovim-ruby-host'
"let g:ruby_host_prog = 'rvm 2.7.0 do neovim-ruby-host'
autocmd FileType python nnoremap <Leader>t :!pytest -q %<CR>

" for deoplete / neosnippet
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)
" smap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" autocmds
autocmd StdinReadPre * let s:std_in=1
autocmd BufEnter * DoShowMarks
autocmd BufEnter *.vue,*.js set expandtab

