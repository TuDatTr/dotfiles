" Plugins
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'vimwiki/vimwiki'
call vundle#end()
filetype plugin indent on

" Filetypes
au BufNewFile,BufRead *.md set filetype=md
au BufNewFile,BufRead *.tex set filetype=tex
au BufNewFile,BufRead config set filetype=config
" Functions

"" Move the swap file location to protect against CVE-2017-1000382
if exists('$XDG_CACHE_HOME')
    let &g:directory=$XDG_CACHE_HOME
else
    let &g:directory=$HOME . '/.cache'
endif
let &g:directory.='/vim/swap//'
"" Create swap directory if it doesn't exist
if ! isdirectory(expand(&g:directory))
    silent! call mkdir(expand(&g:directory), 'p', 0700)
endif

" Basics
syntax on
filetype indent plugin on
set background=light
set encoding=utf-8
set autowrite
set smartcase
set incsearch
set hlsearch
set nofoldenable
" Line Numbers
"set number
"set relativenumber

" Tab behavior
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

"" New window positions
set splitbelow
set splitright

" Remaps
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap J :bn<Enter>
nnoremap K :bp<Enter>
nmap 0 ^

" Latex
"let g:tex_nospell=1
" Shortcuts
inoremap ;date <C-R>=strftime("%Y/%m/%d")<Enter> 
inoremap ;time <C-R>=strftime("%H:%M:%S")<Enter> 
" Diaeresis for e.g. german
inoremap a" ä
inoremap o" ö
inoremap u" ü
inoremap A" Ä
inoremap U" Ü
inoremap O" Ö
inoremap jk <Esc>
inoremap <leader>s ß
inoremap <leader>e €


vnoremap jk <Esc>
" This callback will be executed when the entire command is completed
function! BackgroundCommandClose(channel)
    " Read the output from the command into the quickfix window
    unlet g:backgroundCommandOutput
endfunction

function! RunBackgroundCommand(command)
    " Make sure we're running VIM version 8 or higher.
    if v:version < 800
        echoerr 'RunBackgroundCommand requires VIM version 8 or higher'
        return
    endif
    if exists('g:backgroundCommandOutput')
        echo 'Already running task in background'
    else
        echo 'Running task in background'
        " Launch the job.
        " Notice that we're only capturing out, and not err here. This is because, for some reason, the callback
        " will not actually get hit if we write err out to the same file. Not sure if I'm doing this wrong or?
        let g:backgroundCommandOutput = tempname()
        call job_start(a:command, {'close_cb': 'BackgroundCommandClose', 'out_io': 'file', 'out_name': g:backgroundCommandOutput})
    endif
endfunction

" So we can use :BackgroundCommand to call our function.
command! -nargs=+ -complete=shellcmd RunBackgroundCommand call RunBackgroundCommand(<q-args>)

" Vimwiki
let g:vimwiki_list =[
            \{'path':'~/Documents/Collection/wiki'}, 
            \{'path_html':'~/Documents/Collection/wiki_html'}
                    \]
