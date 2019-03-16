" Nabos/Gnikwo < gnikwo AT hotmail DOT com >
"
" Released under Free Licence - 2018

" PLUGINS
call plug#begin()

Plug 'scrooloose/nerdtree'
"Plug 'itchyny/lightline.vim'
Plug 'airblade/vim-gitgutter'

Plug 'airblade/vim-rooter'
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'ericcurtin/CurtineIncSw.vim'

Plug 'tpope/vim-markdown'
Plug 'vim-scripts/nginx.vim'
Plug 'tikhomirov/vim-glsl'
Plug 'nvie/vim-flake8'

Plug 'godlygeek/tabular'
Plug 'Shougo/deoplete.nvim'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'Raimondi/delimitMate'
Plug 'tmhedberg/SimpylFold'
Plug 'Konfekt/FastFold'
" Plug 'SirVer/ultisnips' "Both snippet plugins are needed for them to work
Plug 'honza/vim-snippets'

Plug 'michamos/vim-bepo'

call plug#end()


let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

let g:flake8_show_in_file="1"

" CurtineIncSw
nnoremap <silent> m :call CurtineIncSw()<CR>

" Alternate
nnoremap <BS> <C-^>

" FZF
set wildmenu
let $FZF_DEFAULT_COMMAND = 'find -not -path "*.o" -not -path ".git/*"'
nnoremap <silent> <space><space> :Files<CR>
nnoremap <silent> <space>b :Buffers<CR>
nnoremap <silent> <space>/ :execute 'Ag ' . input('Ag/')<CR>

" VIM-AIRLINE
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_theme = "hybrid"

nmap gq :bp <BAR> bd #<CR>

inoremap « <
inoremap » >

" GENERAL
set nocompatible              " be iMproved, required
set history=1000
set showcmd                 " show incomplete commands
set nomodeline              " modeline are for pussies
set guifont=inconsolata\ 11

set number

set undofile
set encoding=utf-8
filetype off                  " required

set formatoptions+=o  
set conceallevel=1
set termguicolors
set nojoinspaces 

if has('clipboard')
  if has('unnamedplus')  " When possible use + register for copy-paste
    set clipboard=unnamed,unnamedplus
  else         " On mac and Windows, use * register for copy-paste
    set clipboard=unnamed
  endif
endif

" SPELLCHECK
set spell spelllang=fr
set spell spelllang=en_gb
set nospell
map <silent> <F8> :set spell!<CR>

" BACKUP
set nobackup                " no backup : everything is on git/svn
set nowb
set noswapfile              " I said everything was on git !

" ENCODING
set encoding=utf-8
set fileencoding=utf-8

" SEARCH and/or REPLACE
set ignorecase              " caseless search
set smartcase               " except when using capitals
set showmatch               " show matching brackets
set incsearch               " instant search
set hlsearch                " highlight the search
set wrapscan                " wrap search
set gdefault                " assume /g flag on :s/
nnoremap <silent> <F3> :noh<CR>

set splitbelow          " Horizontal split below current.
set splitright          " Vertical split to right of current.

if !&scrolloff
  set scrolloff=3       " Show next 3 lines while scrolling.
endif
if !&sidescrolloff
  set sidescrolloff=5   " Show next 5 columns while side-scrolling.
endif
set nostartofline       " Do not jump to first character with page commands.

"IDENT
set autoindent            " Auto-ident
set smartindent           " Smart ident
set smarttab              " Reset autoindent after a blank line
set expandtab             " tabs are spaces
set tabstop=4             " how many spaces on tab
set softtabstop=4         " one tab = 4 spaces
set shiftwidth=4          " reduntant with above

" Relative numbering

function! NumberToggle()
  if(&relativenumber == 1)
    set nornu
    set number
  else
    set rnu
  endif
endfunc

call NumberToggle()

" Toggle between normal and relative numbering.
nnoremap <silent> <F4> :call NumberToggle()<cr>

" Allow using the repeat operator with a visual selection (!)
" http://stackoverflow.com/a/8064607/127816
vnoremap . :normal .<CR>

colorscheme solarized
hi! Normal ctermbg=NONE guibg=NONE
hi clear LineNR

autocmd BufEnter * lcd %:p:h

"SYNTAX/LAYOUT
filetype plugin indent on   " automatic recognition of filetype
set wrap                    " wrap

set undodir=~/.config/nvim/undodir


let g:javascript_plugin_jsdoc           = 1
let g:javascript_conceal_function       = "ƒ"
let g:javascript_conceal_null           = "ø"
let g:javascript_conceal_arrow_function = "⇒"
let g:javascript_conceal_return         = "⇚"

let g:jsx_ext_required = 0

let g:syntastic_check_on_open=1
let g:glsl_file_extensions = '*.glsl,*.vsh,*.fsh,*.vert,*.tesc,*.tese,*.geom,*.frag,*.comp,*.shader'

noremap <silent> <C-E> :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.pyc$']
let NERDTreeMapOpenInTab="<C-t>"
let NERDTreeMapOpenInTabSilent="<C-T>"
let NERDTreeMapOpenVSplit="<C-s>"
let NERDTreeMapRefresh="<C-r>"
let NERDTreeMapRefreshRoot="<C-R>"

let g:ycm_autoclose_preview_window_after_completion=1

"FOLDING
set foldmethod=indent
set foldlevel=99

au BufRead,BufNewFile *.nginx set ft=nginx
au BufRead,BufNewFile */etc/nginx/* set ft=nginx
au BufRead,BufNewFile */usr/local/nginx/conf/* set ft=nginx
au BufRead,BufNewFile nginx.conf set ft=nginx

set ttyfast                 " smooth !
set laststatus=0

command Sudo execute "w !sudo tee %"
