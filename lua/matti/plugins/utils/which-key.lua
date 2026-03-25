-- which-key.nvim: A Neovim plugin that provides a popup with keybinding hints. It helps users discover and remember keybindings by displaying a list of available keybindings in a popup window when a certain key is pressed. This plugin enhances the user experience by making it easier to learn and use keybindings in Neovim, improving productivity and efficiency when navigating and using the editor.
-- https://github.com/folke/which-key.nvim
return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 500
	end,
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
	},
}
