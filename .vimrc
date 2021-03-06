call pathogen#infect()

" fawwnts
set guifont=Menlo\ Regular:h12
      
set ai
set wrap
set number
set ruler
set cmdheight=2

"dont kill windows
set hidden

set nobackup
set noswapfile

"show extraneous whitespace
set list
set listchars=tab:>-,trail:_,extends:>

"tab stop
set softtabstop=2
set shiftwidth=2
set tabstop=2
set expandtab
set smarttab

let mapleader=","
map <leader>2 :set tabstop=2 softtabstop=2 shiftwidth=2 <CR>
map <leader>4 :set tabstop=4 softtabstop=4 shiftwidth=4 <CR>

" tab completion
set wildmenu
set wildmode=list:longest

" smart case
set ignorecase
set smartcase

set title

" better scrolling
set scrolloff=3
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" backspace
set backspace=indent,eol,start

" non-stupid syntax
syntax enable
filetype on
filetype plugin on
filetype indent on
set hlsearch
set nosmartindent

" colors, solarized!
set t_Co=256
set background=dark
colorscheme solarized

" moving between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" jj to escape insert mode
inoremap jj <Esc>

" the shift key can die
nnoremap ; :

" run pyflakes
map <leader>p :!pyflakes % <CR>

