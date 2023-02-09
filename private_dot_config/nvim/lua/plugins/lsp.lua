--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(_, bufnr)
	-- NOTE: Remember that lua is a real programming language, and as such it is possible
	-- to define small helper and utility functions so you don't have to repeat yourself
	-- many times.
	--
	-- In this case, we create a function that lets us more easily define mappings specific
	-- for LSP related items. It sets the mode, buffer and description for us each time.
	local nmap = function(keys, func, desc)
		if desc then
			desc = "LSP: " .. desc
		end

		vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
	end

	nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
	nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

	nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
	nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
	nmap("gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
	nmap("gt", vim.lsp.buf.type_definition, "Type [D]efinition")
	nmap("gs", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
	nmap("gS", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

	-- See `:help K` for why this keymap
	nmap("K", vim.lsp.buf.hover, "Hover Documentation")
	nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")

	-- Lesser used LSP functionality
	nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

	-- format function based on what is availale in the lsp
	local formatfunc = function()
		if vim.lsp.buf.format then
			vim.lsp.buf.format()
		elseif vim.lsp.buf.formatting then
			vim.lsp.buf.formatting()
		end
	end

	-- Create a command `:Format` local to the LSP buffer
	vim.api.nvim_buf_create_user_command(bufnr, "Format", formatfunc, { desc = "Format current buffer with LSP" })

	-- Enable format on save
	vim.api.nvim_create_autocmd("BufWritePre", {
					pattern = "*",
					callback = function()
						formatfunc()
					end,
	})
end

return {
				-- LSP Configuration & Plugins
				"neovim/nvim-lspconfig",
				dependencies = {
								-- Automatically install LSPs to stdpath for neovim
								"williamboman/mason.nvim",
								"williamboman/mason-lspconfig.nvim",

								-- Useful status updates for LSP
								"j-hui/fidget.nvim",
				},
				config = function()
					-- Setup mason so it can manage external tooling
					require("mason").setup()
					-- Enable the following language servers
					-- Feel free to add/remove any LSPs that you want here. They will automatically be installed
					local servers =
					{ "cssls", "rust_analyzer", "solidity", "tsserver", "tailwindcss", "sumneko_lua", "emmet_ls", "ltex-ls" }

					-- Ensure the servers above are installed
					require("mason-lspconfig").setup({
									ensure_installed = servers,
					})

					-- nvim-cmp supports additional completion capabilities
					local lspconfig = require("lspconfig")
					local configs = require("lspconfig/configs")
					local util = require("lspconfig/util")

					local capabilities = vim.lsp.protocol.make_client_capabilities()
					require("lspconfig").capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
					capabilities.textDocument.completion.completionItem.snippetSupport = true
					for _, lsp in ipairs(servers) do
						lspconfig[lsp].setup({
										on_attach = on_attach,
										capabilities = capabilities,
						})
					end

					-- Turn on lsp status information
					require("fidget").setup()

					-- Make runtime files discoverable to the server
					local runtime_path = vim.split(package.path, ";")
					table.insert(runtime_path, "lua/?.lua")
					table.insert(runtime_path, "lua/?/init.lua")
				end,
}
