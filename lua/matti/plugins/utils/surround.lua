-- Add surrounding delimiter pairs with ease. Supports parentheses, brackets, quotes, XML tags, and more. Provides a simple and intuitive interface for adding, changing, and deleting surrounding pairs of characters in the code. Integrates seamlessly with Neovim, allowing for efficient editing and manipulation of surrounding pairs. Offers customizable keybindings and supports various programming languages, making it a versatile tool for developers to enhance their coding experience in Neovim.
return {
	"kylechui/nvim-surround",
	event = { "BufReadPre", "BufNewFile" },
	-- version = "*", -- Use for stability; omit to use `main` branch for the latest features
	config = true,
}
