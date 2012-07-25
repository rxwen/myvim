" Find file with find utility 
function! Find(...)
    let path="."
    let pattern = a:1
    if a:0==2
        let path=a:1
        let pattern=a:2
    endif
    let l:cmd = "find ".path. " -name '".pattern."'"
    let l:list=system(l:cmd)
    let l:num=strlen(substitute(l:list, "[^\n]", "", "g"))
    if l:num < 1
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
        "botright copen

        call delete(tmpfile)
    endif
endfunction

command! -nargs=* Find :call Find(<f-args>)
