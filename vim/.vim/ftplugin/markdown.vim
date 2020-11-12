" setlocal spell spelllang=de_de
" set nospell

" Abbrevs
abbrev iff Leftrightarrow

" Begin Shortcuts
inoremap $$ $<Esc>bi$\<Esc>f$a
vnoremap <C-l> da\overline{<C-o>p}<Esc>

" Compilation
map <C-c><C-c> <Esc>:!pandoc <C-r>% -o <C-r>%<Del><Del>pdf --from markdown+tex_math_dollars+yaml_metadata_block+hard_line_breaks --template $HOME/Templates/Pandoc/eisvogel --listings &>/dev/null & disown <CR><CR>
map <C-c><C-d> <Esc>:!zathura <C-r>%<Del><Del>pdf &>/dev/null & disown <CR><CR>
