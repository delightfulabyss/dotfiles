return {
	"Exafunction/codeium.vim",
	event = "BufEnter",
	config = function()
		-- Change '<C-g>' here to any keycode you like.
		vim.keymap.set("i", "<C-g>", function()
			vim.fn["codeium#Accept"]()
		end, { expr = true })
		vim.keymap.set("i", "<C-;>", function()
			vim.fn["codeium#CycleCompletions"](1)
		end, { expr = true })
		vim.keymap.set("i", "<C-,>", function()
			vim.fn["codeium#CycleCompletions"](-1)
		end, { expr = true })
		vim.keymap.set("i", "<C-x>", function()
			vim.fn["codeium#Clear"]()
		end, { expr = true })
	end,
}
