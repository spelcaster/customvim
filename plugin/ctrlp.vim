" Setup CtrlP
let g:ctrlp_custom_ignore='obj'
" Open CtrlP to search for tags in buffer
nnoremap <silent> <leader>r :CtrlPBufTag<CR>
nnoremap <silent> <leader>b :CtrlPBufTagAll<CR>

" Setup ctrl-funky
nnoremap <Leader>fu :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>

nnoremap <leader>t :CtrlPTag<cr>
