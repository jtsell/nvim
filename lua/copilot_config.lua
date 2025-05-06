vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap('i', '<F14>', 'copilot#Accept("<CR>")', {silent=true, expr=true})
vim.api.nvim_set_keymap('i', '<F15>', '<Plug>(copilot-accept-line)', {silent=true })

vim.g.copilot_filetypes = { AvanteInput = false, Markdown = false, codecompanion = false }
vim.g.copilot_workspace_folders = { "~/Projects/yellowdig/next/" }
