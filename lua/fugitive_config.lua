vim.cmd([[
function! Git_Nosplit(command)
execute "G " . a:command
:wincmd j
:q
endfunction
]])


function Map (binding, command)
  vim.api.nvim_set_keymap('n', binding, command, {noremap=true})
end

-- map('<leader>gC', ':Commits<CR>')
-- nnoremap <leader>gb :G blame<CR>
-- nnoremap <leader>gc :BCommits<CR>
-- nnoremap <leader>gd :Gdiffsplit!<CR>
Map('<Leader>gg', ':call Git_Nosplit("")<CR>')
Map('<Leader>gl', ':call Git_Nosplit("log")<CR>')
Map('<Leader>gs', ':call Git_Nosplit("show")<CR>')
Map('<Leader>gb', ':G blame<CR>')
-- Map('<leader>gd', ':Gdiffsplit!<CR>')

-- nnoremap <leader>gs :call Git_Nosplit("show")<CR>
-- nnoremap gdh :diffget //2<CR>| " From the buffer on the left (Target)
-- nnoremap gdl :diffget //3<CR>| " From the buffer on the right (Merge)

