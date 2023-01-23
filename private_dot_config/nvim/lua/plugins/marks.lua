return {
	"chentoast/marks.nvim",
	event = "BufEnter",
	config = function()
		require("marks").setup({})
	end,
}
