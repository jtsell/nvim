require("nnn").setup({
  replace_netrw = "picker",
  picker = {
    cmd = "NNN_FIFO=/tmp/nnn-nvim.fifo NNN_PLUG='p:preview-tui' nnn -a",
    style = {
      width = 0.9,
      height = 0.8,
      xoffset = 0.5,
      yoffset = 0.5,
      border = "rounded",
    },
    session = "shared",
    fullscreen = false,
  },
  explorer = {
    fullscreen = false,
  }
})

vim.keymap.set("n", "<leader>o", "<cmd>NnnPicker %:p:h<cr>", { desc = "Open nnn picker (current file dir)" })
vim.keymap.set("n", "<leader>e", "<cmd>NnnExplorer %:p:h<cr>", { desc = "Open nnn explorer (cwd)" })
