-- Bufferline configuration for Neovim, provides a visually appealing and customizable buffer/tab line. Displays open buffers or tabs with icons and allows for easy navigation and management of buffers/tabs. Integrates with nvim-web-devicons for file type icons and supports various separator styles and modes (buffers or tabs).
return {
	"akinsho/bufferline.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	-- version = "*",
	opts = {
		options = {
			mode = "tabs",
			separator_style = "slant",
		},
	},
}
