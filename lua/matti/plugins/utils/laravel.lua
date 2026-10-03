-- Laravel plugins to interact with artisan commands, routes, and related files
return {
	{
		"adalessa/laravel.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
		},
		cmd = { "Laravel" },
		keys = {
			{ "<leader>la", ":Laravel artisan<cr>", desc = "Artisan" },
			{ "<leader>lr", ":Laravel routes<cr>", desc = "Routes" },
			{ "<leader>lm", ":Laravel related<cr>", desc = "Related Files" },
		},
		config = true,
	},
}
