-- Maximizes and restores current window in Neovim. Provides a convenient way to focus on a single window by maximizing it, and easily restore it back to its original size when needed. This plugin enhances productivity by allowing users to quickly switch between a focused view and the regular split view, making it easier to work with multiple windows in Neovim.
return {
	"szw/vim-maximizer",
	keys = {
		{ "<leader>sm", "<cmd>MaximizerToggle<CR>", desc = "Maximize/minimize a split" },
	},
}
