set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
Plugin 'valloric/youcompleteme'
Plugin 'rking/ag.vim'
Plugin 'sjl/gundo.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" ------------------------------------------------------------
"  Better default?
" ------------------------------------------------------------
syntax enable " syntax processing to show in other font or highlight

" spaces and tabs
" ---------------
set tabstop=4
set softtabstop=4 " when editing
set expandtab " tabs are spaces

" UI config
" ---------
set number " show line number
set showcmd
set cursorline " show the current line
set wildmenu " visual autocomplete !
set lazyredraw " faster macros when no redrawing in macro
set showmatch " show matching ([{

" Searching
" ----------
set incsearch " search as characters are entered
set hlsearch " highlight search

" folding
" ------
set foldenable
set foldlevelstart=10 " open most folds by default
set foldnestmax=10
nnoremap <space> za
set foldmethod=indent


" Map leader modif
" -----------------
let mapleader="," " leader is comma instead of \
nnoremap <leader>u :GundoToggle<CR>

" edit vimrc/zshrc and load vimrc bindings
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>ez :vsp ~/.zshrc<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
" open ag.vim
nnoremap <leader>a :Ag

" CtrlP settings
let g:ctrlp_match_window = 'bottom,order:ttb'
" let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

" backup !
" -----------
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

" ---------------------------------------------------------------------
"  Appearance
" ---------------------------------------------------------------------
if $TERM == "xterm-256color"
	  set t_Co=256
endif
colorscheme badwolf

if has('python3')
   let g:gundo_prefer_python3 = 1
endif

" various plugin
"---------------
map <C-n> :NERDTreeToggle<CR>
set encoding=utf-8
let g:ycm_global_ycm_extra_conf = "~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoTo<CR>
nnoremap <leader>gi :YcmCompleter GoToInclude<CR>
