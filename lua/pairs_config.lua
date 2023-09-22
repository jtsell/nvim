local pairs = require('nvim-autopairs')

pairs.setup({
  disable_filetype = { "TelescopePrompt", "vim" },
})

pairs.get_rules("'")[1].not_filetypes = { "clojure", "scheme", "lisp" }
