require('avante_lib').load()
require('avante').setup({
  auto_suggestions_provider = "claude",
  hints = {
    enabled = false,
  },
  behaviour = {
    -- auto_suggestions = true,
    auto_set_highlight_group = true,
    auto_set_keymaps = true,
    auto_apply_diff_after_generation = false,
    support_paste_from_clipboard = false,
  },
  file_selector = {
    provider = 'telescope',
    provider_opts = {}
    --   get_filepaths = function (opts)
    --     require('telescope.builtin').find_files(opts)
    --   end,
    -- }
  },

  mappings = {
    suggestion = {
      accept = "<F14>"
    },
    submit = {
      -- normal = "<CR>",
      insert = "<F14>",
    }
  }

})
