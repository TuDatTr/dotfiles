" Vim Settings
"" Move the swap file location to protect against CVE-2017-1000382
if exists('$XDG_CACHE_HOME')
    let &g:directory=$XDG_CACHE_HOME
else
    let &g:directory=$HOME . '/.cache'
endif
let &g:directory.='/vim/swap//'
"" Create swap directory if it doesn't exist
if ! isdirectory(expand(&g:directory))
    silent! call mkdir(expand(&g:directory), 'p', 0700)
endif


