runtime macros/matchit.vim
filetype on

call plug#begin()
Plug 'lervag/vimtex'
Plug 'sheerun/vim-polyglot'
Plug 'fatih/vim-go'
call plug#end()

let g:match_ignorecase = 1

let g:polyglot_disabled = ['latex']

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

