return {
  'nvim-treesitter/nvim-treesitter',
  dependencies = {
    'nvim-treesitter/playground',
    'nvim-treesitter/nvim-treesitter-context',
  },
  config = function()
    require('nvim-treesitter').setup()
  end
}
