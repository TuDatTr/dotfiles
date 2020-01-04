setlocal spell spelllang=de_de

" Begin Shortcuts
noremap <C-B>       YpkI\begin{<Esc>A}<Esc>jI\end{<Esc>A}<Esc>ko
noremap! <C-B> <Esc>YpkI\begin{<Esc>A}<Esc>jI\end{<Esc>A}<Esc>ko

inoremap ;it \begin{itemize}<CR>\end{itemize}<Esc>k
inoremap ;i \item{}<Space>
inoremap "" "`"'<Esc>hha
inoremap ;fp \begin{tabular}{ccc}<CR>\toprule<CR>Ja & Nein & Enthaltung \\ <CR> \midrule<CR> <x_x> & <x_x> & <x_x> \\<CR>\bottomrule<CR>\end{tabular}<Esc>0kk<Space><Tab>
inoremap ;sec \section{}<Esc>i
inoremap ;ssec \subsection{}<Esc>i
inoremap ;sssec \subsubsection{}<Esc>i

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
noremap <C-c><C-c> <Esc>:!latexmk -pdf -silent "<C-r>%" &>/dev/null & disown <CR>:redraw!<CR>
noremap <C-c><C-v> <Esc>:!latexmk -c &>/dev/null & disown <CR>
noremap <C-c><C-d> <Esc>:!evince <C-r>%<Del><Del><Del>pdf &>/dev/null & disown <CR><CR>

