return {
		"ggandor/leap.nvim",
		event = "BufRead",
		dependencies = "tpope/vim-repeat",
		config = function()
			require("leap").add_default_mappings()
		end,
}
