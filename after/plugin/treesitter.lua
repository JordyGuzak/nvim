require('nvim-treesitter.configs').setup {
    ensure_installed = { "c", "c_sharp", "java", "javascript", "typescript" },
    highlight = { enable = true },
    indent = { enable = true },
    sync_install = true,
    auto_install = true
}
