return {
				"nvim-telescope/telescope.nvim",
				branch = "0.1.x",
				dependencies = { "nvim-lua/plenary.nvim" },
				cmd = "Telescope",
				config = function()
					local trouble = require("trouble.providers.telescope")
					require("telescope").setup({
									defaults = {
													mappings = {
																	i = {
																					["<C-t>"] = trouble.open_with_trouble,
																	},
																	n = {
																					["<C-t>"] = trouble.open_with_trouble,
																	},
													},
									},
					})

					local extensions = { "fzf", "http", "software-license", "media_files", "symbols" }

					for k, v in ipairs(extensions) do
						pcall(require("telescope").load_extension, v)
					end
				end,
}
