local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local packer_bootstrap
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
    install_path })
end

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use { "ellisonleao/gruvbox.nvim", config = [[require('gruvbox_config')]] }
  -- use 'overcache/NeoSolarized'
  use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true } }
  use 'tpope/vim-repeat'
  use 'tpope/vim-commentary'
  use 'tpope/vim-surround'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', config = [[require('treesitter_config')]] }
  use { 'nvim-telescope/telescope.nvim',
    requires = { { 'nvim-lua/plenary.nvim' }, { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' } },
    config = [[require('telescope_config')]]
  }
  use { 'eraserhd/parinfer-rust', run = 'cargo build --release' }
  -- use { 'gpanders/nvim-parinfer'}
  use { 'Olical/conjure', config = [[require('conjure_config')]], branch = 'main' }
  use { 'neovim/nvim-lspconfig', config = [[require('lsp')]] }
  use { 'guns/vim-sexp', config = [[vim.g.sexp_enable_insert_mode_mappings = false]] }
  use 'tpope/vim-sexp-mappings-for-regular-people'
  use 'junegunn/rainbow_parentheses.vim'
  use 'lukas-reineke/indent-blankline.nvim'
  use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' }, config = [[require('gitsigns_config')]] }
  use { 'tpope/vim-fugitive', config = [[require('fugitive_config')]] }
  use { 'tpope/vim-rhubarb', requires = { 'tpope/vim-fugitive' } }
  use { 'windwp/nvim-autopairs', config = [[require('pairs_config')]] }
  use { 'sbdchd/neoformat' }
  use { 'nvim-treesitter/nvim-treesitter-textobjects', after = 'nvim-treesitter', requires = "nvim-treesitter/nvim-treesitter" }
  use { 'hrsh7th/nvim-cmp',
    requires = {
      -- { 'L3MON4D3/LuaSnip' },
      { 'paterjason/cmp-conjure' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-cmdline' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },
      { 'hrsh7th/cmp-path' },
      { 'neovim/nvim-lspconfig' },
      { 'saadparwaiz1/cmp_luasnip' }
    },
    config = [[require('completion_config')]],
    branch = "main"
  }
  use { 'kevinhwang91/rnvimr' }
  -- use { 'earthly/earthly.vim' }
  use { 'arkav/lualine-lsp-progress', requires = "nvim-lualine/lualine.nvim" }


  -- use {
  --   'MeanderingProgrammer/render-markdown.nvim',
  --   after = { 'nvim-treesitter' },
  --   -- requires = { 'echasnovski/mini.nvim', opt = true }, -- if you use the mini.nvim suite
  --   -- requires = { 'echasnovski/mini.icons', opt = true }, -- if you use standalone mini plugins
  --   requires = { 'nvim-tree/nvim-web-devicons', opt = true }, -- if you prefer nvim-web-devicons
  --   config = function()
  --     require('render-markdown').setup({
  --       file_types = { "markdown", "Avante" }
  --     })
  --   end,
  -- }

  use { 'rmagatti/auto-session',
    requires = { 'nvim-telescope/telescope.nvim' },
    config = [[require('auto_session')]]
  }
  use { "OXY2DEV/markview.nvim", config = [[require('markview_config')]], branch = 'main' }

  -- AI Plugins:

  use { 'github/copilot.vim', config = [[require('copilot_config')]] }

  use {
    "olimorris/codecompanion.nvim",
    config = [[require('codecompanion_config')]],
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "OXY2DEV/markview.nvim"
      -- "MeanderingProgrammer/render-markdown.nvim",
    }
  }
  -- use { 'yetone/avante.nvim',
  --   config = [[require('avante_config')]],
  --   requires = {
  --     "MunifTanjim/nui.nvim",
  --     "nvim-telescope/telescope.nvim",
  --     'nvim-lua/plenary.nvim',
  --     'MeanderingProgrammer/render-markdown.nvim',
  --     'stevearc/dressing.nvim'
  --   },
  --   branch = 'main',
  --   run = 'make'
  -- }
  -- use { "supermaven-inc/supermaven-nvim", config = [[require('supermaven')]] }


  -- use { 'codota/tabnine-nvim', run = "./dl_binaries.sh", config = [[require('tabnine_config')]] }
  -- use { 'epwalsh/obsidian.nvim', config = [[require('obsidian_config')]] }
  -- use {'topaxi/pipeline.nvim', run = 'make' }

  if packer_bootstrap then
    require('packer').sync()
  end
end)
