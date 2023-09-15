return {
  "folke/tokyonight.nvim",
  name = 'tokyonight',
  lazy = true, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
      require('tokyonight').setup({
        disable_background = true,
      })
      vim.cmd([[colorscheme tokyonight]])
      vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  end,
}
