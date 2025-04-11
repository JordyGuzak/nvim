-- lua/plugins/neotest.lua (or similar)
return {
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",
			"marilari88/neotest-vitest",
		},
		-- require("neotest").setup({ adapters = { require("neotest-vitest") }}) -- this part stays the same in config
		config = function()
			require("neotest").setup({
				adapters = {
					require("neotest-vitest")({
						filter_dir = function(name, rel_path, root)
							return name ~= "node_modules"
						end,
					}),
					-- You can add adapters for other test runners here
				},
				-- Example UI customization with neotest-ui
				-- require("neotest").setup({
				--   summary = { enabled = true },
				--   output = { enabled = true, open_on_run = true },
				-- })

				-- Example status signs
				status = { enabled = true },
				signs = {
					error = "",
					failed = "",
					passed = "",
					running = "",
					skipped = "",
					unknown = "",
				},
			})

			-- Keymaps (example)
			vim.keymap.set("n", "<leader>tf", function()
				require("neotest").run.run(vim.fn.expand("%"))
			end, { desc = "Test Current File" })

			vim.keymap.set("n", "<leader>tT", function()
				require("neotest").run.run(vim.loop.cwd())
			end, { desc = "Test Entire Suite" })

			vim.keymap.set("n", "<leader>tn", function()
				require("neotest").run.run()
			end, { desc = "Test Nearest" })

			vim.keymap.set("n", "<leader>to", function()
				require("neotest").output.open({ enter = true })
			end, { desc = "Test Output" })

			vim.keymap.set("n", "<leader>ts", function()
				require("neotest").summary.toggle()
			end, { desc = "Test Summary" })

			vim.keymap.set("n", "<leader>tq", function()
				require("neotest").run.stop()
			end, { desc = "Stop Tests" })
		end,
	},
}
