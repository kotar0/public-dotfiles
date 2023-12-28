-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.mapleader = " "

vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

vim.opt.number = true
vim.opt.relativenumber = false

-- 不可視文字可視化
vim.opt.list = true
vim.opt.listchars = { tab = ">>", trail = "-", nbsp = "+" }

-- Spell check
vim.opt.spell = true
vim.opt.spelllang = "en_us"
