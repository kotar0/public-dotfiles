-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local vim = vim

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  command = "set nopaste",
})

-- Disable the concealing in some file formats
-- The default conceallevel is 3 in LazyVim
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "json", "jsonc", "markdown" },
  callback = function()
    vim.opt.conceallevel = 0
  end,
})

-- Restore the laste session on LazyVimStarted
vim.api.nvim_create_autocmd("User", {
  pattern = "BufReadPre",
  callback = function()
    require("persistence").load({ last = true })
  end,
})

-- Force IME to ABC mode on change modes
local function switch_to_abc()
  vim.fn.system("im-select com.apple.keylayout.ABC")
end

vim.api.nvim_create_autocmd({ "InsertLeave", "CmdlineLeave", "VimEnter", "FocusGained" }, {
  pattern = "*",
  callback = function()
    switch_to_abc()
  end,
})
