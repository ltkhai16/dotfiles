local status, packer = pcall(require, "packer")
if (not status) then
  print("Packer is not install")
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  use 'folke/tokyonight.nvim'
  use "EdenEast/nightfox.nvim"
  use {'akinsho/bufferline.nvim', requires = 'nvim-tree/nvim-web-devicons'}
  use 'wbthomason/packer.nvim'
  use 'nvim-lualine/lualine.nvim' -- Status line


  use 'hrsh7th/nvim-cmp' -- Completion
  use 'MunifTanjim/prettier.nvim' -- Prettier plugin for Neovim's built-in LSP client

  -- install without yarn or npm
  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })

  -- use 'github/copilot.vim'
end)

