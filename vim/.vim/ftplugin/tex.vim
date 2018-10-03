setlocal spell spelllang=de_de

" Begin Shortcuts
map <C-B>       YpkI\begin{<Esc>A}<Esc>jI\end{<Esc>A}<Esc>ko
map! <C-B> <Esc>YpkI\begin{<Esc>A}<Esc>jI\end{<Esc>A}<Esc>ko

imap ;item \begin{itemize}<Enter>\end{itemize}<Esc>ko\item<Space>
imap ;- \item

":command! -complete=file -nargs=1 Rpdf :r !pdftotext -nopgbrk <q-args> -
":command! -complete=file -nargs=1 Rpdf :r !pdftotext -nopgbrk <q-args> - | fmt -csw78

" Compilation
map <C-c><C-c> <Esc>:RunBackgroundCommand pdflatex -interaction nonstopmode <C-r>%<Enter>
map <C-c><C-d> <Esc>:silent exec "!evince %<.pdf &"<Enter>

