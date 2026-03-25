-- One Dark Theme for Neovim, a popular color scheme inspired by the One Dark theme from Atom. Provides a visually appealing and consistent color palette for Neovim, with support for various plugins and customizable options. The theme features a dark background with vibrant colors for syntax highlighting, making it easy to read and navigate code. It is designed to be easy on the eyes and provide good contrast, making it a great choice for long coding sessions. With its sleek and modern design, the One Dark Theme is a popular choice among Neovim users who want a stylish and functional color scheme for their coding environment.
return {
	"navarasu/onedark.nvim",
	config = function()
		require("onedark").setup({
			style = "darker",
			code_style = {
				functions = "bold",
			},
		})
	end,
}
