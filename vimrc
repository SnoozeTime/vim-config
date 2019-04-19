set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
Plugin 'valloric/youcompleteme'
Plugin 'rking/ag.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Bundle 'mattn/calendar-vim'

" smart indent
Plugin 'vim-scripts/indentpython.vim'

" note taking
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax' 
Plugin 'vimwiki/vimwiki'
Plugin 'tpope/vim-fugitive'
Plugin 'fatih/vim-go'

" Rust
Plugin 'rust-lang/rust.vim'
Plugin 'cespare/vim-toml'
Plugin 'timonv/vim-cargo'
Plugin 'racer-rust/vim-racer'

" Blockchain stuff
Plugin 'tomlion/vim-solidity'

" Web dev
Plugin 'mattn/emmet-vim'
Plugin 'pangloss/vim-javascript'
Plugin 'posva/vim-vue'

" Unity and C#
Bundle 'OmniSharp/omnisharp-vim'
Plugin 'tikhomirov/vim-glsl'

Plugin 'hashivim/vim-terraform'
Plugin 'leafgarland/typescript-vim'

Plugin 'chr4/nginx.vim'

" Kotlin not so bad
Plugin 'udalov/kotlin-vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" ------------------------------------------------------------
"  Better default?
" ------------------------------------------------------------
syntax enable " syntax processing to show in other font or highlight


" One such option is the 'hidden' option, which allows you to re-use the same
" window and switch from an unsaved buffer without saving it first. Also allows
" you to keep an undo history for multiple files when re-using the same window
" in this way. Note that using persistent undo also lets you undo in multiple
" files even in the same window, but is less efficient and is actually designed
" for keeping undo history after closing Vim entirely. Vim will complain if you
" try to quit without saving, and swap files will keep you safe if your computer
" crashes.
set hidden

"
" spaces and tabs
" ---------------
set tabstop=4
set softtabstop=4 " when editing
set expandtab " tabs are spaces

" Indentation
" ------------
set smarttab
set cindent

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
 
" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start
 
" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent
 
" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline
 
" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler
 
" Always display the status line, even if only one window is displayed
set laststatus=2
 
" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm
 
" Use visual bell instead of beeping when doing something wrong
set visualbell
 
" And reset the terminal code for the visual bell. If visualbell is set, and
" this line is also included, vim will neither flash nor beep. If visualbell
" is unset, this does nothing.
set t_vb=
 
" Enable use of the mouse for all modes
set mouse=a
 
" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2
 

" Map leader modif
" -----------------
let mapleader="," " leader is comma instead of \

" edit vimrc/zshrc and load vimrc bindings
nnoremap <leader>ev :e $MYVIMRC<CR>
nnoremap <leader>ez :vsp ~/.zshrc<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
" open ag.vim
nnoremap <leader>a :Ag

" CtrlP settings
let g:ctrlp_match_window = 'bottom,order:ttb'
" let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
 
" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$
 
" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>

" Easy window navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

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
set t_Co=256
set background=dark
colorscheme zenburn
highlight Normal ctermbg=None


if has('python3')
   let g:gundo_prefer_python3 = 1
endif

" various plugin
"---------------
map <C-n> :NERDTreeToggle<CR>
set encoding=utf-8
let g:ycm_global_ycm_extra_conf = "~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"
nnoremap <leader>gt :YcmCompleter GoTo<CR>


" pep8 indentation
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=90 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |

:highlight BadWhitespace ctermfg=16 ctermbg=253 guifg=#000000 guibg=#F8F8F0
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h,*.cc,*.cpp match BadWhitespace /\s\+$/

py3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    exec(open(activate_this).read(), dict(__file__=activate_this))
EOF

