" Shortcuts
imap ;main package main<Enter><Enter>import (<Enter>"fmt"<Enter>)<Enter><Enter>func main() {<Enter>}<Esc>O


" Compiling
map <C-c><C-c> <Esc>:!clear; go run %<Enter>
map <C-c><C-b> <Esc>:!clear; go build %; ./%<<Enter>
map <C-c><C-w> <Esc>:!clear; GOOS=windows GOARCH=386 go build -o %<.exe %
