" pythoncomplete is a built-in plugin of vim7.3
setlocal omnifunc=pythoncomplete#Complete
setlocal completefunc=pythoncomplete#Complete

" remap c-x,c-u to not select the first option by default
" or we can set completeopt to 'longest,menuone'
:inoremap <buffer> <C-X><C-U> <C-X><C-U><C-P>
:inoremap <buffer> <C-X><C-O> <C-X><C-O><C-P>
