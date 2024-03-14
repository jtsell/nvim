-- Run current test file. Only works when writing tests.
vim.keymap.set('n', '<leader>t', '<cmd>!yarn --cwd api test-one ../%<CR>', { noremap = true, buffer = true })
vim.keymap.set('n', '<leader>p', function() vim.cmd('Neoformat') end, { noremap = true, buffer = true })
