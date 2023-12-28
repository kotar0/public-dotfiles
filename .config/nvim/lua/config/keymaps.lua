-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Delete char and back
keymap.set("n", "x", '"_x')

-- Delete line and not copy to register
keymap.set("n", "dd", '"_dd')

-- Delete word
keymap.set("n", "dw", '<Esc>viw"_d')

-- Increment / Decrement
keymap.set("n", "+", "<C-a>")

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")
keymap.set("i", "jk", "C-[", opts)

-- Commenting
keymap.set("n", "<C-/>", "gcc", { remap = true })
keymap.set("v", "<C-/>", "gc", { remap = true })

-- New tab
keymap.set("n", "te", ":tabedit")
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)

-- Disable continuations
keymap.set("n", "<Leader>o", "o<Esc>^Da", opts)
keymap.set("n", "<Leader>O", "O<Esc>^Da", opts)

-- Jumplist
keymap.set("n", "<C-m>", "<C-i>", opts)

-- Split Windows
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)

-- Move window
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")

-- Resize window
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")

-- Copilot
vim.g.copilot_no_tab_map = true

-- Move Window
-- keymap.set("n", "sh", "<C-w>")
--
-- Diagnostics
keymap.set("n", "<C-j>", function()
  vim.diagnostic.goto_next()
end, opts)
