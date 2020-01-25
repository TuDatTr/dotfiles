" Basics
set autoindent noexpandtab tabstop=4 shiftwidth=4
" Shortcuts
imap ;main package main<CR><CR>import (<CR>"fmt"<CR>)<CR><CR>func main() {<CR>}<Esc>O


" Compiling
map <C-i> <Esc>:GoImport
map <C-c><C-c> <Esc>:!clear<CR><CR>:GoRun<CR>
map <C-c><C-b> <Esc>:!clear<CR><CR>:GoBuild<CR>
map <C-c><C-t> <Esc>:!clear<CR><CR>:GoTest<CR>
map <C-c><C-f> <Esc>:!clear<CR><CR>:GoTestFunc<CR>
map <C-c><C-d> <Esc>:!clear<CR><CR>:GoDebugStart<CR>
nnoremap gd <Esc>:GoDef
nnoremap <F1> <Esc>:GoDoc<CR>


map <C-c><C-w> <Esc>:!clear; GOOS=windows GOARCH=386 go build -o %<.exe %<CR><CR>
