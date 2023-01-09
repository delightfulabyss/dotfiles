local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")
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
	[[           He who is brave, is free.             ]],
	[[                  --Seneca                       ]],
}
dashboard.section.buttons.val = {
	dashboard.button("e", "✨  New file", ":ene <BAR> startinsert <CR>"),
	dashboard.button("f", "🔍  Find file", ":Telescope find_files hidden=true no_ignore=false<CR>"),
	dashboard.button("r", "📅  Open recent file", ":Telescope oldfiles<CR>"),
	dashboard.button("t", "📜  Find text", ":Telescope live_grep<CR>"),
	dashboard.button("c", "⚙️  Open config", ":e $MYVIMRC<CR>"),
}

-- local randomId = math.random(1, 1000)
-- local response = http.request("stoic-api.vercel.app/api/quote", {
-- 	method = "GET",
-- 	body = randomId,
-- })
-- dashboard.section.footer.val = response
dashboard.config.opts.noautocmd = true
vim.cmd([[autocmd User AlphaReady echo 'ready']])

alpha.setup(dashboard.config)
