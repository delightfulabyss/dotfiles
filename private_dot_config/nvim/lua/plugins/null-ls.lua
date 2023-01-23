return {
	"jose-elias-alvarez/null-ls.nvim",
	config = function()
		local null_ls_status_ok, null_ls = pcall(require, "null-ls")
		if not null_ls_status_ok then
			return
		end

		local code_actions = null_ls.builtins.code_actions
		local completion = null_ls.builtins.completion
		local diagnostics = null_ls.builtins.diagnostics
		local formatting = null_ls.builtins.formatting

		null_ls.setup({
			sources = {
				code_actions.eslint_d,
				code_actions.gitsigns,
				completion.luasnip,
				diagnostics.eslint_d,
				diagnostics.jsonlint,
				diagnostics.luacheck,
				diagnostics.markdownlint,
				diagnostics.solhint,
				diagnostics.stylelint,
				diagnostics.yamllint,
				formatting.eslint_d,
				formatting.fixjson,
				formatting.stylua,
				formatting.prettierd,
				formatting.markdownlint,
				formatting.rustfmt,
				formatting.stylelint,
				formatting.yamlfmt,
			},
		})
	end,
}
