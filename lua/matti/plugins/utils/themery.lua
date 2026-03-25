-- A plugin to easily switch between colorschemes and preview them live.
return {
	"zaldih/themery.nvim",
	lazy = false,
	config = function()
		require("themery").setup({
			themes = { "gruvbox", "onedark", "bamboo", "kanagawa", "catppuccin", "nordic", "vesper" }, -- Your list of installed colorschemes.
			livePreview = true, -- Apply theme while picking. Default to true.
		})
	end,
}
