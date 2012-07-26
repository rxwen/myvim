" Find file with find utility 
function! Find(...)
    let path="."
    let pattern = a:2
    let ignorecase = a:1
    if a:0==3
        let path=a:2
        let pattern=a:3
    endif
    if ignorecase == 0
        let l:cmd = "find ".path. " -name ".pattern
    else
        let l:cmd = "find ".path. " -iname ".pattern
    endif
    let l:list=system(l:cmd)
    let l:num=strlen(substitute(l:list, "[^\n]", "", "g"))
    if v:shell_error != 0 || l:num < 1
        echo "'".pattern."' not found"
        return
    endif
    if l:num != 0
        let tmpfile = tempname()
        exe "redir! > " . tmpfile
        silent echon l:list
        redir END
        let old_efm = &efm
        set efm=%f

        if exists(":cgetfile")
            execute "silent! cgetfile " . tmpfile
        else
            execute "silent! cfile " . tmpfile
        endif

        let &efm = old_efm

        "" Open the quickfix window below the current window
        botright copen

        call delete(tmpfile)
    endif
endfunction

" Find file with locate utility 
function! Locate(...)
    let pattern = a:1
    let l:cmd = "locate -r ".pattern
    let l:list=system(l:cmd)
    let l:num=strlen(substitute(l:list, "[^\n]", "", "g"))
    if v:shell_error != 0 || l:num < 1
        echo "'".pattern."' not found"
        return
    endif
    if l:num != 0
        let tmpfile = tempname()
        exe "redir! > " . tmpfile
        silent echon l:list
        redir END
        let old_efm = &efm
        set efm=%f

        if exists(":cgetfile")
            execute "silent! cgetfile " . tmpfile
        else
            execute "silent! cfile " . tmpfile
        endif

        let &efm = old_efm

        "" Open the quickfix window below the current window
        botright copen

        call delete(tmpfile)
    endif
endfunction

command! -nargs=* -complete=dir Find :call Find(0, <f-args>)
command! -nargs=* -complete=dir FindNoCase :call Find(1, <f-args>)
command! -nargs=1 -complete=file Locate :call Locate(<f-args>)
