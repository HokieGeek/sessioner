if exists("g:loaded_sessioner") || v:version < 700
    finish
endif
let g:loaded_sessioner = 1

if exists("b:sessioner_session_file")
    unlet! b:sessioner_session_file
endif
autocmd BufWinEnter * call sessioner#initiate()
autocmd VimEnter * call sessioner#load()
