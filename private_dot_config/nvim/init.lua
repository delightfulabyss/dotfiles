-- import main settings & plugins
-- Set <space> as the leader key
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
lazy.setup("plugins") -- folder of plugins
require("keymaps") -- custom keymaps / shortcuts
require("settings") -- main vim / neovim settings

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
