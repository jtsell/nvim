" Clojure Settings

" Cljfmt: I don't know why these don't work:
" let g:clojure_align_multiline_strings = 1
" let g:clojure_align_subforms = 1
" let g:clj_fmt_autosave = 0

" nnoremap <buffer> <leader>p :Cljfmt<CR>
" nmap <leader>p <Plug>(coc-format-buffer)
nnoremap <buffer> <leader>p :call CocAction('format')<CR>

RainbowParentheses
nnoremap <buffer> crr :Require<CR>

