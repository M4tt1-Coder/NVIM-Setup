-- This plugin provides autocompletion and other features for Rust's Cargo.toml files. It integrates with the nvim-cmp completion plugin to offer suggestions for crate names and versions when editing Cargo.toml files. The plugin is configured to be loaded only when editing files with the "toml" filetype, ensuring that it is only active when working with Cargo.toml files. The configuration also enables the completion source for crates in nvim-cmp, allowing for seamless integration and improved productivity when working with Rust projects in Neovim.
return {
	"saecki/crates.nvim",
	ft = { "toml" },
	config = function()
		require("crates").setup({
			completion = {
				cmp = {
					enabled = true,
				},
			},
		})
		require("cmp").setup.buffer({
			sources = { { name = "crates" } },
		})
	end,
}
