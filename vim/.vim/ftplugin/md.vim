setlocal spell spelllang=de_de


" Begin Shortcuts

" Compilation
map <C-c><C-c> <Esc>:RunBackgroundCommand pandoc <C-r>% --pdf-engine=xelatex -o <C-r>%<Del><Del>pdf<Enter>
map <C-c><C-d> <Esc>:silent exec "!evince <C-r>%<Del><Del>pdf &>/dev/null &"<Enter>
