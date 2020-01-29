" Basics
set autoindent noexpandtab tabstop=4 shiftwidth=4
" Shortcuts


" Compiling
nnoremap <C-c><C-f> <Esc>:GoFmt<CR>
nnoremap <C-c><C-c> <Esc>:!clear<CR><CR>:GoRun<CR>
nnoremap <C-c><C-b> <Esc>:!clear<CR><CR>:GoBuild<CR>
nnoremap <C-c><C-t> <Esc>:!clear<CR><CR>:GoTest<CR>
nnoremap <C-c><C-f> <Esc>:!clear<CR><CR>:GoTestFunc<CR>
nnoremap <C-c><C-d> <Esc>:!clear<CR><CR>:GoDebugStart<CR>
nnoremap gd <Esc>:GoDef
nnoremap <F1> <Esc>:GoDoc<CR>

map <C-c><C-w> <Esc>:!clear; GOOS=windows GOARCH=386 go build -o %<.exe %<CR><CR>

abbrev funct func<Space>Test(t<Space>*testing.T)<Space>{<CR>}<Esc>kwwi
abbrev trun t.Run("", func(t *testing.T)<Space>{<CR>})<Esc>%la
