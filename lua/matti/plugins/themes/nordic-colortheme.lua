-- Nordic colortheme for Neovim, inspired by the Nordic color palette. The theme features a dark background with cool and muted colors, creating a calm and focused coding environment. It is designed to be easy on the eyes and provide good contrast for syntax highlighting, making it a great choice for long coding sessions. The theme also includes support for various plugins and can be customized to fit your preferences, allowing you to create a personalized coding experience. With its clean and minimalist design, the Nordic colortheme is perfect for developers who prefer a simple and elegant color scheme for their Neovim setup.
return {
	"AlexvZyl/nordic.nvim",
	lazy = false,
	-- priority = 1000,
	config = function()
		require("nordic").setup({
			bold_keywords = true,
		})
	end,
}
