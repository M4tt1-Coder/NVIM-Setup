-- Author: Filipe Coelho
-- Description: Vesper is a dark color scheme for Neovim, written in Lua. It is designed to be easy on the eyes and to provide good contrast for code. It supports both GUI and terminal Neovim, and it is compatible with a wide range of plugins. The configuration allows for customization of transparency, italics for different code elements, and overrides for specific highlight groups and palette colors. Overall, Vesper is a stylish and functional color scheme that enhances the visual experience of coding in Neovim, making it a popular choice among developers who prefer a dark theme for their editor.
return {
	"datsfilipe/vesper.nvim",
	lazy = false,
	config = function()
		require("vesper").setup({
			transparent = true, -- Boolean: Sets the background to transparent
			italics = {
				comments = true, -- Boolean: Italicizes comments
				keywords = false, -- Boolean: Italicizes keywords
				functions = false, -- Boolean: Italicizes functions
				strings = false, -- Boolean: Italicizes strings
				variables = true, -- Boolean: Italicizes variables
			},
			overrides = {}, -- A dictionary of group names, can be a function returning a dictionary or a table.
			palette_overrides = {},
		})
	end,
}
