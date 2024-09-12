require('gitsigns').setup {
  signcolumn = false,
  numhl = true,
  signs = {
    -- add = { numhl='GitSignsAddNr'},
    -- change = { numhl='GitSignsChangeNr'},
    -- delete = { numhl='GitSignsDeleteNr'},
    -- topdelete = { numhl='GitSignsDeleteNr'},
    -- changedelete = { numhl='GitSignsChangeNr'},
  },
}

-- Deprecation warning:
-- 'signs.add.numhl' is now deprecated, please define highlight 'GitSignsAddNr' e.g:
-- vim.api.nvim_set_hl(0, 'GitSignsAddNr', { link = 'GitSignsAdd' })
-- 'signs.change.numhl' is now deprecated, please define highlight 'GitSignsChangeNr' e.g:
--   vim.api.nvim_set_hl(0, 'GitSignsChangeNr', { link = 'GitSignsChange' })
-- 'signs.changedelete.numhl' is now deprecated, please define highlight 'GitSignsChangedeleteNr' e.g:
--   vim.api.nvim_set_hl(0, 'GitSignsChangedeleteNr', { link = 'GitSignsChange' })
-- 'signs.delete.numhl' is now deprecated, please define highlight 'GitSignsDeleteNr' e.g:
--   vim.api.nvim_set_hl(0, 'GitSignsDeleteNr', { link = 'GitSignsDelete' })
-- 'signs.topdelete.numhl' is now deprecated, please define highlight 'GitSignsTopdeleteNr' e.g:
--   vim.api.nvim_set_hl(0, 'GitSignsTopdeleteNr', { link = 'GitSignsDelete' })

-- Stack overflow says do this:
-- signs = {
--   add = { text = "┃" },
--   change = { text = "┃" },
--   delete = { text = "_" },
--   topdelete = { text = "‾" },
--   changedelete = { text = "~" },
--   untracked = { text = "┆" },
-- },
-- But it seems to work fine just commenting that stuff out.
