require('lualine').setup({
  options = {
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    winbar_separators = { left = '', right = '' },
    theme = 'gruvbox',
    always_show_tabline = false,
    ignore_focus = {},
    globalstatus = true,
    disabled_filetypes = { -- Filetypes to disable lualine for.
      winbar = {"Avante", "AvanteInput"},         -- only ignores the ft for winbar.
    },
  },
  sections = {
    lualine_a = {
      {
        'mode',
        fmt = string.lower
      }
    },
    lualine_b = {
      {
        'FugitiveHead',
        -- fmt = function(str)
        --   return string.sub(str, 1, 7)
        -- end
      },
    },
    lualine_c = {
      -- {
      -- 'diff',
      -- colored = true, -- Displays a colored diff status if set to true
      -- diff_color = {
      --   -- Same color values as the general color option can be used here.
      --   added    = 'GitSignsAdd',    -- Changes the diff's added color
      --   modified = 'GitSignsChange', -- Changes the diff's modified color
      --   removed  = 'GitSignsDelete', -- Changes the diff's removed color you
      -- },
      -- symbols = {added = '+', modified = '~', removed = '-'}, -- Changes the symbols used by the diff.
      -- }
    },
    -- lualine_c = { { 'filename', path = 1 } },
    lualine_x = { 'lsp_progress' },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {
      {
        "filename",
        file_status = true,
        newfile_status = true,
        -- buffers_color = {
        --   -- Same values as the general color option can be used here.
        --   active = 'lualine_{section}_normal',   -- Color for active buffer.
        --   inactive = 'lualine_{section}_inactive', -- Color for inactive buffer.
        -- },
      }
    },
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {},
  },
  winbar = {
    lualine_c = {
      {
        "filename",
        path = 1,
        color = 'lualine_a_normal'
      },
    },
    -- lualine_b = {},
    -- lualine_c = {}
    -- lualine_a = {
    --   {
    --     'diff',
    --     colored = false, -- Displays a colored diff status if set to true
    --     diff_color = {
    --       -- Same color values as the general color option can be used here.
    --       added    = 'GitSignsAdd',                               -- Changes the diff's added color
    --       modified = 'GitSignsChange',                            -- Changes the diff's modified color
    --       removed  = 'GitSignsDelete',                            -- Changes the diff's removed color you
    --     },
    --     symbols = { added = '+', modified = '~', removed = '-' }, -- Changes the symbols used by the diff.
    --   },
    -- },
  },
  inactive_winbar = {
    lualine_c = {
      {
        "filename",
        path = 1,
      },
    },
    -- lualine_b = {},
    -- lualine_c = {}
    -- lualine_c = {
    --   {
    --     'diff',
    --     colored = false, -- Displays a colored diff status if set to true
    --     diff_color = {
    --       -- Same color values as the general color option can be used here.
    --       added    = 'GitSignsAdd',                               -- Changes the diff's added color
    --       modified = 'GitSignsChange',                            -- Changes the diff's modified color
    --       removed  = 'GitSignsDelete',                            -- Changes the diff's removed color you
    --     },
    --     symbols = { added = '+', modified = '~', removed = '-' }, -- Changes the symbols used by the diff.
    --   },
    -- },

  },
  tabline = {
    lualine_a = { { 'tabs', mode = 2, max_length = vim.o.columns / 2 } },
    lualine_b = {},
    lualine_c = {},
    -- lualine_x = {'buffers'},
    -- lualine_x = { 'lsp_progress' },
    lualine_y = {},
    lualine_z = {}
  },
  extensions = { 'fugitive' }
})
