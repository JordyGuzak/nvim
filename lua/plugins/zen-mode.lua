return {
  'folke/zen-mode.nvim',
  config = function()
    require('zen-mode').toggle({
      vim.keymap.set('n', '<C-F11>', '<cmd>ZenMode<cr>')
    })
  end
}
