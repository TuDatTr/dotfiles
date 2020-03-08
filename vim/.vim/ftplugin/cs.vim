" Exception Abbrev
nnoremap <C-j> ostring funcName = MethodBase.GetCurrentMethod().ReflectedType.ToString() + "." + MethodBase.GetCurrentMethod().Name;<CR>try {<CR><Esc>k$%ocatch (Exception ex) {<CR>Log(1, MessageType.Error, funcName, String.Format("{0}:\n\n{1}\n", funcName, ex));<CR>}<CR>}<Esc>=%
