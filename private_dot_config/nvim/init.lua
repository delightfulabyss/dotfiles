-- import main settings & plugins
require("keymaps") -- custom keymaps / shortcuts
require("plugins") -- list of plugins
require("settings") -- main vim / neovim settings

-- setup config for plugins

require("nvim-highlight-colors").setup({}) -- highlight colors
require("config.gitsigns") -- gitsigns settings
require("octo") -- github
require("config.indent_blankline") -- indent_blankline settings
require("config.lsp") -- lsp settings
require("config.dap") --debugging
require("config.telescope") -- telescope settings
require("config.treesitter") -- treesitter settings
require("config.lualine") -- lualine settings
require("Comment").setup() -- comment selected code by g+c
require("config.alpha") -- startup splashscreen
require("config.specs") -- smooth cursor
require("config.nvim-cmp") -- autocompletion settings
require("cmp") -- autocompletion
require("config.mkdnflow") --better markdown
require("config.registers") -- better registers
require("config.boole") -- toggle booleans
require("ccc").setup() -- color picker
require("config.silicon") --silicon screenshots
require("config.zen-mode") --zen-mode
require("todo-comments").setup() --todo comments
require("chatgpt").setup() --chatgpt
require("overseer").setup() -- task runner
-- -- require('config.persistent-breakpoints') --persistent breakpoints
require("Navigator").setup() -- vim <> tmux
require("nvim-autopairs").setup() -- auto close pairs
require("config.which-key") -- keymap legend
require("bufferline").setup() --snazzy bufferline
require("trouble").setup() -- trouble list
require("config.null-ls") -- formatting and linting
require("marks").setup() -- better marks experience
require("config.oil") -- file explorer
-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
