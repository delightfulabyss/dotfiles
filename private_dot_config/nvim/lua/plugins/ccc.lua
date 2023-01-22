return 	{
		"uga-rosa/ccc.nvim",
		cmd = { "CccPick", "CccConvert", "CccHighlighterToggle", "CccHighlighterEnable", "CccHighlighterDisable" },
		config = function()
		require("ccc").setup{}
		end
	}
