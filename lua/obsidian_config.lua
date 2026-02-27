require("obsidian-bridge").setup({

	-- default settings
	obsidian_server_address = "https://127.0.0.1:27124",
	scroll_sync = false, -- See "Sync of buffer scrolling" section below
	warnings = true, -- Show misconfiguration warnings
	picker = "telescope", -- Picker to use with ObsidianBridgePickCommand ("telescope" | "fzf_lua")
	cert_path = "~/.ssl/obsidian.crt",
})

-- require("obsidian").setup({
-- 	workspaces = {
-- 		{
-- 			name = "D&D",
-- 			path = "/Users/jeff/Documents/D&D/D&D",
-- 		},
-- 	},
-- 	notes_subdir = "notes",
-- 	daily_notes = {
-- 		folder = "Daily",
-- 	},
-- 	new_notes_location = "notes_subdir",
-- 	picker = {
-- 		name = "telescope.nvim",
-- 		note_mappings = {
-- 			-- Create a new note from your query.
-- 			new = "<C-x>",
-- 			-- Insert a link to the selected note.
-- 			insert_link = "<C-l>",
-- 		},
-- 		tag_mappings = {
-- 			-- Add tag(s) to current note.
-- 			tag_note = "<C-x>",
-- 			-- Insert a tag at the current location.
-- 			insert_tag = "<C-l>",
-- 		},
-- 	},
-- })
