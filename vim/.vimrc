" Plugins
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
   Plugin 'VundleVim/Vundle.vim'
   Plugin 'vim-pandoc/vim-pandoc'
   Plugin 'vim-pandoc/vim-pandoc-syntax'
   Plugin 'ledger/vim-ledger'
   Plugin 'terryma/vim-multiple-cursors'
   Plugin 'haya14busa/incsearch.vim'
call vundle#end()

" Functions
command! -complete=shellcmd -nargs=+ Shell call s:RunShellCommand(<q-args>)
function! s:RunShellCommand(cmdline)
  echo a:cmdline
  let expanded_cmdline = a:cmdline
  for part in split(a:cmdline, ' ')
     if part[0] =~ '\v[%#<]'
        let expanded_part = fnameescape(expand(part))
        let expanded_cmdline = substitute(expanded_cmdline, part, expanded_part, '')
     endif
  endfor
  botright new
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
  call setline(1, 'You entered:    ' . a:cmdline)
  call setline(2, 'Expanded Form:  ' .expanded_cmdline)
  call setline(3,substitute(getline(2),'.','=','g'))
  execute '$read !'. expanded_cmdline
  setlocal nomodifiable
  1
endfunction

" Basics
syntax on
set encoding=utf-8
colorscheme monokai
set autowrite
" Tab behavior
set expandtab
set tabstop=4
set shiftwidth=3
"" New window positions
set splitbelow
set splitright


" Remaps
map / <Plug>(incsearch-forward)
map ? <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" Shortcuts
inoremap <Tab><Tab> <Esc>/<x_x><Enter>c5l
vnoremap <Tab><Tab> <Esc>/<x_x><Enter>c5l
map <Tab><Tab> <Esc>/<x_x><Enter>c5l
inoremap ;; <x_x>

"" Latex
autocmd FileType tex inoremap ;l \item
autocmd FileType tex inoremap ;beg \begin{<o_o>}<Enter><x_x><Enter>\end{<o_o>}<Enter><Enter><x_x><Esc>4k0:MultipleCursorsFind<Space><o_o><Enter>c
autocmd FileType tex inoremap ;sec \section{<x_x>}<Enter><Enter><x_x><Esc>2k<Tab><Tab>
autocmd FileType tex inoremap ;ssec \subsection{<x_x>}<Enter><Enter><x_x><Esc>2k<Tab><Tab>
autocmd FileType tex inoremap ;sssec \subsubsection{<x_x>}<Enter><Enter><x_x><Esc>2k<Tab><Tab>
""" Compile to pdf and open it in evince
autocmd FileType tex map <C-c><C-c> mx:silent !pdflatex % && evince %<.pdf &<Enter>ggGG`x

"" Ledger
autocmd FileType ledger inoremap ;a <C-R>=strftime("%Y/%m/%d")<Enter> * <x_x><Enter><Space><Space><Space><Space><x_x><Space><Space><Space><Space><x_x><Enter><Enter><x_x><Esc>3k0<Tab><Tab>
autocmd FileType ledger map <C-R>b :! ledger -f % reg Brieftasche$<Enter>
autocmd FileType ledger map <C-R>g :! ledger -f % reg Girokonto$<Enter>
autocmd FileType ledger map <C-R>p :! ledger -f % reg PayPal$<Enter>

"" Markdown
autocmd FileType markdown,rmd map map <C-c><C-c> mx:silet !pandoc -f % -t latex %<.pdf && evince %<.pdf &<Enter>ggGG`x
