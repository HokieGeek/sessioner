if exists("g:autoloaded_sessioner") || v:version < 700
    finish
endif
let g:autoloaded_sessioner = 1

function! sessioner#initiate()
    let l:sessions_dir = $HOME."/.vim/sessions"
    if isdirectory(l:sessions_dir)
        call system("mkdir ".l:sessions_dir)
    endif
    let b:sessioner_session_file = l:sessions_dir."/".expand("%:t").".session"
endfunction
function! sessioner#save()
    if exists("b:sessioner_session_file")
        execute "mksession! ".b:sessioner_session_file
        if filereadable(b:sessioner_session_file)
            redraw
            echo "Saved session"
        else
            echohl WarningMsg
            echomsg "Error saving session"
            echohl None
        endif
    endif
endfunction
function! sessioner#load()
    if exists("b:sessioner_session_file")
        if filereadable(b:sessioner_session_file)
            execute "source ".b:sessioner_session_file
            syntax on
            redraw
            echo "Loaded saved session"
        endif
    endif
endfunction
function! sessioner#delete()
    if exists("b:sessioner_session_file")
        if filereadable(b:sessioner_session_file)
            call delete(b:sessioner_session_file)
            echo "Deleted session"
        else
            echomsg "No session found"
        endif
    endif
endfunction
