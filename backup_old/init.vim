" Imports
runtime ./plug.vim
lua require('lsp-config')
lua require('autocompletion')
lua require('treesitter')
lua require('telescope-settings')

syntax enable
set encoding=utf-8
set background=dark
set number
set relativenumber
set title
set autoindent
set nobackup
set nowritebackup
set noswapfile
set hlsearch
set showcmd
set cmdheight=1
set expandtab
set tabstop=4
set shiftwidth=4
set ai
set si
set nowrap
set smarttab
set ignorecase
set smartcase
set backspace=start,eol,indent
set cursorline
set shortmess+=c
set updatetime=300
set signcolumn=number
set termguicolors
set mouse=a
set cursorline
set lazyredraw
set clipboard^=unnamed,unnamedplus
set wildignore+=*/node_modules/*
set completeopt=menu,menuone,noselect

" Color scheme
colorscheme vscode

" Leader key
let mapleader = "\<Space>"

" Mappings
nmap <C-S> :w<CR>
nmap <C-n> :NERDTreeToggle<CR>
nnoremap <esc> :noh<return><esc>

" Telescope
" nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <C-P> <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
