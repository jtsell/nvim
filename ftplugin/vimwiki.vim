
" Insert Date:
function! Date(count)
    :r! date "+[[diary:\%G-\%m-\%d|\%G-\%m-\%d]]"
    for l:i in range(a:count)
        :execute "normal \<Plug>VimwikiAddHeaderLevel"
    endfor
endfunction
nnoremap <silent> ,d :<C-U>call Date(v:count1)<CR>

nnoremap <S-CR> :VimwikiSplitLink<CR>
nnoremap <C-CR> :VimwikiVSplitLink<CR>
nnoremap <C-S-g> :VimwikiTabnewLink<CR>

SoftWrapMode
