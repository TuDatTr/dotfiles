" Basics
set autoindent noexpandtab tabstop=4 shiftwidth=4
" Shortcuts
abbrev funct func Test(t *testing.T) {<CR>}<Esc>kwwi
abbrev trun t.Run("", func(t *testing.T) {<CR>})<Esc>%la
abbrev terr t.Errorf("got %v, want %v", got, want)<Esc>02f,lcaw
abbrev thelp func(t *testing.T) {<CR>t.Helper()<CR>}<Esc>ko
abbrev fori for i := 0; i <; i++{<CR>}<Esc>k2f;i
abbrev fore for i, c := range{<CR>}<Esc>kf{i

" Compiling
nnoremap <C-c><C-f> <Esc>:GoFmt<CR>
nnoremap <C-c><C-c> <Esc>:!clear<CR><CR>:GoRun<CR>
nnoremap <C-c><C-b> <CR>:GoBuild<CR>
nnoremap <C-c><C-t> <CR>:GoTest<CR>
nnoremap <F9> <CR>:GoImports<CR>
nnoremap <C-c><C-d> <CR>:GoDebugStart<CR>
nnoremap gd <Esc>:GoDef
nnoremap <F1> <Esc>:GoDoc<CR>

map <C-c><C-w> <Esc>:!clear; GOOS=windows GOARCH=386 go build -o %<.exe %<CR><CR>


