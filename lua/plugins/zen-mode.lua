return {
  'folke/zen-mode.nvim',
  config = function()
    require('zen-mode').setup()
    vim.keymap.set('n', '<C-F11>', '<cmd>ZenMode<cr>')
  end
}
