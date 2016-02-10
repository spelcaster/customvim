let $VIMHOME=expand('<sfile>:p:h:h')
let themeindex = 0

if !exists('g:colostring')"{{{
    let colorlist = split(system("ls " . $VIMHOME . "/colors | sed 's/\.vim$//'", '\n'))
    let g:colorstring = join(colorlist, "#") . "#"
endif"}}}

function! RotateColorTheme()
   let y = -1
   while y == -1
       let x = match(g:colorstring, "#", g:themeindex)
       let y = match(g:colorstring, "#", (x + 1))
       let g:themeindex = (x + 1)

       if y == -1
           let g:themeindex = 0
           continue
       endif

       let themestring = strpart(g:colorstring, (x + 1), (y - x - 1))

       return ":colorscheme " . themestring
   endwhile
endfunction
