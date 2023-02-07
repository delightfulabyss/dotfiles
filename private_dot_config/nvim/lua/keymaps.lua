-- See `:help vim.keymap.set()`
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
				callback = function()
					vim.highlight.on_yank()
				end,
				group = highlight_group,
				pattern = "*",
})

-- Buffers
vim.keymap.set("n", "<leader>c", ":bd<CR>", { silent = true }) -- Close buffer
vim.keymap.set("n", "<leader>p", ":bp<CR>", { silent = true }) -- Previous buffer
vim.keymap.set("n", "<leader>n", ":bn<CR>", { silent = true }) -- Next buffer
vim.keymap.set("n", "<leader>.", function()
	vim.api.nvim_command("botright vs")
	vim.api.nvim_command("enew")
	vim.api.nvim_command("file Scratch")
	vim.api.nvim_command("setlocal buftype=nofile")
	vim.api.nvim_command("setlocal bufhidden=wipe")
	vim.api.nvim_command("setlocal noswapfile")
end) --Open scratch buffer

-- Windows:
--Navigation
vim.keymap.set({ "n", "v" }, "<leader>h", "<C-w>h")
vim.keymap.set({ "n", "v" }, "<leader>j", "<C-w>j")
vim.keymap.set({ "n", "v" }, "<leader>k", "<C-w>k")
vim.keymap.set({ "n", "v" }, "<leader>l", "<C-w>l")

--Splits
vim.keymap.set({ "n", "v" }, "<leader>wv", "<C-w>s")
vim.keymap.set({ "n", "v" }, "<leader>wh", "<C-w>v")

--Rotate
vim.keymap.set({ "n", "v" }, "<leader>wr", "<C-w>r")
vim.keymap.set({ "n", "v" }, "<leader>wR", "<C-w>R")

--Swap
vim.keymap.set({ "n", "v" }, "<leader>wx", "<C-w>x")
vim.keymap.set({ "n", "v" }, "<leader>wX", "<C-w>X")

--Change layout
vim.keymap.set({ "n", "v" }, "<leader>wH", "<C-w>H")
vim.keymap.set({ "n", "v" }, "<leader>wJ", "<C-w>J")
vim.keymap.set({ "n", "v" }, "<leader>wK", "<C-w>K")
vim.keymap.set({ "n", "v" }, "<leader>wL", "<C-w>L")

--Resize
vim.keymap.set({ "n", "v" }, "<leader>=", "<C-w>=")
vim.keymap.set({ "n", "v" }, "<leader><", "<C-w><")
vim.keymap.set({ "n", "v" }, "<leader>>", "<C-w>>")
vim.keymap.set({ "n", "v" }, "<leader>+", "<C-w>+")
vim.keymap.set({ "n", "v" }, "<leader>-", "<C-w>-")

--Open tag in new window
vim.keymap.set({ "n", "v" }, "<leader>]", "<C-w>]")

--Preview tag in new window
vim.keymap.set({ "n", "v" }, "<leader>}", "<C-w>}")

-- See `:help telescope.builtin`
vim.keymap.set("n", "<leader><space>", require("telescope.builtin").buffers, { desc = "[ ] Find existing buffers" })
vim.keymap.set("n", "<leader>/", function()
	-- You can pass additional configuration to telescope to change theme, layout, etc.
	require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
					winblend = 10,
					previewer = true,
	}))
end, { desc = "[/] Fuzzily search in current buffer]" })
vim.keymap.set("n", "<leader>sf", function()
	require("telescope.builtin").find_files({ hidden = true, no_ignore = true })
end, { desc = "[S]earch [F]iles" })
vim.keymap.set("n", "<leader>sr", require("telescope.builtin").oldfiles, { desc = "[S]earch [R]ecent Files" })
vim.keymap.set("n", "<leader>sh", require("telescope.builtin").help_tags, { desc = "[S]earch [H]elp" })
vim.keymap.set("n", "<leader>sw", require("telescope.builtin").grep_string, { desc = "[S]earch current [W]ord" })
vim.keymap.set("n", "<leader>sg", require("telescope.builtin").live_grep, { desc = "[S]earch by [G]rep" })
vim.keymap.set("n", "<leader>sd", require("telescope.builtin").diagnostics, { desc = "[S]earch [D]iagnostics" })
vim.keymap.set("n", "<leader>sm", require("telescope.builtin").marks, { desc = "[S]earch [M]arks" })
vim.keymap.set("n", "<leader>sf", require("telescope.builtin").find_files, { desc = "[S]earch CWD [f]iles" })
vim.keymap.set("n", "<leader>sF", require("telescope.builtin").git_files, { desc = "[S]earch Git [F]iles" })
vim.keymap.set("n", "<leader>sc", require("telescope.builtin").git_commits, { desc = "[S]earch Git [C]ommits" })
vim.keymap.set("n", "<leader>sb", require("telescope.builtin").git_branches, { desc = "[S]earch Git [B]ranches" })
vim.keymap.set("n", "<leader>ss", require("telescope.builtin").git_stash, { desc = "[S]earch Git [S]tashes" })
vim.keymap.set("n", "<leader>st", require("telescope").extensions.http.list, { desc = "[S]earch h[T]tp Codes" })
vim.keymap.set("n", "<leader>sl", ":Telescope software-licenses find<CR>", { desc = "[S]earch Software [L]icenses" })
vim.keymap.set(
				"n",
				"<leader>sM",
				require("telescope").extensions.media_files.media_files,
				{ desc = "[S]earch [M]edia Files" }
)
vim.keymap.set("n", "<leader>sk", require("telescope.builtin").keymaps, { desc = "[S]earch [K]eymaps" })

