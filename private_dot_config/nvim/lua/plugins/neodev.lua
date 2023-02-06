return {
	"folke/neodev.nvim",
	ft = "lua",
	config = function()
		require("neodev").setup({
			library = { plugins = { "neotest" }, types = true },
		})
	end,
}
