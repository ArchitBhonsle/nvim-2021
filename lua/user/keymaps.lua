local k = require("user.utils").keymap
local tk = require("user.utils").terminal_keymap

-- setting the leader
k("", "<SPACE>", "<NOP>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- window navigation
k("n", "<C-h>", "<C-w>h")
k("n", "<C-j>", "<C-w>j")
k("n", "<C-k>", "<C-w>k")
k("n", "<C-l>", "<C-w>l")
tk("t", "<C-h>", "<C-\\><C-N><C-w>h")
tk("t", "<C-j>", "<C-\\><C-N><C-w>j")
tk("t", "<C-k>", "<C-\\><C-N><C-w>k")
tk("t", "<C-l>", "<C-\\><C-N><C-w>l")

-- easy resizing
k("n", "<C-UP>", ":resize -2<CR>")
k("n", "<C-DOWN>", ":resize +2<CR>")
k("n", "<C-LEFT>", ":vertical resize -2<CR>")
k("n", "<C-RIGHT>", ":vertical resize +2<CR>")

-- move text
k("n", "<A-f>", ":move .+1<CR>==")
k("n", "<A-d>", ":move .-2<CR>==")
k("i", "<A-f>", "<ESC>:move .+1<CR>==gi")
k("i", "<A-d>", "<ESC>:move .-2<CR>==gi")
k("v", "<A-f>", ":move '>+1<CR>gv=gv")
k("v", "<A-d>", ":move '<-2<CR>gv=gv")

-- stay in visual mode after indenting
k("v", "<", "<gv")
k("v", ">", ">gv")
