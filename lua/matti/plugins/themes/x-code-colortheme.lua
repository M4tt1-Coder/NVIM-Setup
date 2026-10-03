return {
	{
		"arzg/vim-colors-xcode",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("xcode")
		end,
	},
}
