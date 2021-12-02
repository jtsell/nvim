
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

" Header colors
:hi VimwikiHeader1 guifg=#dc322f
:hi VimwikiHeader2 guifg=#cb4b16
:hi VimwikiHeader3 guifg=#b58900
:hi VimwikiHeader4 guifg=#859900
:hi VimwikiHeader5 guifg=#2aa198
:hi VimwikiHeader6 guifg=#268bd2
:hi VimwikiHeader7 guifg=#6c71c4
