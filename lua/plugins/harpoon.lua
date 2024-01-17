return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    -- set keymaps
    local keymap = vim.keymap -- for conciseness
    local harpoon = require("harpoon")

    keymap.set("n", "<leader>a", function () harpoon:list():append() end)
    keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

    keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
    keymap.set("n", "<C-j>", function() harpoon:list():select(2) end)
    keymap.set("n", "<C-k>", function() harpoon:list():select(3) end)
    keymap.set("n", "<C-l>", function() harpoon:list():select(4) end)

    keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
    keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)
  end,
}
