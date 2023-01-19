local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")
local Job = require("plenary.job")
-- local http = require("socket.http")
dashboard.section.header.val = {
	[[                                                 ]],
	[[                                                 ]],
	[[                               __                ]],
	[[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
	[[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
	[[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
	[[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
	[[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
	[[                                                 ]],
	[[                                                 ]],
	[[                                                 ]],
	[[                                                 ]],
}
dashboard.section.buttons.val = {
	dashboard.button("e", "✨  New file", ":ene <BAR> startinsert <CR>"),
	dashboard.button("f", "🔍  Find file", ":Telescope find_files hidden=true no_ignore=false<CR>"),
	dashboard.button("r", "📅  Open recent file", ":Telescope oldfiles<CR>"),
	dashboard.button("t", "📜  Find text", ":Telescope live_grep<CR>"),
	dashboard.button("c", "⚙️  Open config", ":e $MYVIMRC<CR>"),
}

local footer

Job:new({
	command = "http",
	args = { "GET", "https://stoicquotesapi.com/v1/api/quotes/random" },
	cwd = "~/",
	env = {},
	on_stdout = function(err, data)
		if err then
			dashboard.section.footer.val = err
		else
			dashboard.section.header.val = data.body
		end
	end,
})
dashboard.config.opts.noautocmd = true
vim.cmd([[autocmd User AlphaReady echo 'ready']])

alpha.setup(dashboard.config)
