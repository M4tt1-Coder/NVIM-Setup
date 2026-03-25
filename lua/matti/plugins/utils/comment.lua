-- Comment plugin configuration for NVIM, provides easy commenting functionality. Integrates with nvim-ts-context-commentstring for context-aware commenting in various file types (e.g., tsx, jsx, svelte, html). Allows for commenting and uncommenting lines or blocks of code with customizable keybindings and supports different comment styles based on the context of the code being commented.
return {
	"numToStr/Comment.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"JoosepAlviste/nvim-ts-context-commentstring",
	},
	config = function()
		-- import comment plugin safely
		local comment = require("Comment")

		local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")

		-- enable comment
		comment.setup({
			-- for commenting tsx, jsx, svelte, html files
			pre_hook = ts_context_commentstring.create_pre_hook(),
		})
	end,
}
