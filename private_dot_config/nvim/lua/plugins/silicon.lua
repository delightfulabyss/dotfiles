return {
	"narutoxy/silicon.lua",
	dependencies = { "nvim-lua/plenary.nvim" },
	event = "BufEnter",
	config = function()
		require("silicon").setup({
			output = "/home/matthew/Pictures/Silicon/SILICON_${year}-${month}-${date}-${time}.png",
		})
	end,
}
