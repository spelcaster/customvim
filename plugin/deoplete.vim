" Setup deoplete
"
call deoplete#custom#option('ignore_sources', { '_': ['around', 'file', 'dictionary', 'tag'] })
call deoplete#custom#option('num_processes', 2)
call deoplete#custom#option('auto_complete_delay', 200)
call deoplete#custom#option('auto_refresh_delay', 200)
call deoplete#custom#option('min_pattern_length', 1)

" call deoplete#custom#option('enable_refresh_always', 1)
" call deoplete#custom#option('auto_complete_popup', 'manual')

function Multiple_cursors_before()
  call deoplete#custom#option('auto_complete', 1)
endfunction
function Multiple_cursors_after()
  call deoplete#custom#option('auto_complete', 0)
endfunction

call deoplete#custom#option('ignore_sources', get(g:, 'deoplete#ignore_sources', {}))
call deoplete#custom#option('ignore_sources.php', ['phpcd', 'omni'])

"let g:deoplete#enable_at_startup = 1
