return {
	"jackMort/ChatGPT.nvim",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"nvim-lua/plenary.nvim",
	},
	cmd = { "ChatGPT", "ChatGPTActAs", "ChatGPTEditWithInstructions" },
	config = function()
		require("chatgpt").setup({})
	end,
}
