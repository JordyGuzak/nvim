return {
	"VonHeikemen/lsp-zero.nvim",
	branch = "v1.x",
	dependencies = {
		-- LSP Support
		"neovim/nvim-lspconfig",
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",

		-- Autocompletion
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"saadparwaiz1/cmp_luasnip",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-nvim-lua",

		-- Snippets
		"L3MON4D3/LuaSnip",
		"rafamadriz/friendly-snippets",

		-- Telescope
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		local lsp = require("lsp-zero")

		lsp.preset("recommended")

		lsp.ensure_installed({
			"ts_ls",
			"eslint",
			"tailwindcss",
			"html",
			"jdtls",
		})

		-- Fix Undefined global 'vim'
		lsp.configure("lua-language-server", {
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
				},
			},
		})

		local cmp = require("cmp")
		local cmp_select = { behavior = cmp.SelectBehavior.Select }
		local cmp_mappings = lsp.defaults.cmp_mappings({
			["<C-k>"] = cmp.mapping.select_prev_item(cmp_select),
			["<C-j>"] = cmp.mapping.select_next_item(cmp_select),
			["<Tab>"] = cmp.mapping.confirm({ select = false }),
			["<CR>"] = cmp.mapping.confirm({ select = false }),
			["<C-Space>"] = cmp.mapping.complete(),
		})

		--cmp_mappings['<Tab>'] = nil
		--cmp_mappings['<S-Tab>'] = nil

		lsp.setup_nvim_cmp({
			mapping = cmp_mappings,
		})

		lsp.set_preferences({
			suggest_lsp_servers = false,
			sign_icons = {
				error = "E",
				warn = "W",
				hint = "H",
				info = "I",
			},
		})

		lsp.on_attach(function(client, bufnr)
			local opts = { buffer = bufnr, remap = false }
			local builtin = require("telescope.builtin")

			vim.keymap.set("n", "<leader>vd", function()
				vim.diagnostic.open_float()
			end, opts)
			vim.keymap.set("n", "gd", function()
				builtin.lsp_definitions()
			end, opts)
			vim.keymap.set("n", "gr", function()
				builtin.lsp_references()
			end, opts)
			vim.keymap.set("n", "gI", function()
				builtin.lsp_implementations()
			end, opts)
			vim.keymap.set("n", "<leader>D", function()
				builtin.lsp_type_definitions()
			end, opts)
			vim.keymap.set("n", "<leader>ds", function()
				builtin.lsp_document_symbols()
			end, opts)
			vim.keymap.set("n", "<leader>ws", function()
				builtin.lsp_dynamic_workspace_symbols()
			end, opts)
			vim.keymap.set("n", "<leader>rn", function()
				vim.lsp.buf.rename()
			end, opts)
			vim.keymap.set("n", "<leader>ca", function()
				vim.lsp.buf.code_action()
			end, opts)
			vim.keymap.set("i", "<C-h>", function()
				vim.lsp.buf.signature_help()
			end, opts)
			-- vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format() end, opts)
			vim.keymap.set("n", "K", function()
				vim.lsp.buf.hover()
			end, opts)
			vim.keymap.set("n", "gD", function()
				vim.lsp.buf.declaration()
			end, opts)
		end)

		-- setup java before lsp
		require("java").setup()

		lsp.setup()

		vim.diagnostic.config({
			virtual_text = true,
		})
	end,
}
