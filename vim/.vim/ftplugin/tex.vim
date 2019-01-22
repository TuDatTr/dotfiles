setlocal spell spelllang=de_de

" Begin Shortcuts
map <C-B>       YpkI\begin{<Esc>A}<Esc>jI\end{<Esc>A}<Esc>ko
map! <C-B> <Esc>YpkI\begin{<Esc>A}<Esc>jI\end{<Esc>A}<Esc>ko

imap ;it \begin{itemize}<Enter>\end{itemize}<Esc>k
imap ;i \item{}<Space>
imap "" "`"'<Esc>hha
imap ;fp \begin{tabular}{ccc}<Enter>\toprule<Enter>Ja & Nein & Enthaltung \\ <Enter> \midrule<Enter> <x_x> & <x_x> & <x_x> \\<Enter>\bottomrule<Enter>\end{tabular}<Esc>0kk<Space><Tab>

" Surround stuff
vmap <C-B> da\textbf{<C-R>"}<Esc>
vmap <C-L> da\underline{<C-R>"}<Esc>
vmap <C-I> da\textit{<C-R>"}<Esc>
vmap <C-E> da\emph{<C-R>"}<Esc>
vmap ( da(<C-R>")<Esc>
vmap "" da"`<C-R>""'<Esc>


":command! -complete=file -nargs=1 Rpdf :r !pdftotext -nopgbrk <q-args> -
":command! -complete=file -nargs=1 Rpdf :r !pdftotext -nopgbrk <q-args> - | fmt -csw78
" Compilation
map <C-c><C-c> <Esc>:RunBackgroundCommand latexmk -pdf -silent <C-r>%<Enter>:redraw!<Enter>
map <C-c><C-v> <Esc>:RunBackgroundCommand latexmk -c<Enter>
map <C-c><C-d> <Esc>:silent exec "!evince <C-r>%<Del><Del><Del>pdf &>/dev/null &"<Enter>

