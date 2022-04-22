-- You dont need to set any of these options. These are the default ones. Only
-- the loading is important
require('telescope').setup {
-- { defaults = { file_ignore_patterns = {"node_modules"} } }
  defaults = { file_ignore_patterns = {"^trees/"}},
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case," the default case_mode is "smart_case"
    }
  }
}
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')

local utils = require "telescope.utils"
local map = vim.api.nvim_set_keymap

Telescope_map = function (binding, command)
  local full_command = (':lua require("telescope.builtin").' .. command .. '<CR>')
  vim.api.nvim_set_keymap('n', binding, full_command, {noremap=true})
end

-- map('n', '<Leader>ff', ':lua GFiles_or_Files()<CR>', {noremap=true})
Telescope_map('<Leader>f:', 'commands{}')
Telescope_map('<Leader>fF', 'live_grep{}')
Telescope_map('<Leader>F', 'live_grep{}')
Telescope_map('<Leader>fM', 'man_pages{}')
Telescope_map('<Leader>f`', 'marks{}')
Telescope_map('<Leader>fb', 'buffers{ignore_current_buffer = true}')
Telescope_map('<Leader>fc', 'bcommits{}')
Telescope_map('<Leader>ff', 'find_files{}')
Telescope_map('<Leader>fh', 'help_tags{}')
Telescope_map('<Leader>fk', 'keymaps{}')
Telescope_map('<Leader>fm', 'marks{}')
Telescope_map('<Leader>fp', 'builtin{}')
Telescope_map('<Leader>ft', 'filetypes{}')
Telescope_map('<leader>/', 'current_buffer_fuzzy_find{}')
Telescope_map('<leader>f/', 'current_buffer_fuzzy_find{}')
-- todo: lsp telescope builtins
