return 	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		cmd = { "Trouble", "TroubleToggle", "TroubleRefresh", "TroubleClose" },
		config = function ()
		require("trouble").setup{}
		end
}
