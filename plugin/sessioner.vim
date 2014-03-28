if exists("b:sessioner_session_file")
    unlet! b:sessioner_session_file
endif
autocmd BufWinEnter * call sessioner#initiate()
autocmd VimEnter * call sessioner#load()
