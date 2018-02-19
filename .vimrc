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

" Setup CtrlP
let g:ctrlp_custom_ignore='obj'

" Open ctags with Ctrlp
nnoremap <leader>t :CtrlPTag<cr>

" Open CtrlP to search for tags in buffer
nnoremap <silent> <leader>r :CtrlPBufTag<CR>
nnoremap <silent> <leader>b :CtrlPBufTagAll<CR>

" Setup Tagbar
nnoremap <silent> <F4> :TagbarToggle<CR>

" Setup Gundo
nnoremap <silent> <leader>g :GundoToggle<CR>

" Setup Tagbar
let g:tagbar_left=1

" Setup netrw
let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_liststyle=3

" Setup vim-gitgutter
set updatetime=250

" Setup airline
let g:airline_powerline_fonts=1
if !exists('g:airline_symbols')
    let g:airline_symbols={}
endif

let g:airline_symbols.space="\ua0"

let g:airline_theme='molokai'

" Setup syntastic
let g:syntastic_check_on_open=0
let g:syntastic_javascript_checkers=['standard']

" Setup UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-n>"
let g:UltiSnipsJumpBackwardTrigger="<c-p>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories=["UltiSnips"]

" Setup emmet
let g:user_emmet_settings={
\  'javascript' : {
\      'extends' : 'jsx',
\  },
\}

" Setup vim-jsx
let g:jsx_ext_required=0

" Setup tabular
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction

" Setup argumenrewrap
nnoremap <silent> <leader>s :call argumentrewrap#RewrapArguments()<CR>

" Setup ctrl-funky
nnoremap <Leader>fu :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>

" Setup cscope
nnoremap <leader>fa :call cscope#findInteractive(expand('<cword>'))<CR>
nnoremap <leader>l :call ToggleLocationList()<CR>
" s: Find this C symbol
nnoremap  <leader>fs :call cscope#find('s', expand('<cword>'))<CR>
" g: Find this definition
nnoremap  <leader>fg :call cscope#find('g', expand('<cword>'))<CR>
" d: Find functions called by this function
nnoremap  <leader>fd :call cscope#find('d', expand('<cword>'))<CR>
" c: Find functions calling this function
nnoremap  <leader>fc :call cscope#find('c', expand('<cword>'))<CR>
" t: Find this text string
nnoremap  <leader>ft :call cscope#find('t', expand('<cword>'))<CR>
" e: Find this egrep pattern
nnoremap  <leader>fe :call cscope#find('e', expand('<cword>'))<CR>
" f: Find this file
nnoremap  <leader>ff :call cscope#find('f', expand('<cword>'))<CR>
" i: Find files #including this file
nnoremap  <leader>fi :call cscope#find('i', expand('<cword>'))<CR>

" Setup auto-pairs
let g:AutoPairsMapCR=0
imap <expr><CR> pumvisible() ? deoplete#mappings#close_popup() : "\<CR>\<Plug>AutoPairsReturn"

" Setup clang_complete
let g:clang_library_path = '/usr/lib/libclang.so'
let g:clang_complete_auto = 0
let g:clang_use_library = 1
let g:clang_periodic_quickfix = 0
let g:clang_close_preview = 1
let g:clang_snippets = 1

" Setup deoplete
let g:deoplete#enable_at_startup = 1

function Multiple_cursors_before()
  let g:deoplete#disable_auto_complete = 1
endfunction
function Multiple_cursors_after()
  let g:deoplete#disable_auto_complete = 0
endfunction

" Setup phpcd
let g:deoplete#ignore_sources = get(g:, 'deoplete#ignore_sources', {})
let g:deoplete#ignore_sources.php = ['omni']

" Setup deoplete-ternjs
" Set bin if you have many instalations
let g:deoplete#sources#ternjs#tern_bin = '/usr/local/bin/ternjs'
let g:deoplete#sources#ternjs#timeout = 1

" Whether to include the types of the completions in the result data. Default: 0
let g:deoplete#sources#ternjs#types = 1

" Whether to include the distance (in scopes for variables, in prototypes for
" properties) between the completions and the origin position in the result
" data. Default: 0
let g:deoplete#sources#ternjs#depths = 1

" Whether to include documentation strings (if found) in the result data.
" Default: 0
let g:deoplete#sources#ternjs#docs = 1

" When on, only completions that match the current word at the given point will
" be returned. Turn this off to get all results, so that you can filter on the
" client side. Default: 1
let g:deoplete#sources#ternjs#filter = 0

" Whether to use a case-insensitive compare between the current word and
" potential completions. Default 0
let g:deoplete#sources#ternjs#case_insensitive = 1

" When completing a property and no completions are found, Tern will use some
" heuristics to try and return some properties anyway. Set this to 0 to
" turn that off. Default: 1
let g:deoplete#sources#ternjs#guess = 0

" Determines whether the result set will be sorted. Default: 1
let g:deoplete#sources#ternjs#sort = 0

" When disabled, only the text before the given position is considered part of
" the word. When enabled (the default), the whole variable name that the cursor
" is on will be included. Default: 1
let g:deoplete#sources#ternjs#expand_word_forward = 0

" Whether to ignore the properties of Object.prototype unless they have been
" spelled out by at least two characters. Default: 1
let g:deoplete#sources#ternjs#omit_object_prototype = 0

" Whether to include JavaScript keywords when completing something that is not
" a property. Default: 0
let g:deoplete#sources#ternjs#include_keywords = 1

" If completions should be returned when inside a literal. Default: 1
let g:deoplete#sources#ternjs#in_literal = 0

"Add extra filetypes
let g:deoplete#sources#ternjs#filetypes = [
                \ 'jsx',
                \ 'javascript.jsx',
                \ 'vue'
                \ ]
" }}}
