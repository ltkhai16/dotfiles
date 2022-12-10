local status, packer = pcall(require, "packer")
if (not status) then
  print("Packer is not install")
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'nvim-lualine/lualine.nvim' -- Status line

  use {
    'svrana/neosolarized.nvim',
    requires = { 'tjdevries/colorbuddy.nvim' }
  }

  use 'hrsh7th/nvim-cmp' -- Completion
  use 'MunifTanjim/prettier.nvim' -- Prettier plugin for Neovim's built-in LSP client

  use 'kyazdani42/nvim-web-devicons' -- File icons
  -- use 'github/copilot.vim'
end)
