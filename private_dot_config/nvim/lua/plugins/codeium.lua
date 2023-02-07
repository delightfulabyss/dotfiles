return {
				"Exafunction/codeium.vim",
				config = function()
					-- Change '<C-g>' here to any keycode you like.
					vim.keymap.set("i", "<C-g>", function()
						return vim.fn["codeium#Accept"]()
					end)
					vim.keymap.set("i", "<c-;>", function()
						return vim.fn["codeium#CycleCompletions"](1)
					end)
					vim.keymap.set("i", "<c-,>", function()
						return vim.fn["codeium#CycleCompletions"]( -1)
					end)
					vim.keymap.set("i", "<c-x>", function()
						return vim.fn["codeium#Clear"]()
					end)
				end,
}
