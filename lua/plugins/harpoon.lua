return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		-- set keymaps
		local keymap = vim.keymap -- for conciseness
		local harpoon = require("harpoon")

		keymap.set("n", "<leader>a", function()
			harpoon:list():add()
		end)
		keymap.set("n", "<C-e>", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end)

		keymap.set("n", "<C-h>", function()
			harpoon:list():select(1)
		end)
		keymap.set("n", "<C-j>", function()
			harpoon:list():select(2)
		end)
		keymap.set("n", "<C-k>", function()
			harpoon:list():select(3)
		end)
		keymap.set("n", "<C-l>", function()
			harpoon:list():select(4)
		end)
		keymap.set("n", "<C-;>", function()
			harpoon:list():select(5)
		end)

		keymap.set("n", "<C-S-P>", function()
			harpoon:list():prev()
		end)
		keymap.set("n", "<C-S-N>", function()
			harpoon:list():next()
		end)

		vim.api.nvim_create_autocmd({ "BufLeave", "ExitPre" }, {
			pattern = "*",
			callback = function()
				local filename = vim.fn.expand("%:p:.")
				local harpoon_marks = harpoon:list().items
				for _, mark in ipairs(harpoon_marks) do
					if mark.value == filename then
						mark.context.row = vim.fn.line(".")
						mark.context.col = vim.fn.col(".")
						return
					end
				end
			end,
		})
	end,
}
