-- Install packer
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	is_bootstrap = true
	vim.fn.execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
	vim.cmd([[packadd packer.nvim]])
end

local packer = require("packer")

packer.startup(function(use, use_rocks)
	-- Package manager
	use("wbthomason/packer.nvim")

	use({ -- LSP Configuration & Plugins
		"neovim/nvim-lspconfig",
		requires = {
			-- Automatically install LSPs to stdpath for neovim
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",

			-- Useful status updates for LSP
			"j-hui/fidget.nvim",
		},
	})

	use({ -- Autocompletion
		"hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/cmp-nvim-lsp",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-nvim-lua",
		},
	})

	use({ -- Highlight, edit, and navigate code
		"nvim-treesitter/nvim-treesitter",
		run = function()
			pcall(require("nvim-treesitter.install").update({ with_sync = true }))
		end,
	})

	use({ -- Additional text objects via treesitter
		"nvim-treesitter/nvim-treesitter-textobjects",
		after = "nvim-treesitter",
	})

	-- Git related plugins
	use("lewis6991/gitsigns.nvim")
	use({
		"pwntester/octo.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
			"kyazdani42/nvim-web-devicons",
		},
	})
	use("nvim-lualine/lualine.nvim") -- Fancier statusline
	use("lukas-reineke/indent-blankline.nvim") -- Add indentation guides even on blank lines
	use("numToStr/Comment.nvim") -- "gc" to comment visual regions/lines

	-- Fuzzy Finder (files, lsp, etc)
	use({ "nvim-telescope/telescope.nvim", branch = "0.1.x", requires = { "nvim-lua/plenary.nvim" } })

	-- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make", cond = vim.fn.executable("make") == 1 })

	-- Leap.nvim efficient naviation
	use({
		"ggandor/leap.nvim",
		event = "BufRead",
		requires = "tpope/vim-repeat",
		config = function()
			require("leap").add_default_mappings()
		end,
	})

	-- Markdown
	use({ "jakewvincent/mkdnflow.nvim" })

	-- Registers
	use({ "tversteeg/registers.nvim" })

	-- Booleans
	use({ "https://github.com/nat-418/boole.nvim" })

	-- Color picker
	use({ "uga-rosa/ccc.nvim" })

	use({
		"narutoxy/silicon.lua",
		requires = { "nvim-lua/plenary.nvim" },
	})

	use({ "hlucco/nvim-eswpoch" })
	use({ "folke/zen-mode.nvim" })
	use({ "jbyuki/one-small-step-for-vimkind" })
	use({ "nanotee/luv-vimdocs" })
	use({ "xorid/asciitree.nvim" })
	use({
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
	})
	use({
		"jackMort/ChatGPT.nvim",
		requires = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
		},
	})
	use({ "stevearc/overseer.nvim" })
	use({ "Weissle/persistent-breakpoints.nvim" })
	use({ "folke/tokyonight.nvim" })
	use({ "brenoprata10/nvim-highlight-colors" })
	use({
		"goolord/alpha-nvim",
		requires = { "nvim-tree/nvim-web-devicons" },
	})
	use({ "edluffy/specs.nvim" })
	use({ "numToStr/Navigator.nvim" })
	use({ "windwp/nvim-autopairs" })
	use({ "folke/which-key.nvim" })
	use({ "akinsho/bufferline.nvim", tag = "v3.*", requires = "nvim-tree/nvim-web-devicons" })
	use({ "rafamadriz/friendly-snippets" })
	use({ "mfussenegger/nvim-dap" })
	use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })
	use({ "theHamsta/nvim-dap-virtual-text" })
	use({ "nvim-telescope/telescope-dap.nvim" })
	use({ "jayp0521/mason-nvim-dap.nvim", requires = { "mfussenegger/nvim-dap", "williamboman/mason.nvim" } })
	use({ "mxsdev/nvim-dap-vscode-js", requires = { "mfussenegger/nvim-dap" } })
	use({ "RRethy/vim-illuminate" })
	use({
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
	})
	use("jose-elias-alvarez/null-ls.nvim")
	use({ "barrett-ruth/telescope-http.nvim" })
	use({ "chip/telescope-software-licenses.nvim" })
	use({ "nvim-telescope/telescope-media-files.nvim" })
	use({ "nvim-telescope/telescope-symbols.nvim" })
	use({ "mrjones2014/nvim-ts-rainbow" })
	use({ "chentoast/marks.nvim" })
	use({
		"nvim-neotest/neotest",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"antoinemadec/FixCursorHold.nvim",
		},
	})
	use({ "stevearc/oil.nvim" })
	use({ "ur4ltz/surround.nvim" })
	use({ "psliwka/vim-smoothie" })
	if is_bootstrap then
		packer.sync()
	end
end)

-- When we are bootstrapping a configuration, it doesn't
-- make sense to execute the rest of the init.lua.
--
-- You'll need to restart nvim, and then it will work.
if is_bootstrap then
	print("==================================")
	print("    Plugins are being installed")
	print("    Wait until Packer completes,")
	print("       then restart nvim")
	print("==================================")
	return
end

-- Add commands for installing luarocks packages
require("packer.luarocks").install_commands()

-- Automatically source and re-compile packer whenever you save this init.lua
local packer_group = vim.api.nvim_create_augroup("Packer", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
	command = "source <afile> | PackerCompile",
	group = packer_group,
	pattern = vim.fn.expand("$MYVIMRC"),
})

-- use({ "Tastyep/structlog.nvim" })
-- use({
--   "SmiteshP/nvim-navic",
--   requires = "neovim/nvim-lspconfig"
-- })
