" Run current test file. Only works when writing tests.
nnoremap <buffer> <leader>t :!yarn --cwd api test-one ../%<CR>
" vim.keymap.set('n', '<leader>p', function() vim.lsp.buf.format { async = true } end, bufopts)
nnoremap <buffer> <leader>p :Neoformat <CR>
