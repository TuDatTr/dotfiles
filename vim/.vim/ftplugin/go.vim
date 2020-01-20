" Shortcuts
imap ;main package main<CR><CR>import (<CR>"fmt"<CR>)<CR><CR>func main() {<CR>}<Esc>O


" Compiling
map <C-c><C-c> <Esc>:!clear; go run %<CR>
map <C-c><C-b> <Esc>:!clear; go build %; ./%<<CR><CR>
map <C-c><C-t> <Esc>:!clear; go test & detatch<CR><CR>
map <C-c><C-w> <Esc>:!clear; GOOS=windows GOARCH=386 go build -o %<.exe %<CR><CR>
