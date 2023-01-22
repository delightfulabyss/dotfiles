return {
"nvim-lualine/lualine.nvim",
config = function()
require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = "auto",
		component_separators = "|",
		section_separators = "",
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = { "filename" },
		lualine_x = { "filetype" },
		lualine_y = { "location" },
		lualine_z = { "progress" },
	},
end
})
}
