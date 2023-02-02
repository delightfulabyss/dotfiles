return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	event = "BufEnter",
	config = function()
		require("trouble").setup({})
	end,
}
