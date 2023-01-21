-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local lazy = require("lazy")
lazy.setup({
	{ -- LSP Configuration & Plugins
		"neovim/nvim-lspconfig",
		dependencies = {
			-- Automatically install LSPs to stdpath for neovim
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",

			-- Useful status updates for LSP
			"j-hui/fidget.nvim",
		},
	},

	{ -- Autocompletion
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-nvim-lua",
			"roobert/tailwindcss-colorizer-cmp.nvim",
		},
	},

	{ -- Highlight, edit, and navigate code
		"nvim-treesitter/nvim-treesitter",
		build = function()
			pcall(require("nvim-treesitter.install").update({ with_sync = true }))
		end,
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
	},

	-- Git related plugins
	"lewis6991/gitsigns.nvim",
	{
		"pwntester/octo.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
			"nvim-tree/nvim-web-devicons",
		},
	},
	"nvim-lualine/lualine.nvim", -- Fancier statusline
	"lukas-reineke/indent-blankline.nvim", -- Add indentation guides even on blank lines
	"numToStr/Comment.nvim", -- "gc" to comment visual regions/lines

	-- Fuzzy Finder (files, lsp, etc)
	{ "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } },

	-- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make", cond = vim.fn.executable("make") == 1 },

	-- Leap.nvim efficient naviation
	{
		"ggandor/leap.nvim",
		event = "BufRead",
		dependencies = "tpope/vim-repeat",
		config = function()
			require("leap").add_default_mappings()
		end,
	},

	-- Markdown
	{ "jakewvincent/mkdnflow.nvim" },

	-- Registers
	{ "tversteeg/registers.nvim" },

	-- Booleans
	{ "https://github.com/nat-418/boole.nvim" },

	-- Color picker
	{ "uga-rosa/ccc.nvim" },

	{
		"narutoxy/silicon.lua",
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	{ "hlucco/nvim-eswpoch" },
	{ "folke/zen-mode.nvim" },
	{ "jbyuki/one-small-step-for-vimkind" },
	{ "nanotee/luv-vimdocs" },
	{ "xorid/asciitree.nvim" },
	{
		"folke/todo-comments.nvim",
		dependencies = "nvim-lua/plenary.nvim",
	},
	{
		"jackMort/ChatGPT.nvim",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
		},
	},
	{ "stevearc/overseer.nvim" },
	{ "Weissle/persistent-breakpoints.nvim" },
	{ "folke/tokyonight.nvim" },
	{ "brenoprata10/nvim-highlight-colors" },
	{
		"goolord/alpha-nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	{ "edluffy/specs.nvim" },
	{ "numToStr/Navigator.nvim" },
	{ "windwp/nvim-autopairs" },
	{ "folke/which-key.nvim" },
	{ "rafamadriz/friendly-snippets" },
	{ "mfussenegger/nvim-dap" },
	{ "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap" } },
	{ "theHamsta/nvim-dap-virtual-text" },
	{ "nvim-telescope/telescope-dap.nvim" },
	{ "jayp0521/mason-nvim-dap.nvim", dependencies = { "mfussenegger/nvim-dap", "williamboman/mason.nvim" } },
	{ "mxsdev/nvim-dap-vscode-js", dependencies = { "mfussenegger/nvim-dap" } },
	{ "RRethy/vim-illuminate" },
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	"jose-elias-alvarez/null-ls.nvim",
	{ "barrett-ruth/telescope-http.nvim" },
	{ "chip/telescope-software-licenses.nvim" },
	{ "nvim-telescope/telescope-media-files.nvim" },
	{ "nvim-telescope/telescope-symbols.nvim" },
	{ "mrjones2014/nvim-ts-rainbow" },
	{ "chentoast/marks.nvim" },
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"antoinemadec/FixCursorHold.nvim",
		},
	},
	{ "stevearc/oil.nvim" },
	{ "psliwka/vim-smoothie" },
	{ "tpope/vim-fugitive" },
	{ "lewis6991/impatient.nvim" },
	{ "Exafunction/codeium.vim" },
})
-- { "Tastyep/structlog.nvim" })
-- {
--   "SmiteshP/nvim-navic",
--   requires = "neovim/nvim-lspconfig"
-- })
