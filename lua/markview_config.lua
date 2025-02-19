require('markview').setup {
  yaml = true,
  preview = {
    filetypes = { "markdown", "codecompanion" },
    ignore_buftypes = {},
    modes = { "n", "no", "c", "i"},
    hybrid_modes = {"i", "v", "V" },
    linewise_hybrid_mode = true,
    max_buf_lines = 1,
    devicons = "devicons",
  },
}
