require('lualine').setup({
  options = {
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    theme = 'gruvbox',
  },
  sections = {
    lualine_c = {{'filename', path = 1}},
    lualine_x = {'lsp_progress'},
    -- lualine_x = {'tabnine'}
  },
  tabline = {
    lualine_a = {{'tabs', mode = 2, max_length = vim.o.columns/2}},
    lualine_b = {},
    lualine_c = {},
    -- lualine_x = {'buffers'},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
  extensions = {'fugitive'}
})
