require("conform").setup({
	formatters_by_ft = {
		bash = { "shfmt", lsp_format = "fallback" },
		sh = { "shfmt", lsp_format = "fallback" },
		clojure = { "cljfmt", lsp_format = "fallback" },
		css = { "prettier" },
		fish = { "fish_indent" },
		graphql = { "prettier" },
		html = { "prettier" },
		javascript = { "prettier" },
		json = { "prettier" },
		lua = { "stylua" },
		markdown = { "prettier" },
		python = { "black" },
		typescript = { "prettier" },
		yaml = { "yamlfix" }
	},
	format_on_save = false,
	lsp_formatting = "fallback",

	-- Keymap
	vim.keymap.set("n", "<Leader>p", function()
		require("conform").format({ async = true })
	end, { noremap = true, silent = true, desc = "Format file with Conform" }),
})
