require("minuet").setup({
  provider = 'claude',
	virtualtext = {
		auto_trigger_ft = {},
		show_on_completion_menu = false,
		keymap = {
			-- accept whole completion
			accept = "<F14>",
			-- accept = "<A-A>",
			-- accept one line
			-- accept_line = "<A-a>",
			-- accept n lines (prompts for number)
			-- e.g. "A-z 2 CR" will accept 2 lines
			-- accept_n_lines = "<A-z>",
			-- Cycle to prev completion item, or manually invoke completion
			-- prev = "<A-[>",
			-- Cycle to next completion item, or manually invoke completion
			-- next = "<A-]>",
			-- dismiss = "<A-e>",
		},
	},
	provider_options = {
		claude = {
			model = "claude-haiku-4-5-20251001", -- fast, cheap, good for autocomplete
			max_tokens = 256,
			stream = true,
			-- api_key = "ANTHROPIC_API_KEY",
		},
	},
	-- cmp = {
	-- 	enable_auto_complete = true,
	-- },
})
