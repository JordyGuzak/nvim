return {
  "ThePrimeagen/harpoon",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    -- set keymaps
    local keymap = vim.keymap -- for conciseness
    local mark = require("harpoon.mark")
    local ui = require("harpoon.ui")

    keymap.set("n", "<leader>a", mark.add_file)
    keymap.set("n", "<C-e>", ui.toggle_quick_menu)

    keymap.set("n", "<A-1>", function() ui.nav_file(1) end)
    keymap.set("n", "<A-2>", function() ui.nav_file(2) end)
    keymap.set("n", "<A-3>", function() ui.nav_file(3) end)
    keymap.set("n", "<A-4>", function() ui.nav_file(4) end)
  end,
}
