local Remap = require("jordyguzak.keymap")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local inoremap = Remap.inoremap
local xnoremap = Remap.xnoremap
local nmap = Remap.nmap

nnoremap("<leader>f", function()
    vim.lsp.buf.format()
end)

nnoremap("<C-s>", ":w<CR>")
inoremap("<C-s>", "<ESC>:w<CR>")
vnoremap("<C-c>", "\"+y")

-- Tree
nnoremap("<C-n>", "<cmd>NvimTreeToggle<cr>")
nnoremap("<A-n>", "<cmd>NvimTreeFindFile<cr>")

-- Telescope
nnoremap("<C-p>", "<cmd>lua require('telescope.builtin').find_files()<cr>")

-- Barbar
nnoremap("<A-c>", "<cmd>BufferClose<cr>")
nnoremap("<A-p>", "<cmd>BufferPick<cr>")

-- Zen Mode
nnoremap("<C-F11>", "<cmd>ZenMode<cr>")

nnoremap("<A-1>", "<cmd>BufferGoto 1<cr>")
nnoremap("<A-2>", "<cmd>BufferGoto 2<cr>")
nnoremap("<A-3>", "<cmd>BufferGoto 3<cr>")
nnoremap("<A-4>", "<cmd>BufferGoto 4<cr>")
nnoremap("<A-5>", "<cmd>BufferGoto 5<cr>")
nnoremap("<A-6>", "<cmd>BufferGoto 6<cr>")
nnoremap("<A-7>", "<cmd>BufferGoto 7<cr>")
nnoremap("<A-8>", "<cmd>BufferGoto 8<cr>")
nnoremap("<A-9>", "<cmd>BufferGoto 9<cr>")
