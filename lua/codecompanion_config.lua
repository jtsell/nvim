local default_model = "anthropic/claude-3.5-sonnet"
local available_models = {
  "anthropic/claude-3.5-sonnet",
  "anthropic/claude-3.7-sonnet",
  "google/gemini-2.5-pro-preview",
  "openai/gpt-4.1",
  "openai/gpt-4o-2024-11-20",
  "x-ai/grok-3-beta",
}
local current_model = default_model

local function select_model()
  vim.ui.select(available_models, {
    prompt = "Select  Model:",
  }, function(choice)
    if choice then
      current_model = choice
      vim.notify("Selected model: " .. current_model)
    end
  end)
end

local adapters = {
  anthropic = function()
    return require("codecompanion.adapters").extend("anthropic", {
      name = "anthropic",
      schema = {
        model = {
          default = "claude-3-5-sonnet-20241022",
        },
      },
    })
  end,

  openrouter = function()
    return require("codecompanion.adapters").extend("openai_compatible", {
      name = "openrouter",
      env = {
        url = "https://openrouter.ai/api",
        api_key = os.getenv("OPENROUTER_API_KEY"),
        chat_url = "/v1/chat/completions",
      },
      schema = {
        model = {
          default = current_model
        }
      }

    })
  end

}


require("codecompanion").setup {
  adapters = adapters,
  display = {
    chat = {

      -- Change the default icons
      icons = {
        pinned_buffer = "📌 ",
        watched_buffer = "👀 ",
      },

      -- Position of the chat buffer
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
      separator = "---",             -- The separator between the different messages in the chat buffer
      show_references = true,        -- Show references (from slash commands and variables) in the chat buffer?
      show_settings = false,         -- Show LLM settings at the top of the chat buffer?
      show_token_count = true,       -- Show the token count for each response?
      start_in_insert_mode = false,  -- Open the chat buffer in insert mode?
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
      adapter = "openrouter",
      user = "Jeff",

      keymaps = {
        send = {
          modes = { n = "<F14>", i = "<F14>" },
        }
      },

      slash_commands = {
        ["buffer"] = {
          keymaps = {
            modes = {
              n = "<leader>ab"
            }
          },
        },
        ["file"] = {
          keymaps = {
            modes = {
              n = "<leader>af"
            }
          }
        }
      }
    },

    inline = {
      adapter = "anthropic",
    },
  },

}


vim.keymap.set("n", "<leader>am", select_model, { desc = "Select Openrouter Model" })
vim.keymap.set({ 'n' }, '<Leader>ac', '<cmd>CodeCompanionChat Toggle<cr>')
-- vim.keymap.set({ 'n' }, '<C-c>', '<cmd>CodeCompanionChat Toggle<cr>')
-- vim.keymap.set({'v'}, '<C-c>', '<cmd>CodeCompanionChat Add<cr>')
-- vim.keymap.set({ 'n', 'v' }, '<Leader>aa', '<cmd>CodeCompanionActions<cr>')
vim.keymap.set({ 'n', 'v' }, '<Leader>af', '<cmd>CodeCompanionChat Add<cr>')
vim.keymap.set("n", "<leader>cs", select_model, { desc = "Select OpenRouter Model" })
vim.cmd([[cab cc CodeCompanion]])
