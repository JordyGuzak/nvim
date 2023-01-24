return require("packer").startup(function()
  -- Packer can manage itself
  use("wbthomason/packer.nvim")

  use {
    "nvim-telescope/telescope.nvim",
    requires = { "nvim-lua/plenary.nvim" }
  }

  -- LSP Support
  use ("neovim/nvim-lspconfig")
  use ("williamboman/mason.nvim")
  use ("williamboman/mason-lspconfig.nvim")

  -- Autocompletion
  use ("hrsh7th/nvim-cmp")
  use ("hrsh7th/cmp-buffer")
  use ("hrsh7th/cmp-path")
  use ("saadparwaiz1/cmp_luasnip")
  use ("hrsh7th/cmp-nvim-lsp")
  use ("hrsh7th/cmp-nvim-lua")

  -- Snippets
  use ("L3MON4D3/LuaSnip")
  use ("rafamadriz/friendly-snippets")

  use("nvim-lua/popup.nvim")
  use {
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true }
  }
  use("tpope/vim-fugitive")
  use("mbbill/undotree")
  use("terrortylor/nvim-comment")
  use("folke/zen-mode.nvim")
  use("mattn/emmet-vim")

  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }

  use {
    "romgrk/barbar.nvim",
    requires = {"kyazdani42/nvim-web-devicons"}
  }

  use("kyazdani42/nvim-web-devicons")
  use("folke/tokyonight.nvim")

  use {
    "kyazdani42/nvim-tree.lua",
    requires = {
      "kyazdani42/nvim-web-devicons", -- optional, for file icons
    },
    tag = "nightly" -- optional, updated every week. (see issue #1193)
  }

  -- Treesitter
  use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })
  use("nvim-treesitter/playground")
  use("romgrk/nvim-treesitter-context")

  -- Debugging
  use("mfussenegger/nvim-dap")
  use("rcarriga/nvim-dap-ui")
  use("theHamsta/nvim-dap-virtual-text")
end)
