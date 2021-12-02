function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
" Use K to show documentation in preview window.
" Causes problems sometimes, but copy this to javascript ftplugin at least.
nnoremap <buffer><silent> K :call <SID>show_documentation()<CR>

setlocal shiftwidth=2
setlocal tabstop=2

" Run current test file. Only works when writing tests.
nnoremap <buffer> <leader>t :!yarn test-one %<CR>
