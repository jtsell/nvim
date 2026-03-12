local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local packer_bootstrap
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap =
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
end

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")
	use({ "ellisonleao/gruvbox.nvim", config = [[require('gruvbox_config')]] })
	use({ "kyazdani42/nvim-web-devicons" })
	use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons", opt = true } })
	use("tpope/vim-repeat")
	use("tpope/vim-commentary")
	use("tpope/vim-surround")
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate", config = [[require('treesitter_config')]] })
	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/plenary.nvim" }, { "nvim-telescope/telescope-fzf-native.nvim", run = "make" } },
		config = [[require('telescope_config')]],
	})
	-- use {'mrloop/telescope-git-branch.nvim', requires = { 'nvim-telescope/telescope.nvim' }}

	use({ "eraserhd/parinfer-rust", run = "cargo build --release" })
	-- use { 'Olical/conjure', config = [[require('conjure_config')]], branch = 'main', commit = '1df285f180a16da369cd383f6e1c136923b2a862' }
	use({ "Olical/conjure", config = [[require('conjure_config')]], branch = "main" })
	-- use { 'treybastian/nvim-jack-in', branch = 'main', config = [[require('jack_in_config')]] }

	use({ "neovim/nvim-lspconfig", config = [[require('lsp')]] })
	use({ "guns/vim-sexp", config = [[vim.g.sexp_enable_insert_mode_mappings = false]] })
	use("tpope/vim-sexp-mappings-for-regular-people")
	use("junegunn/rainbow_parentheses.vim")
	use("lukas-reineke/indent-blankline.nvim")
	use({
		"lewis6991/gitsigns.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		config = [[require('gitsigns_config')]],
		branch = "main",
	})
	use({ "tpope/vim-fugitive", config = [[require('fugitive_config')]] })
	use({ "tpope/vim-rhubarb", requires = { "tpope/vim-fugitive" } })
	use({ "windwp/nvim-autopairs", config = [[require('pairs_config')]] })
	use({
		"nvim-treesitter/nvim-treesitter-textobjects",
		after = "nvim-treesitter",
		requires = "nvim-treesitter/nvim-treesitter",
	})
	use({
		"hrsh7th/nvim-cmp",
		requires = {
			-- { 'L3MON4D3/LuaSnip' },
			{ "paterjason/cmp-conjure" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-cmdline" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lua" },
			{ "hrsh7th/cmp-path" },
			{ "neovim/nvim-lspconfig" },
			{ "saadparwaiz1/cmp_luasnip" },
		},
		config = [[require('completion_config')]],
		branch = "main",
	})

	-- File Explorer:
	-- use { 'kevinhwang91/rnvimr', config = [[require('ranger_config')]] }
	use({ "stevearc/oil.nvim", requires = "kyazdani42/nvim-web-devicons", config = [[require('oil_config')]] })
	use({ "benomahony/oil-git.nvim", requires = "stevearc/oil.nvim" })

	-- Formatter:
	use({ "sbdchd/neoformat" })
	use({ "stevearc/conform.nvim", config = [[require('conform_config')]] })

	use({ "arkav/lualine-lsp-progress", requires = "nvim-lualine/lualine.nvim" })

	use({
		"rmagatti/auto-session",
		requires = { "nvim-telescope/telescope.nvim" },
		config = [[require('auto_session')]],
	})
	use({ "OXY2DEV/markview.nvim", config = [[require('markview_config')]], branch = "main" })
	-- AI Plugins:

	-- Completion / LLM:
	-- use { 'milanglacier/minuet-ai.nvim',
	--   config = [[require('minuet_config')]],
	--   branch = 'main',
	--   requires = { 'nvim-lua/plenary.nvim' }
	-- }
	use({ "github/copilot.vim", config = [[require('copilot_config')]] })
	-- use { "supermaven-inc/supermaven-nvim", config = [[require('supermaven')]] }
	-- use { 'Exafunction/windsurf.vim', config = [[require('codeium')]] }

	-- use {
	--   "olimorris/codecompanion.nvim",
	--   config = [[require('codecompanion_config')]],
	--   requires = {
	--     "nvim-lua/plenary.nvim",
	--     "nvim-treesitter/nvim-treesitter",
	--     "OXY2DEV/markview.nvim"
	--     -- "MeanderingProgrammer/render-markdown.nvim",
	--   }
	-- }
	-- use {"folke/which-key.nvim", config = function() require("which-key").setup {} end}

	-- Not currently using, but might try later:

	-- use {'topaxi/pipeline.nvim', run = 'make' }

	-- Obsidian
	use({
		"oflisback/obsidian-bridge.nvim",
		requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
		config = [[require('obsidian_config')]],
	})
	-- use({ "epwalsh/obsidian.nvim", requires = { "nvim-lua/plenary.nvim" } })

	if packer_bootstrap then
		require("packer").sync()
	end
end)
