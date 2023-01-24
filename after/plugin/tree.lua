require("nvim-tree").setup({
    view = {
        adaptive_size = true,
        mappings = {
          list = {
            { key = "u", action = "dir_up" },
          },
        },
      },
      renderer = {
        group_empty = true,
      },
      filters = {
        dotfiles = true,
      },
})

vim.keymap.set("n", "<C-n>" ,"<cmd>NvimTreeToggle<cr>")
vim.keymap.set("n", "A-n>","<cmd>NvimTreeFindFile<cr>")
