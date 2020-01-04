" setlocal spell spelllang=de_de
" set nospell



" Begin Shortcuts

" Compilation
map <C-c><C-c> <Esc>:!pandoc <C-r>% --pdf-engine=xelatex -o <C-r>%<Del><Del>pdf &>/dev/null & disown <CR>
map <C-c><C-d> <Esc>:!evince <C-r>%<Del><Del>pdf &>/dev/null & disown <CR>
