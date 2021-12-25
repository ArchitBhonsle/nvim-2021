local fn = vim.fn

-- automatically setup packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  vim.notify "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- run :PackerSync everytime this file is saved
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

local packer = require "packer"

-- open packer in a floating window
packer.init {
  display = {
    open_fn = function()
      return require "packer.util".float { border = "solid" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  use "wbthomason/packer.nvim" -- packer manages itself

  -- a few common dependencies
  use "nvim-lua/popup.nvim"
  use "nvim-lua/plenary.nvim"
  use "kyazdani42/nvim-web-devicons"

  -- lsp
  use "neovim/nvim-lspconfig"
  use "williamboman/nvim-lsp-installer"

  -- cmp
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-cmdline"
  use "saadparwaiz1/cmp_luasnip"
  use "hrsh7th/cmp-nvim-lsp"
  use "onsails/lspkind-nvim"

  -- snippets
  use "L3MON4D3/LuaSnip"
  use "rafamadriz/friendly-snippets"

  -- treesitter
  use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate'
  }
  use "JoosepAlviste/nvim-ts-context-commentstring"

  -- telescope
  use "nvim-telescope/telescope.nvim"
  use "nvim-telescope/telescope-fzy-native.nvim"
  use "nvim-telescope/telescope-symbols.nvim"

  -- jump!
  use "phaazon/hop.nvim"
  use "ThePrimeagen/harpoon"

  use "numToStr/Comment.nvim"

  use "LunarVim/onedarker.nvim"
  use "akinsho/bufferline.nvim"

  use "folke/which-key.nvim"

  if PACKER_BOOTSTRAP then
    require "packer".sync()
  end
end)
