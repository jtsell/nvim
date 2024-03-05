vim.cmd([[
function! Git_Nosplit(command)
execute "G " . a:command
:wincmd j
:q
endfunction
]])


function nmap (binding, command)
  vim.api.nvim_set_keymap('n', binding, command, {noremap=true})
end

function vmap (binding, command)
  vim.api.nvim_set_keymap('v', binding, command, {noremap=true})
end

-- map('<leader>gC', ':Commits<CR>')
-- nnoremap <leader>gb :G blame<CR>
-- nnoremap <leader>gc :BCommits<CR>
-- nnoremap <leader>gd :Gdiffsplit!<CR>
nmap('<Leader>gg', ':call Git_Nosplit("")<CR>')
nmap('<Leader>gG', ':tabnew | call Git_Nosplit("")<CR>')
nmap('<Leader>gl', ':call Git_Nosplit("log")<CR>')
nmap('<Leader>gs', ':call Git_Nosplit("show")<CR>')
nmap('<Leader>gb', ':G blame<CR>')
nmap('<Leader>gB', ':GBrowse<CR>')
vmap('<Leader>gB', ':\'<,\'>GBrowse<CR>')
-- Map('<leader>gd', ':Gdiffsplit!<CR>')

-- nnoremap <leader>gs :call Git_Nosplit("show")<CR>
-- nnoremap gdh :diffget //2<CR>| " From the buffer on the left (Target)
-- nnoremap gdl :diffget //3<CR>| " From the buffer on the right (Merge)

