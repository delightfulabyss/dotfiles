return {
	"jcdickinson/codeium.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"hrsh7th/nvim-cmp",
	},
	event = "BufEnter",
	config = function()
		require("codeium").setup({})
	end,
}
