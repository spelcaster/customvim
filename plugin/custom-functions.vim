" Open a URL in browser
function! BrowserNavigate()
    let line = getline(".")
    let line = matchstr(line, "http[^   ]*")
    exec "!firefox-developer-edition ".line
endfunction

function! ToggleVerbose()
    if !&verbose
        set verbosefile=~/.vim/log/verbose.log
        set verbose=15
    else
        set verbose=0
        set verbosefile=
    endif
endfunction
