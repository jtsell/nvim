
" Insert Date:
function! Date(count)
    :r! date
    for l:i in range(a:count)
        :execute "normal \<Plug>VimwikiAddHeaderLevel"
    endfor
endfunction
nnoremap <silent> ,d :<C-U>call Date(v:count1)<CR>

