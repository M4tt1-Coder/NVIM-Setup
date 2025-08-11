return {
	"zaldih/themery.nvim",
	lazy = false,
	config = function()
		require("themery").setup({
			themes = { "gruvbox", "onedark", "bamboo", "kanagawa", "catppuccin", "nordic" }, -- Your list of installed colorschemes.
			livePreview = true, -- Apply theme while picking. Default to true.
		})
	end,
}
