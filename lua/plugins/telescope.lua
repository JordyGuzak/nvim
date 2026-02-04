return {
	"nvim-telescope/telescope.nvim",
	branch = "master", -- CHANGED: 0.1.x causes the deprecation warning
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
		local actions = require("telescope.actions")
		local themes = require("telescope.themes")
		local builtin = require("telescope.builtin")

		telescope.setup({
			defaults = {
				path_display = { "truncate" },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous,
						["<C-j>"] = actions.move_selection_next,
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
					},
				},
			},
			extensions = {
				["ui-select"] = {
					themes.get_dropdown({}),
				},
			},
		})

		-- ADDED: Load extensions so they actually work
		telescope.load_extension("fzf") -- Makes sorting much faster
		telescope.load_extension("ui-select")
		telescope.load_extension("harpoon") -- Required for your <leader>hf keymap

		-- set keymaps
		local keymap = vim.keymap

		keymap.set("n", "<C-p>", builtin.git_files, {})
		keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
		keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
		keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
		keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
		keymap.set("n", "<leader>sb", builtin.buffers, { desc = "[S]earch [B]uffers" })
		keymap.set("n", "<leader>sws", builtin.lsp_workspace_symbols, { desc = "[S]earch [W]orkspace [S]ymbols" }) -- Fixed typo in desc

		-- harpoon
		keymap.set("n", "<leader>hf", "<cmd>Telescope harpoon marks<cr>", { desc = "Show harpoon marks" })

		keymap.set("n", "<leader>/", function()
			builtin.current_buffer_fuzzy_find(themes.get_dropdown({
				winblend = 10,
				previewer = false,
			}))
		end, { desc = "[/] Fuzzily search in current buffer" })

		keymap.set("n", "<leader>s/", function()
			builtin.live_grep({
				grep_open_files = true,
				prompt_title = "Live Grep in Open Files",
			})
		end, { desc = "[S]earch [/] in Open Files" })

		keymap.set("n", "<leader>sp", function()
			builtin.live_grep({
				prompt_title = "Live Grep in Open Files",
			})
		end, { desc = "[S]earch [/] in Open Files" })
	end,
}
