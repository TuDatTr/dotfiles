runtime macros/matchit.vim
filetype on

call plug#begin()
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'lervag/vimtex'
Plug 'sheerun/vim-polyglot'
Plug 'fatih/vim-go'
Plug 'SirVer/ultisnips'
call plug#end()

let g:polyglot_disabled = ['latex']

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
