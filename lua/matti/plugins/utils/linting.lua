-- Linting configuration using nvim-lint, provides linting functionality for various programming languages. Automatically lints files on buffer enter, write, and insert leave events, ensuring that code is checked for errors and style issues in real-time. Supports multiple linters based on file type, such as eslint_d for JavaScript and TypeScript, and pylint for Python. Allows for manual triggering of linting with a keybinding, providing flexibility in when linting is performed. Integrates with Neovim's autocommand system to ensure that linting is seamlessly integrated into the coding workflow, helping developers maintain code quality and adhere to coding standards.
return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			javascript = { "eslint_d" },
			typescript = { "eslint_d" },
			javascriptreact = { "eslint_d" },
			typescriptreact = { "eslint_d" },
			svelte = { "eslint_d" },
			python = { "pylint" },
		}

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})

		vim.keymap.set("n", "<leader>l", function()
			lint.try_lint()
		end, { desc = "Trigger linting for current file" })
	end,
}
