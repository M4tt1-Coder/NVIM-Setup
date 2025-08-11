return {
	"navarasu/onedark.nvim",
	config = function()
		require("onedark").setup({
			style = "darker",
			code_style = {
				functions = "bold",
			},
		})
	end,
}
