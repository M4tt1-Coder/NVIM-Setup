return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.prettier,
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.isort,
				null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.pint,
				null_ls.builtins.diagnostics.pylint,
				null_ls.builtins.diagnostics.phpstan,
			},
		})

		vim.keymap.set("n", "<leader>lf", function()
			vim.lsp.buf.format({ async = true })
		end, { desc = "Format file" })
	end,
}
