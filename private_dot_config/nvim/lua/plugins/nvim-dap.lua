return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"theHamsta/nvim-dap-virtual-text",
		"nvim-telescope/telescope-dap.nvim",
		"jayp0521/mason-nvim-dap.nvim",
	},
	config = function()
		-- debugging
		require("mason-nvim-dap").setup({
			ensure_installed = { "codelldb", "js-debug-adapter" },
			automatic_installation = true,
			automatic_setup = true,
		})

		require("mason-nvim-dap").setup_handlers()

		local dap = require("dap")
		dap.configurations.lua = {
			{
				type = "nlua",
				request = "attach",
				name = "Attach to running Neovim instance",
			},
		}

		dap.adapters.nlua = function(callback, config)
			callback({ type = "server", host = config.host or "127.0.0.1", port = config.port or 8086 })
		end
		require("nvim-dap-virtual-text").setup()
	end,
}
