" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" Automatic reading of open files when changed outside
set autoread

" Changing the current working directory to the one of the current file
autocmd BufEnter * :cd %:p:h

" Better copy & paste
" When you want to paste large blocks of code into vim, press F2 before you
" paste. At the bottom you should see ``-- INSERT (paste) --``.
" unnamedplus is a system register, for seamless coping across the OS

set pastetoggle=<F2>
set clipboard=unnamedplus
" maybe better unnamed - not sure what's the difference

" Shortening the title lines with full path
let g:Powerline_stl_path_style = 'short'

" x is coping, but I prefer at it just delete the text, so I change the
" register to the 'black hole'
noremap  x "_x

" Mouse and backspace
set bs=2 " make backspace behave like normal again

" Tabs visible all the time
set showtabline=2

" Rebind <Leader> key
" I like to have it here becuase it is easier to reach than the default and
" it is next to ``m`` and ``n`` which I use for navigating between tabs.
"" let mapleader = ","

" Startup options for CtrlP plugin
set runtimepath^=~/.vim/bundle/ctrlp.vim

" Bind nohl
" Removes highlight of your last search
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>


" Quicksave command
"" noremap <C-Z> :update<CR>
"" vnoremap <C-Z> <C-C>:update<CR>
"" inoremap <C-Z> <C-O>:update<CR>
noremap <c-s> :update<CR>

" Quick quit command
"" noremap <Leader>e :quit<CR> " Quit current window
"" noremap <Leader>E :qa!<CR> " Quit all windows


" bind Ctrl+<movement> keys to move around the windows, instead of using
" Ctrl+w + <movement>
" Every unnecessary keystroke that can be saved is good for your health :)
"map <c-j> <c-w>j
"map <c-k> <c-w>k
"map <c-l> <c-w>l
"map <c-h> <c-w>h


" easier moving between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>
map <c-h> <esc>:tabprevious<CR>
map <c-l> <esc>:tabnext<CR>

" faster cursor
" map <c-j> 10j
" map <c-k> 10k

" map sort function to a key
vnoremap <Leader>s :sort<CR>

" better indentation in visual mode
vnoremap < <gv
vnoremap > >gv


" Color scheme
" mkdir -p ~/.vim/colors && cd ~/.vim/colors
" wget -O wombat256mod.vim
" http://www.vim.org/scripts/download_script.php?src_id=13400
"" set t_Co=256
"" color wombat256mod


" Enable syntax highlighting
filetype off
filetype plugin indent on
syntax on

" Showing line numbers and length
set number " show line numbers
"" set tw=79 " width of document (used by gd)
"" set nowrap " don't automatically wrap on load
"" set fo-=t " don't automatically wrap text when typing
"" set colorcolumn=80
"" highlight ColorColumn ctermbg=233


" easier formatting of paragraphs
"" vmap Q gq
"" nmap Q gqap


" Useful settings
set history=700
"" set undolevels=700

" Looking for ctags in all parent directories
set tags=tags;/

" Real programmers don't use TABs but spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab


" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase


" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile

" Using F5 for listing buffers:
nnoremap <F5> :buffers<CR>:buffer<Space>

" Setup Pathogen to manage your plugins
" mkdir -p ~/.vim/autoload ~/.vim/bundle
" curl -so ~/.vim/autoload/pathogen.vim
" https://raw.github.com/tpope/vim-pathogen/HEAD/autoload/pathogen.vim
" Now you can install any plugin into a .vim/bundle/plugin-name/ folder
"" call pathogen#infect()


" przy zawinietych liniach (set wrap) przechodzenie miedzy liniami
" bedzie dzialalo jak w wiekszosci edytorow
" (przydaloby sie wylaczyc to dla Shift-V)
" http://vim.wikia.com/wiki/Move_cursor_by_display_lines_when_wrapping
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" You can use - to jump between windows
map - <c-w>w 

" these two maps enable you to press space to move cursor down a screen,
" and press backspace up a screen.
" map <space> <c-f>
" map <backspace> <c-b>

" Closing brackets
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {}<Esc>i
"inoremap < <><Esc>i
inoremap ' ''<Esc>i
"inoremap " ""<Esc>i
inoremap <C-l> <Esc>%%a


" Tab label
set guitablabel=\[%N\]\ %t\ %M 

" Commenting blocks of code.
map ,c <C-v>
map ,u :s/^-- //<CR>
" ============================================================================
" Python IDE Setup

" ============================================================================