-- Diagnostic keymaps
vim.keymap.set("n", "dp", vim.diagnostic.goto_prev)
vim.keymap.set("n", "dn", vim.diagnostic.goto_next)
vim.keymap.set("n", "do", function()
	vim.diagnostic.open_float({ scope = "line" })
end)

--Silicon

-- Generate image of lines in a visual selection
vim.keymap.set("v", "<Leader>i", function()
	require("silicon").visualise_api({})
end)
-- -- Generate image of a whole buffer, with lines in a visual selection highlighted
vim.keymap.set("v", "<Leader>ib", function()
	require("silicon").visualise_api({ show_buf = true })
end)
-- Generate visible portion of a buffer
vim.keymap.set("n", "<Leader>i", function()
	require("silicon").visualise_api({ visible = true })
end)
-- Generate current buffer line in normal mode
vim.keymap.set("n", "<Leader>ib", function()
	require("silicon").visualise_api({})
end)

--ZenMode
vim.keymap.set({ "n", "v" }, "<Leader>z", ":ZenMode<CR>", { silent = true })

--ChatGPT
vim.keymap.set({ "n", "v" }, "<Leader>ai", ":ChatGPT<CR>", { silent = true })
vim.keymap.set({ "n", "v" }, "<Leader>aip", ":ChatGPTActAs<CR>", { silent = true })
vim.keymap.set({ "n", "v" }, "<Leader>aic", ":ChatGPTEditWithInstructions<CR>", { silent = true })

--Tmux Navigator
vim.keymap.set({ "n", "t" }, "<C-h>", ":NavigatorLeft<CR>", { silent = true })
vim.keymap.set({ "n", "t" }, "<C-l>", ":NavigatorRight<CR>", { silent = true })
vim.keymap.set({ "n", "t" }, "<C-k>", ":NavigatorUp<CR>", { silent = true })
vim.keymap.set({ "n", "t" }, "<C-j>", ":NavigatorDown<CR>", { silent = true })
vim.keymap.set({ "n", "t" }, "<C-p>", ":NavigatorPrevious<CR>", { silent = true })

--Oil File Explorer
vim.keymap.set({ "n", "v" }, "<Leader>e", ":Oil<CR>", { silent = true })

--Dap
vim.keymap.set("n", "<F5>", function()
	require("dap").continue()
end)
vim.keymap.set("n", "<F10>", function()
	require("dap").step_over()
end)
vim.keymap.set("n", "<F11>", function()
	require("dap").step_into()
end)
vim.keymap.set("n", "<F12>", function()
	require("dap").step_out()
end)
vim.keymap.set("n", "<leader>b", function()
	require("dap").toggle_breakpoint()
end)
vim.keymap.set("n", "<leader>B", function()
	require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
end)
vim.keymap.set("n", "<leader>lp", function()
	require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
end)

vim.keymap.set("n", "<leader>dr", function()
	require("dap").repl.open()
end)
vim.keymap.set("n", "<leader>dl", function()
	require("dap").run_last()
end)
vim.keymap.set("n", "<leader>db", function()
	require("dapui").toggle()
end)

-- Git (Fugitive + Git Signs)
vim.keymap.set("n", "<leader>gs", ":Git<CR>", { silent = true })
vim.keymap.set("n", "<leader>gd", ":Gdiffsplit<CR>", { silent = true })
vim.keymap.set("n", "<leader>gl", ":Git log<CR>", { silent = true })
vim.keymap.set("n", "<leader>gM", ":Git mergetool<CR>", { silent = true })
vim.keymap.set("n", "<leader>gr", ":Gread<CR>", { silent = true })
vim.keymap.set("n", "<leader>gw", ":Gwrite<CR>", { silent = true })
vim.keymap.set("n", "<leader>gx", ":GDelete<CR>", { silent = true })

--Trouble
vim.keymap.set("n", "<leader>xx", ":TroubleToggle<CR>", { silent = true })
vim.keymap.set("n", "<leader>xw", ":TroubleToggle workspace_diagnostics<CR>", { silent = true })
vim.keymap.set("n", "<leader>xd", ":TroubleToggle document_diagnostics<CR>", { silent = true })
vim.keymap.set("n", "<leader>xl", ":TroubleToggle loclist<CR>", { silent = true })
vim.keymap.set("n", "<leader>xq", ":TroubleToggle quickfix<CR>", { silent = true })
vim.keymap.set("n", "<leader>xr", ":TroubleToggle lsp_references<CR>", { silent = true })
vim.keymap.set("n", "<leader>xD", ":TroubleToggle lsp_definitions<CR>", { silent = true })
vim.keymap.set("n", "<leader>xt", ":TroubleToggle lsp_type_definitions<CR>", { silent = true })

--Neotest
vim.keymap.set("n", "<leader>tr", require("neotest").run.run, { silent = true })
vim.keymap.set("n", "<leader>tw", function()
	require("neotest").run.run({ jestCommand = "jest --watch" })
end, { silent = true })
vim.keymap.set("n", "<leader>td", function()
	require("neotest").run.run({ strategy = "dap" })
end, { silent = true })
vim.keymap.set("n", "<leader>tf", function()
	require("neotest").run.run(vim.fn.expand("%"))
end, { silent = true })
vim.keymap.set("n", "<leader>ts", require("neotest").run.stop, { silent = true })
vim.keymap.set("n", "<leader>ta", require("neotest").run.attach, { silent = true })
