require('nvim-treesitter.configs').setup {
  highlight = {
    enable = true,
    -- disable = { "c", "rust" },
  },
  indent = {
    enable = true,
    -- disable = { "c", "rust" },
    -- module_path = "nvim-treesitter.indent"
  }
}

local ft_to_parser = require"nvim-treesitter.parsers".filetype_to_parsername
ft_to_parser.telekasten = "markdown" -- the someft filetype will use the python parser and queries.
ft_to_parser.edn = "clojure"
