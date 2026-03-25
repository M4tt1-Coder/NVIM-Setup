-- DAP configuration for Rust using codelldb adapter, provides debugging capabilities for Rust projects in Neovim. Integrates with nvim-dap and nvim-dap-ui to offer a seamless debugging experience, allowing users to set breakpoints, step through code, and inspect variables directly within the editor. Configures the codelldb adapter to work with Rust projects, enabling users to debug their Rust applications effectively. Provides keybindings for common debugging actions and integrates with Rust-specific tools to enhance the debugging workflow for Rust developers using Neovim.
return {
	"mfussenegger/nvim-dap",
	config = function()
		local dap, dapui = require("dap"), require("dapui")
		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

		local mason_path = vim.fn.stdpath("data") .. "/mason/packages/codelldb/extension/"
		local codelldb_path = mason_path .. "adapter/codelldb"

		dap.adapters.codelldb = {
			type = "server",
			port = "${port}",
			executable = {
				command = codelldb_path,
				args = { "--port", "${port}" },
				-- On some setups you may need:
				-- detached = false,
			},
		}

		dap.configurations.rust = {
			{
				name = "Debug executable (Cargo build)",
				type = "codelldb",
				request = "launch",
				program = function()
					-- Build first
					vim.fn.system("cargo build")
					-- Ask for executable path, default to target/debug/<project_name>
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
				args = {},
				-- runInTerminal = false,
			},
		}

		local keymap = vim.keymap
		-- DAP keymaps
		keymap.set("n", "<Leader>dl", "<cmd>lua require'dap'.step_into()<CR>", { desc = "Debugger step into" })
		keymap.set("n", "<Leader>dj", "<cmd>lua require'dap'.step_over()<CR>", { desc = "Debugger step over" })
		keymap.set("n", "<Leader>dk", "<cmd>lua require'dap'.step_out()<CR>", { desc = "Debugger step out" })
		keymap.set("n", "<Leader>dc", "<cmd>lua require'dap'.continue()<CR>", { desc = "Debugger continue" })
		keymap.set(
			"n",
			"<Leader>db",
			"<cmd>lua require'dap'.toggle_breakpoint()<CR>",
			{ desc = "Debugger toggle breakpoint" }
		)
		keymap.set(
			"n",
			"<Leader>dd",
			"<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
			{ desc = "Debugger set conditional breakpoint" }
		)
		keymap.set("n", "<Leader>de", "<cmd>lua require'dap'.terminate()<CR>", { desc = "Debugger reset" })
		keymap.set("n", "<Leader>dr", "<cmd>lua require'dap'.run_last()<CR>", { desc = "Debugger run last" })

		-- dapui keymaps
		keymap.set("n", "<Leader>du", dapui.toggle, { desc = "DAP UI Toggle" })

		-- rustaceanvim
		keymap.set("n", "<Leader>dt", "<cmd>lua vim.cmd('RustLsp testables')<CR>", { desc = "Debugger testables" })
	end,
}
