" Basics
syntax on
filetype indent plugin on
set background=light
set encoding=utf-8
set smartcase
set incsearch
set hlsearch
set nospell
set hidden

" Tab behavior
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

" New window positions
set splitbelow
set splitright

" Statusbar
set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]

" Window Management
let &winheight = &lines * 7 / 10

" Path
set path+=**
set wildmenu
