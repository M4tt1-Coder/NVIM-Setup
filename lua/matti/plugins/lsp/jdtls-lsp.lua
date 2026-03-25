-- JDTLS is a Java language server that provides features like code completion, refactoring, and debugging for Java projects. It is based on the Eclipse JDT (Java Development Tools) and is designed to work with Neovim's built-in LSP client.
return {
	"mfussenegger/nvim-jdtls",
	ft = "java",
	config = function()
		vim.lsp.enable("jdtls")
	end,
}
