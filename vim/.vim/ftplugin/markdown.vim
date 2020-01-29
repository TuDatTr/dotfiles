" setlocal spell spelllang=de_de
" set nospell

" Begin Shortcuts

" Compilation
map <C-c><C-c> <Esc>:!pandoc <C-r>% -o <C-r>%<Del><Del>pdf --from gfm --template $HOME/Templates/Pandoc/eisvogel --listings &>/dev/null & disown <CR><CR>
map <C-c><C-d> <Esc>:!evince <C-r>%<Del><Del>pdf &>/dev/null & disown <CR><CR>
