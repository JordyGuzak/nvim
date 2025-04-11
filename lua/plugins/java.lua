return {
	"nvim-java/nvim-java",
	config = function()
		local keymap = vim.keymap
		local java = require("java")

		keymap.set("n", "<leader>jr", function()
			java.runner.built_in.run_app({})
		end)

		keymap.set("n", "<leader>jb", function()
			java.build.build_workspace()
		end)

		keymap.set("n", "<leader>jc", function()
			java.build.clean_workspace()
		end)

		keymap.set("n", "<leader>jq", function()
			java.runner.built_in.stop_app()
		end)

		keymap.set("n", "<leader>jl", function()
			java.runner.built_in.toggle_logs()
		end)

		keymap.set("n", "<leader>tc", function()
			java.test.run_current_class()
		end)

		keymap.set("n", "<leader>tm", function()
			java.test.run_current_method()
		end)

		keymap.set("n", "<leader>tr", function()
			java.test.view_last_report()
		end)

		-- Debugging Keybindings
		local dap = require("dap")

		keymap.set("n", "<F5>", function()
			dap.continue()
		end) -- Start/Continue Debugging

		keymap.set("n", "<F6>", function()
			dap.terminate()
		end) -- Stop Debugging

		keymap.set("n", "<F7>", function()
			dap.step_into()
		end) -- Step Into

		keymap.set("n", "<F8>", function()
			dap.step_over()
		end) -- Step Over

		keymap.set("n", "<F9>", function()
			dap.step_out()
		end) -- Step Out

		keymap.set("n", "<leader>db", function()
			dap.toggle_breakpoint()
		end) -- Toggle Breakpoint

		keymap.set("n", "<leader>dB", function()
			dap.set_breakpoint()
		end) -- Set Conditional Breakpoint

		keymap.set("n", "<leader>dl", function()
			dap.run_last()
		end) -- Run Last Debug Session

		keymap.set("n", "<leader>dr", function()
			dap.repl.open()
		end) -- Open Debug REPL
	end,
}
