require('gitsigns').setup {
  signcolumn = false,
  numhl = true,
  signs = {
    add = { numhl='GitSignsAdd'},
    change = { numhl='GitSignsChange'},
    delete = { numhl='GitSignsDelete'},
    topdelete = { numhl='GitSignsDelete'},
    changedelete = { numhl='GitSignsChange'},
  },
}

-- vim.cmd([[
-- ]])
