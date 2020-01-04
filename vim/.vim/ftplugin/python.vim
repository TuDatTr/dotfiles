" Python settings


" Shortcuts
imap <leader>ifm if<Space>__name__<Space>==<Space>'__main__':<CR>

" Compiling
map <C-c><C-c> <Esc>:!clear; python %<CR>

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red

" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/

" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
