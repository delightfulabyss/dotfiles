return {
	"folke/todo-comments.nvim",
	cmd = "BufEnter",
	dependencies = "nvim-lua/plenary.nvim",
	config = function()
		require("todo-comments").setup({})
	end,
}
