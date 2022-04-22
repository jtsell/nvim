local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

return require('packer').startup(function(use)
  -- My plugins here
  use 'wbthomason/packer.nvim'
  use 'morhetz/gruvbox'
  use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true } }
  use  'tpope/vim-commentary'
  use  'tpope/vim-surround'
  use  'tpope/vim-repeat'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', config = [[require('treesitter_config')]] }
  use { 'neovim/nvim-lspconfig', config = [[require('lsp')]]}
  use { 'nvim-telescope/telescope.nvim', requires = { {'nvim-lua/plenary.nvim'}, {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}}, config = [[require('telescope_config')]]}
  use { 'eraserhd/parinfer-rust', run = 'cargo build --release' }
  use { 'Olical/conjure', config = [[require('conjure_config')]] }
  use 'venantius/vim-cljfmt'
  use { 'guns/vim-sexp', config = [[vim.g.sexp_enable_insert_mode_mappings = false]]}
  use 'tpope/vim-sexp-mappings-for-regular-people'
  use 'junegunn/rainbow_parentheses.vim'
  use 'lukas-reineke/indent-blankline.nvim'
  -- use 'airblade/vim-gitgutter'
  use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' }, config = [[require('gitsigns_config')]]}
  use { 'tpope/vim-fugitive', config = [[require('fugitive_config')]] }
  use {'renerocksai/telekasten.nvim', requires = { 'nvim-telescope/telescope.nvim' }, config = [[require('tk_config')]] }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
