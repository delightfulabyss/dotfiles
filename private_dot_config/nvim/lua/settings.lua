local o = vim.o
local wo = vim.wo
local g = vim.g

-- Set highlight on search
o.hlsearch = false

-- Make line numbers default
wo.number = true

-- Enable relative line numbers
o.relativenumber = true

-- Enable mouse mode
o.mouse = "a"

-- Enable break indent
o.breakindent = true

-- Save undo history
o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
o.ignorecase = true
o.smartcase = true

-- Decrease update time
o.updatetime = 250
wo.signcolumn = "yes"

-- Set colorscheme
o.termguicolors = true
vim.cmd([[colorscheme tokyonight-moon]])

-- Set completeopt to have a better completion experience
o.completeopt = "menuone,noselect"

-- Set shiftwidth and tabstop
o.shiftwidth = 1
o.tabstop = 2

--Set line wrapping
o.wrap = true

--Set code folding
o.foldenable = false
wo.foldmethod = "expr"
wo.foldexpr = "nvim_treesitter#foldexpr()"

--Global diagnostic configuration
vim.diagnostic.config({
	underline = true,
	signs = true,
	virtual_text = false,
	float = {
		show_header = true,
		source = "always",
		border = "rounded",
		focusable = false,
	},
	update_in_insert = false, -- default to false
	severity_sort = false, -- default to false
})
