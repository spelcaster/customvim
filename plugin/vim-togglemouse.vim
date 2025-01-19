" Original code can be found at
" https://github.com/nvie/vim-togglemouse/blob/master/plugin/toggle_mouse.vim
"

" Executa o script se não estiver carregado no buffer
if exists("b:loaded_toggle_mouse_plugin")
    finish
endif

fun! s:ToggleMouse()
    if !exists("s:old_mouse")
        let s:old_mouse = "a"
    endif

    if &mouse == ""
        let &mouse = s:old_mouse
        echo "Mouse is for Vim (" . &mouse . ")"
    else
        let s:old_mouse = &mouse
        let &mouse=""
        echo "Mouse is for terminal"
    endif
endfunction

" Caso o usuário queira, adiciona mapeamento
" O mapeamento padrão está registrado em <leader>m, mas pode ser alterado
if !exists("no_plugin_maps") && !exists("no_toggle_mouse_maps")
    if !hasmapto('<SID>ToggleMouse()')
        noremap <leader>m :call <SID>ToggleMouse()<CR>
        inoremap <leader>m <Esc>:call <SID>ToggleMouse()<CR>a
    endif
endif
