" Shortcuts
imap ;default package main<Enter><Enter>import (<Enter>"fmt"<Enter>)<Enter><Enter>func main() {<Enter>}<Esc>O

" Compiling
map <C-c><C-c> <Esc>:!go run %<Enter>
map <C-c><C-b> <Esc>:!go build %; ./%<<Enter>
map <C-c><C-w> <Esc>:!GOOS=windows GOARCH=386 go build -o %<.exe %
