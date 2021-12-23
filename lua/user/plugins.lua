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
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- run :PackerSync everytime this file is saved
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

local ok, packer = pcall(require, "packer")
if not ok then
  vim.notify("'packer' not found")
  return
end

-- open packer in a floating window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
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

  use "folke/which-key.nvim"
  use "LunarVim/onedarker.nvim"
  use "akinsho/bufferline.nvim"
end)
