return {
	"catppuccin/nvim",
	lazy = false,
	config = function()
		require("catppuccin").setup({
			flavour = "frappe",
			auto_integrations = true,
		})
	end,
}
