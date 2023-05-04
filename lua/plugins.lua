return require('packer').startup(function(use)
  -- core
  use 'nanozuki/tabby.nvim'
  use 'alvarosevilla95/luatab.nvim'
  use 'wbthomason/packer.nvim'
  use 'nvim-treesitter/nvim-treesitter'
  use 'ellisonleao/gruvbox.nvim'
  use 'windwp/nvim-autopairs'
  use 'nvim-lua/plenary.nvim'
  use "akinsho/toggleterm.nvim"
  use { 'nvim-telescope/telescope.nvim', tag = '0.1.1', branch = '0.1.x' }
  use { 'ray-x/lsp_signature.nvim', commit = "1d96fac72eb6d74abd5b4d7883a01f58aeb4f87e" }
  -- auto completion
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'L3MON4D3/LuaSnip'
  -- lsp
  use 'neovim/nvim-lspconfig'
  use 'williamboman/mason-lspconfig.nvim'
  use { 'williamboman/mason.nvim', run = function() pcall(vim.cmd, 'MasonUpdate') end }
  use { 'VonHeikemen/lsp-zero.nvim', branch = 'v2.x' }
  -- cosmetic
  use { 'nvim-tree/nvim-web-devicons', opt = true }
  use 'nvim-lualine/lualine.nvim'
end)
