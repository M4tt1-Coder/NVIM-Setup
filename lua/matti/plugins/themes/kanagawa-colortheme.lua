-- Kanagawa colorscheme for Neovim, based on the colors of the famous Japanese painting "The Great Wave off Kanagawa" by Hokusai. The theme features a dark background with vibrant colors inspired by the artwork, creating a visually appealing and immersive coding experience.
return {
	"rebelot/kanagawa.nvim",
	config = function()
		require("kanagawa").setup({
			theme = "dragon",
		})
	end,
}
