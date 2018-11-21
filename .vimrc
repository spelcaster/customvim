"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" This file is free software configuration code: you can redistribute it
" and/or modify it under the terms of the GNU General Public License as
" published by the Free Software Foundation, version 3..
"
" This configuration is distributed in the hope that it will be useful, but
" WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
" or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
" more details.
"
" You should have received a copy of the GNU General Public License along with
" this configure rile.  If not, see <http://www.gnu.org/licenses/>.
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autoload plugins in ~/.vim/bundle "{{{
call pathogen#helptags()
call pathogen#infect()
" }}}
" General setup " {{{
" Enable Vi Improved
set nocompatible

" Set Unix file format
set ff=unix

" Disable backup and swapfile, encouraging user to use some kind of version
" control
set nobackup
set noswapfile
set nowb

" Hide buffers instead of closing them, so you won't be annoyed with messages
" to save the file before you open another one
set hidden

" Set the charset encoding to UTF8
set encoding=utf8

" Set vim's menu language
set langmenu=en_US.UTF-8

" Define vim history list max length
set history=1000

" Define vim's undo stack max length
set undolevels=1000

" Filetype setup
filetype on
filetype plugin on
filetype indent on
set grepprg=grep\ -nH\ $*

" Reload file if modifications are found
set autoread

" Set leader to ','
let mapleader=","
let g:mapleader=","

" Set localleader to '\\'
let maplocalleader="\\"

" Show invisible characters
set list
set listchars=tab:>-,trail:.,extends:#,nbsp:.,precedes:«,extends:»
"set listchars+=eol:¶

" Toggle paste mode in insert mode
set pastetoggle=<F2>

" Change completion popup menu behavior
set completeopt=longest,menuone,preview

" Disable redraw while running macros
set nolazyredraw

" Create a persistent undo history
set undodir=~/.vim/undobackups
set undofile

" Use the system clipboard
set clipboard=unnamed

" Use the X Window clipboard
if has('unnamedplus')
    set clipboard=unnamedplus
endif

" Scroll always keep 10 lines before and after
set scrolloff=5
" }}}
" Interface setup "{{{
" Enhances the vim command search
set wildmenu

" Show a list of matches while searching commands
set wildmode=list:longest,full

" Ignore files by type
set wildignore=*.swp,*.bak
set wildignore+=*.pyc,*.jx
set wildignore+=*.zip,*.rar
set wildignore+=*.a,*.out,*.so,*.o

" Show cursor position in status line
set ruler

" Show commands
set showcmd

" Screen lines for command-line
set cmdheight=2

" Change the behavior of [Backspace]
set backspace=eol,start,indent

" Highlight matches found in search
set hlsearch

" Run search for each character typed
set incsearch

" Enable regular expression in search
set magic

" Highlight delimiters like: (), {{}}, (){()()}
set showmatch
set mat=2

" Search with case-insensitive
set ignorecase

" Enable smart case search
set smartcase

" Update terminal title
set title

" Remove all sound beeps
set visualbell
set noerrorbells
set tm=500

" Remove visual beep
set vb t_vb=

" Draw a margin
set cc=80

" Disable spell check by default and set the spell language to english
if version >= 700
    set spl=en spell
    set spell!
endif

" Syntax highlighting items specify folds
set foldmethod=syntax

" Markers are used to specify folds
set foldmethod=marker

" No folds closed
set foldlevelstart=99
" }}}
" Colors and fonts " {{{
" http://vim.wikia.com/wiki/256_colors_in_vim
" Run check_terminal_colors.py to see if your terminal support the 256 colors

" Show line numbers
set number

" Set terminal color to 256
set t_Co=256

" Disable guioptions and set a default color scheme
if &t_Co >= 256 || has("gui_running")
    let g:gruvbox_italic=1

    " Default theme
    colorscheme gruvbox

    set background=dark

    " Remove gui toolbars
    set guioptions-=T
endif

" Syntax hightlight if the terminal supports more than 2 colors
if &t_Co > 2 || has("gui_running")
    syntax on
endif

" Disable virtual line break
set nolinebreak

" Automatic break files
set wrap
" }}}
" Text format setup " {{{
" Use spaces instead of <Tab>
set expandtab

" Smart use of <Tab>
set smarttab

" Define the number of spaces to represent one <Tab>
set shiftwidth=4
set tabstop=4

" Round indent with multiples of shiftwidth <C-T> or <C-D> (i), '>' or '<' (n)
set shiftround

" Enable automatic indentation
set autoindent

" Smart use of indentation
set copyindent

" Enable C indent style
set cindent
" }}}
" Editor status " {{{
" Show the current mode
set showmode

" Always show status line
set laststatus=2

" Format status line
"set statusline=%F
"set statusline+=%m
"set statusline+=%r
"set statusline+=%h
"set statusline+=%w
"set statusline+=\ (%{strlen(&fenc)?&fenc:'none'},\ %{&ff})
"set statusline+={%Y}
"set statusline+=%=
"set statusline+=[%l,%c]
"set statusline+=\ %L\ %P
" }}}
" Command line abbreviations " {{{
" Expand '%%/' to current directory in command line
cabbr <expr> %% expand('%:p:h')
" }}}
" Automatic commands " {{{
" Remove trailling spaces
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

" Remove <Tab> from listchars for xml/html filetypes
autocmd filetype html,xml set listchars-=tab:>-

" Enable CSS autocomplete
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
" }}}
" Keymaps " {{{
" Go to the first non whitespace character in the current line
map <Home><Home> ^

" Shortcut to edit .vimrc
nmap <silent> <leader>ev :tabnew<CR>:e $MYVIMRC<CR>
nmap <silent> <leader>sv :tabnew<CR>:so $MYVIMRC<CR>

" Change ; to :
nnoremap ; :

" Disable arrow for normal and visual modes
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Unmap suspend function
nmap <silent> <c-z> <nop>

" Remove ^M from DOS file format
nnoremap <leader>m mmHmt:%s/<C-V><CR>//ge<CR>'tzt'm

" Open a link in the browser (firefox)
map <leader>s :call BrowserNavigate()<CR><CR>

" Go to next tab
nnoremap <silent> tn :tabnext<CR>

" Go to previous tab
nnoremap <silent> tp :tabprevious<CR>

" Open a new tab
nnoremap <silent> tt :tabnew<CR>

" Close the current tab
nnoremap <silent> tc :tabclose<CR>

" Switch color schemes with RotateColorTheme()
nnoremap <silent> <F8> :execute RotateColorTheme()<CR>

" Toggle current fold open/closed
nnoremap <space> za

" Toggle NERDTree
nnoremap <silent> <C-k><C-b> :NERDTreeTabsToggle<CR>
inoremap <silent> <C-k><C-b> <ESC>:NERDTreeTabsToggle<CR>:wincmd l<CR>i

inoremap <C-K> <ESC>ddi

" Altera o comportamento de navegação entre as linhas
nnoremap j gj
nnoremap k gk

" Tab navigation using <ctrl> + <[hjkl]>
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

" Enable <Shift> + <Tab>
nmap <S-Tab> <<
imap <S-Tab> <Esc><<i

" Format paragraph
vmap Q gq
nmap Q gqap

" Clear highlight from previous search
nmap <silent> <leader>/ :nohlsearch<CR>

" Prompt sudo to save files
cmap w!! w !sudo tee % >/dev/null

" Insert a new line after the current line
nnoremap <silent> <C-down> o<Esc>

" Insert a new line before the current line
nnoremap <silent> <C-up> O<Esc>

" Focus the current match in a search
map N Nzz
map n nzz

" Shortcut to save file
map <leader>w :w!<CR>

" Change to the current directory
map <leader>%% :cd %:p:h<CR>:pwd<CR>

" Run vim passing the current directory as an argument
map <leader>v :e <C-R>=expand("%:p:h") . "/"<CR>

" Toggle spell check
map <leader>ss :set spell!<CR>

" Select all
map <C-a> <esc>ggVG<CR>

" Copy shortcut
vnoremap <C-c> "+y

" Open the tag definition in split
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

" Open the tag definition in vertical split
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" Search the word definition in Zeal
nnoremap <leader>z :!zeal --query "<cword>"&<CR><CR>
" }}}

" Other setup " {{{
" Setup autocomand
au CompleteDone * pclose
" }}}
