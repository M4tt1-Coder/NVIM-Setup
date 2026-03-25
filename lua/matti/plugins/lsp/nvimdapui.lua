-- DAP UI: A user interface for the Debug Adapter Protocol (DAP) in Neovim. It provides a visual interface for debugging code, allowing users to set breakpoints, step through code, and inspect variables in a more intuitive way. Integrates with nvim-dap to enhance the debugging experience, offering a more user-friendly and interactive interface for debugging tasks within Neovim. Provides features such as variable watches, call stacks, and breakpoints management, making it easier for developers to debug their code effectively within the Neovim environment.
return {
	"rcarriga/nvim-dap-ui",
	dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
	config = function()
		require("dapui").setup()
	end,
}
