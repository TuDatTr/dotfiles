setlocal spell spelllang=de_de

" Begin Shortcuts
noremap <C-B>       YpkI\begin{<Esc>A}<Esc>jI\end{<Esc>A}<Esc>ko
noremap! <C-B> <Esc>YpkI\begin{<Esc>A}<Esc>jI\end{<Esc>A}<Esc>ko

inoremap ;it \begin{itemize}<Enter>\end{itemize}<Esc>k
inoremap ;i \item{}<Space>
inoremap "" "`"'<Esc>hha
inoremap ;fp \begin{tabular}{ccc}<Enter>\toprule<Enter>Ja & Nein & Enthaltung \\ <Enter> \midrule<Enter> <x_x> & <x_x> & <x_x> \\<Enter>\bottomrule<Enter>\end{tabular}<Esc>0kk<Space><Tab>
inoremap ;sec \section{}<Esc>hi
inoremap ;ssec \subsection{}<Esc>hi
inoremap ;sssec \subsubsection{}<Esc>hi

" Surround stuff
vnoremap <C-B> da\textbf{<C-R>"}<Esc>
vnoremap <C-L> da\underline{<C-R>"}<Esc>
vnoremap <C-I> da\textit{<C-R>"}<Esc>
vnoremap <C-E> da\emph{<C-R>"}<Esc>
vnoremap ( da(<C-R>")<Esc>
vnoremap "" da"`<C-R>""'<Esc>


":command! -complete=file -nargs=1 Rpdf :r !pdftotext -nopgbrk <q-args> -
":command! -complete=file -nargs=1 Rpdf :r !pdftotext -nopgbrk <q-args> - | fmt -csw78
" Compilation
noremap <C-c><C-c> <Esc>:RunBackgroundCommand latexmk -pdf -silent "<C-r>%"<Enter>:redraw!<Enter>
noremap <C-c><C-v> <Esc>:RunBackgroundCommand latexmk -c<Enter>
noremap <C-c><C-d> <Esc>:silent exec "!evince <C-r>%<Del><Del><Del>pdf &>/dev/null &"<Enter>

