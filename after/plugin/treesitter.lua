require('nvim-treesitter.configs').setup {
    ensure_installed = { "c", "c_sharp", "java", "javascript", "typescript" },
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false
    },
    indent = { enable = true },
    sync_install = true,
    auto_install = true
}
