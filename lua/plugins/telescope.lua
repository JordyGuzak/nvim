return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-telescope/telescope-ui-select.nvim",
    "nvim-tree/nvim-web-devicons",
    "ThePrimeagen/harpoon",
  },
  config = function()
    -- import telescope plugin safely
    local telescope = require("telescope")

    -- import telescope actions safely
    local actions = require("telescope.actions")

    -- import telescope-ui-select safely
    local themes = require("telescope.themes")

    local builtin = require("telescope.builtin")

    -- configure telescope
    telescope.setup({
      -- configure custom mappings
      defaults = {
        path_display = { "truncate" },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next, -- move to next result
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- send selected to quickfixlist
          },
        },
      },
      extensions = {
        ["ui-select"] = {
          themes.get_dropdown({}),
        },
      },
    })

    telescope.load_extension("ui-select")

    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    keymap.set('n', '<C-p>', builtin.git_files, {})
    keymap.set('n', '<leader>ff', builtin.find_files, {})
    keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Show open buffers" }) -- list open buffers in current neovim instance
    keymap.set("n", "<leader>hf", "<cmd>Telescope harpoon marks<cr>", { desc = "Show harpoon marks" }) -- show harpoon marks
  end,
}
