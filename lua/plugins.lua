local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
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
  use 'morhetz/gruvbox'
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
  use { 'Olical/conjure', config = [[require('conjure_config')]] }
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
      -- { 'saadparwaiz1/cmp_luasnip' }
    },
    config = [[require('completion_config')]]
  }
  use { 'kevinhwang91/rnvimr' }
  use { 'github/copilot.vim', config = [[require('copilot_config')]] }
  use { 'earthly/earthly.vim' }

  if packer_bootstrap then
    require('packer').sync()
  end
end)
