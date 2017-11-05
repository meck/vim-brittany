if !exists("g:brittany_on_save")
    let g:brittany_on_save = 1
endif


function! brittany#BrittanyEnable()
    let g:brittany_on_save = 1
endfunction
function! brittany#BrittanyDisable()
    let g:brittany_on_save = 0
endfunction
function! brittany#BrittanyToggle()
    let g:brittany_on_save = !g:brittany_on_save
endfunction


function! brittany#Brittany()
    let l:winview = winsaveview()

    if !executable("brittany")
        echomsg "brittany not found in $PATH, did you installed it?
                    \ (https://github.com/lspitzner/brittany)"
        return
    endif

    " Write the buffer to brittany, rather than having it use the
    " file on disk, because that file might not have been created yet!
    silent! w !brittany > /dev/null 2>&1

    if v:shell_error
        echohl WarningMsg
        echo "Brittany: Parsing error\n"
        echohl None
    else
        let l:config_file_opt = ""
        if exists("g:brittany_config_file")
          let l:config_file_opt = " --config-file " . g:brittany_config_file
        endif

        silent! exe "undojoin"
        silent! exe "keepjumps %!brittany" . l:config_file_opt
      endif

    call winrestview(l:winview)
endfunction

function! brittany#BrittanyOnSave()
    if g:brittany_on_save == 1
        call brittany#Brittany()
    endif
endfunction


augroup brittany
    autocmd!
    autocmd BufWritePre *.hs call brittany#BrittanyOnSave()
augroup END


command! Brittany exe "call brittany#Brittany()"
command! BrittanyEnable exe "call brittany#BrittanyEnable()"
command! BrittanyDisable exe "call brittany#BrittanyDisable()"
command! BrittanyToggle exe "call brittany#BrittanyToggle()"
