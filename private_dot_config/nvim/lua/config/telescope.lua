-- See `:help telescope` and `:help telescope.setup()`
require("telescope").setup({
	defaults = {
		mappings = {
			i = {
				["<C-u>"] = false,
				["<C-d>"] = false,
			},
		},
	},
})

local extensions = { "fzf", "http", "software-license", "media_files", "symbols" }

for k, v in ipairs(extensions) do
	pcall(require("telescope").load_extension, v)
end
