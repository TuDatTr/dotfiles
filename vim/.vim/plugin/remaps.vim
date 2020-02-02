" Remaps
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap J :bn<CR>
nnoremap K :bp<CR>
nnoremap <C-u> :earlier<CR>
nnoremap <C-U> :later<CR>
noremap Y "+y
noremap <C-E> :tabedit **/*
noremap <F12> :tabedit<CR>:ter<CR><C-w><C-w>:q<CR>
noremap <F12> <Esc>:syntax sync fromstart<CR>
inoremap <F12> <C-o>:syntax sync fromstart<CR>
noremap == ==j
nmap 0 ^
nmap ' `

" Diaeresis for e.g. german
inoremap a<leader> ä
inoremap o<leader> ö
inoremap u<leader> ü
inoremap A<leader> Ä
inoremap U<leader> Ü
inoremap O<leader> Ö
inoremap s<leader> ß
inoremap e<leader> €
