" Open a URL in browser
function! BrowserNavigate()
    let line = getline(".")
    let line = matchstr(line, "http[^   ]*")
    exec "!firefox ".line
endfunction