" Vim wiki settings
" ------------------
let g:vimwiki_list = [{'path': '/mnt/c/Users/Linus/Dropbox/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]
au FileType vimwiki set syntax=pandoc
let g:pandoc#syntax#codeblocks#embeds#langs = ['cpp', 'python', 'rust']
let g:pandoc#syntax#conceal#use = 1
let g:pandoc#syntax#conceal#urls = 1
let g:vimwiki_auto_chdir = 0
" Set the current dir. Useful when some plugin are using autochangedir >>
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>


" For yaml
au BufRead, BufNewFile *.yaml, *.yml    set filetype=yaml
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab

autocmd FileType vimwiki setlocal nospell


" heigh of preview window (git status)
set previewheight=20

nnoremap <leader>gg :Gstatus<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gp :Gpush<CR>
nnoremap <leader>gf :Gpull<CR>
nnoremap <leader>gc :Gcommit<CR>

" meh
let g:go_version_warning = 0
nnoremap <leader>cc :Calendar<CR>

" Share clipboard.
set clipboard=unnamedplus

" Javscript
autocmd FileType javascript setlocal tabstop=4 sts=4 sw=4 expandtab autoindent
autocmd FileType typescript setlocal tabstop=4 sts=4 sw=4 expandtab autoindent
au BufRead, BufNewFile *.vue set filetype=vue
autocmd FileType vue setlocal tabstop=4 sts=4 sw=4 expandtab autoindent

" ----------------------------------------------------------
" RUST CONFIG
" ----------------------------------------------------------

" Compile from vim
autocmd FileType rust nnoremap <leader>cb :CargoBuild<CR>
let g:racer_cmd = "$HOME/.cargo/bin/racer"
let g:racer_experimental_completer = 1
au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)

let g:OmniSharp_server_use_mono = 1
" Set the type lookup function to use the preview window instead of echoing it

"let g:OmniSharp_typeLookupInPreview = 1


" Timeout in seconds to wait for a response from the server
let g:OmniSharp_timeout = 5

" Don't autoselect first omnicomplete option, show options even if there is only
" one (so the preview documentation is accessible). Remove 'preview' if you
" don't want to see any documentation whatsoever.
set completeopt=longest,menuone,preview

" Tell ALE to use OmniSharp for linting C# files, and no other linters.
let g:ale_linters = { 'cs': ['OmniSharp'] }

" Fetch semantic type/interface/identifier names on BufEnter and highlight them
let g:OmniSharp_highlight_types = 1


augroup omnisharp_commands
    autocmd!

    " When Syntastic is available but not ALE, automatic syntax check on events
    " (TextChanged requires Vim 7.4)
    " autocmd BufEnter,TextChanged,InsertLeave *.cs SyntasticCheck


    " Show type information automatically when the cursor stops moving
    autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()

    " Update the highlighting whenever leaving insert mode
    autocmd InsertLeave *.cs call OmniSharp#HighlightBuffer()

    " Alternatively, use a mapping to refresh highlighting for the current buffer
    autocmd FileType cs nnoremap <buffer> <Leader>th :OmniSharpHighlightTypes<CR>

    " The following commands are contextual, based on the cursor position.
    autocmd FileType cs nnoremap <buffer> gd :OmniSharpGotoDefinition<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fi :OmniSharpFindImplementations<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fs :OmniSharpFindSymbol<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fu :OmniSharpFindUsages<CR>

    " Finds members in the current buffer
    autocmd FileType cs nnoremap <buffer> <Leader>fm :OmniSharpFindMembers<CR>

    autocmd FileType cs nnoremap <buffer> <Leader>fx :OmniSharpFixUsings<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>tt :OmniSharpTypeLookup<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>dc :OmniSharpDocumentation<CR>
    autocmd FileType cs nnoremap <buffer> <C-\> :OmniSharpSignatureHelp<CR>
    autocmd FileType cs inoremap <buffer> <C-\> <C-o>:OmniSharpSignatureHelp<CR>


    " Navigate up and down by method/property/field
    autocmd FileType cs nnoremap <buffer> <C-k> :OmniSharpNavigateUp<CR>
    autocmd FileType cs nnoremap <buffer> <C-j> :OmniSharpNavigateDown<CR>
augroup END

" TerraforM (infra as code)
let g:terraform_align=1
let g:terraform_fmt_on_save=1


" FOR c# in unity
autocmd FileType cs setlocal ts=4 sts=4 sw=4 expandtab

autocmd! BufNewFile,BufRead *.vert,*.frag,*.vs,*.fs set ft=glsl

" FORMAT JSON ! YAY
nnoremap <leader>js :%! python3 -m json.tool<CR>

