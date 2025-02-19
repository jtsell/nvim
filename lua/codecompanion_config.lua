require("codecompanion").setup {
  display = {

    chat = {
      -- Change the default icons
      icons = {
        pinned_buffer = "📌 ",
        watched_buffer = "👀 ",
      },


      window = {
        layout = "horizontal", -- float|vertical|horizontal|buffer
        position = "top",      -- left|right|top|bottom (nil will default depending on vim.opt.plitright|vim.opt.splitbelow)
        border = "single",
        height = 0.3,
        -- width = 0.45,
        relative = "editor",
        opts = {
          breakindent = true,
          cursorcolumn = false,
          cursorline = false,
          foldcolumn = "0",
          linebreak = true,
          list = false,
          numberwidth = 1,
          signcolumn = "no",
          spell = false,
          wrap = true,
        },
      },

      intro_message = "Welcome to CodeCompanion ✨! Press ? for options",
      show_header_separator = false, -- Show header separators in the chat buffer? Set this to false if you're using an external markdown formatting plugin
      separator = "---", -- The separator between the different messages in the chat buffer
      show_references = true, -- Show references (from slash commands and variables) in the chat buffer?
      show_settings = false, -- Show LLM settings at the top of the chat buffer?
      show_token_count = true, -- Show the token count for each response?
      start_in_insert_mode = false, -- Open the chat buffer in insert mode?
    },

    action_palette = {
      -- width = 95,
      -- height = 10,
      -- prompt = "Prompt ", -- Prompt used for interactive LLM calls
      provider = "telescope",               -- default|telescope|mini_pick
      opts = {
        show_default_actions = true,        -- Show the default actions in the action palette?
        show_default_prompt_library = true, -- Show the default prompt library in the action palette?
      },
    },
  },

  strategies = {
    chat = {
      adapter = "anthropic",
      keymaps = {
        send = {
          modes = { n = "<F14>", i = "<F14>" },
        },
      },

      inline = {
        adapter = "anthropic",
      },

      slash_commands = {
        ["file"] = {
          -- Location to the slash command in CodeCompanion
          callback = "strategies.chat.slash_commands.file",
          description = "Select a file using Telescope",
          opts = {
            provider = "telescope", -- Other options include 'default', 'mini_pick', 'fzf_lua', snacks
            contains_code = true,
          },
        },
      }
    },

  }

}

vim.keymap.set({ 'n' }, '<Leader>ac', '<cmd>CodeCompanionChat Toggle<cr>')
-- vim.keymap.set({ 'n' }, '<C-c>', '<cmd>CodeCompanionChat Toggle<cr>')
-- vim.keymap.set({'v'}, '<C-c>', '<cmd>CodeCompanionChat Add<cr>')
-- vim.keymap.set({ 'n', 'v' }, '<Leader>aa', '<cmd>CodeCompanionActions<cr>')
vim.keymap.set({ 'n', 'v' }, '<Leader>af', '<cmd>CodeCompanionChat Add<cr>')

vim.cmd([[cab cc CodeCompanion]])
