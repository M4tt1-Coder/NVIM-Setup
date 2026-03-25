-- Indent Blankline is a Neovim plugin that adds indentation guides to all lines (including empty lines). It helps to visualize the indentation levels in your code, making it easier to read and understand the structure of your code.
return {
	"lukas-reineke/indent-blankline.nvim",
	event = { "BufReadPre", "BufNewFile" },
	main = "ibl",
	opts = {
		indent = { char = "┊" },
	},
}
