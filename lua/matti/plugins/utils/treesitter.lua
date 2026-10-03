-- Treesitter configuration for Neovim, provides advanced syntax highlighting, code folding, and other features based on the syntax tree of the code. Integrates with nvim-ts-autotag for automatic closing and renaming of HTML tags. Supports a wide range of programming languages and allows for customizable configurations for different file types. Offers improved performance and accuracy compared to traditional regex-based syntax highlighting, making it a powerful tool for developers to enhance their coding experience in Neovim.

-- Treesitter configuration for Neovim 0.12+
--
-- Provides:
--   - Treesitter syntax highlighting
--   - Treesitter indentation
--   - Treesitter-based folding (disabled by default)
--   - Parser/query installation
--   - nvim-ts-autotag integration
--   - Native Treesitter incremental selection

return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false,
	build = ":TSUpdate",

	dependencies = {
		"windwp/nvim-ts-autotag",
	},

	config = function()
		local treesitter = require("nvim-treesitter")

		----------------------------------------------------------------------
		-- Parser/query installation
		----------------------------------------------------------------------

		treesitter.setup({
			install_dir = vim.fn.stdpath("data") .. "/site",
		})

		treesitter.install({
			"json",
			"javascript",
			"typescript",
			"tsx",
			"yaml",
			"html",
			"css",
			"markdown",
			"markdown_inline",
			"svelte",
			"graphql",
			"bash",
			"lua",
			"vim",
			"dockerfile",
			"gitignore",
			"query",
			"vimdoc",
			"c",
			"rust",
			"cpp",
			"python",
			"java",
			"go",
			"php",
			"php_only",
			"blade",
			"tsv",
		})

		----------------------------------------------------------------------
		-- Custom filetypes
		--
		-- Treat *.t files as C++.
		----------------------------------------------------------------------

		vim.filetype.add({
			extension = {
				t = "cpp",
			},
		})

		----------------------------------------------------------------------
		-- General Treesitter settings
		----------------------------------------------------------------------

		vim.opt.conceallevel = 0

		-- Folding is available but disabled by default.
		-- Use :set foldenable or the folding keymaps below when desired.
		vim.opt.foldenable = false

		----------------------------------------------------------------------
		-- Treesitter features
		--
		-- Highlighting:  Neovim native Treesitter
		-- Indentation:   nvim-treesitter
		-- Folding:       Neovim native Treesitter
		----------------------------------------------------------------------

		vim.api.nvim_create_autocmd("FileType", {
			callback = function(args)
				local ft = vim.bo[args.buf].filetype
				local lang = vim.treesitter.language.get_lang(ft)

				if not lang then
					return
				end

				-- Treesitter highlighting
				pcall(vim.treesitter.start, args.buf, lang)

				-- Treesitter indentation
				vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

				-- Treesitter folding
				vim.wo.foldmethod = "expr"
				vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"

				-- Keep folds disabled until explicitly enabled.
				vim.wo.foldenable = false
			end,
		})

		----------------------------------------------------------------------
		-- Folding keymaps
		--
		-- za = toggle fold
		-- zo = open fold
		-- zc = close fold
		-- zR = open all folds
		-- zM = close all folds
		----------------------------------------------------------------------

		vim.keymap.set("n", "<leader>za", "za", {
			desc = "Toggle fold",
		})

		vim.keymap.set("n", "<leader>zo", "zo", {
			desc = "Open fold",
		})

		vim.keymap.set("n", "<leader>zc", "zc", {
			desc = "Close fold",
		})

		vim.keymap.set("n", "<leader>zR", "zR", {
			desc = "Open all folds",
		})

		vim.keymap.set("n", "<leader>zM", "zM", {
			desc = "Close all folds",
		})

		----------------------------------------------------------------------
		-- nvim-ts-autotag
		----------------------------------------------------------------------

		require("nvim-ts-autotag").setup({
			opts = {
				enable_close = true,
				enable_rename = true,
				enable_close_on_slash = false,
			},
		})

		----------------------------------------------------------------------
		-- Incremental selection
		--
		-- <C-Space> = expand to parent
		-- <BS>       = contract to child
		----------------------------------------------------------------------

		vim.keymap.set({ "n", "x" }, "<C-space>", function()
			vim.treesitter.select("parent")
		end, {
			desc = "Treesitter select parent node",
		})

		vim.keymap.set("x", "<BS>", function()
			vim.treesitter.select("child")
		end, {
			desc = "Treesitter select child node",
		})
	end,
}
