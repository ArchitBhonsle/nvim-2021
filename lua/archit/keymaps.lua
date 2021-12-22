local k = function(mode, from, to) vim.api.nvim_set_keymap(mode, from, to, { noremap = true, silent = true }) end
local tk = function(mode, from, to) vim.api.nvim_set_keymap(mode, from, to, { silent = true }) end

-- setting the leader
k("", "<Space>", "<Nop>")
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
k("n", "<C-Up>", ":resize -2<CR>")
k("n", "<C-Down>", ":resize +2<CR>")
k("n", "<C-Left>", ":vertical resize -2<CR>")
k("n", "<C-Right>", ":vertical resize +2<CR>")

-- buffer navigation
k("n", "<A-]>", ":bnext<CR>")
k("n", "<A-[>", ":bprevious<CR>")

-- move text
k("n", "<A-j>", ":move .+1<CR>==")
k("n", "<A-k>", ":move .-2<CR>==")
k("i", "<A-j>", "<ESC>:move .+1<CR>==gi")
k("i", "<A-k>", "<ESC>:move .-2<CR>==gi")
k("v", "<A-j>", ":move '>+1<CR>gv=gv")
k("v", "<A-k>", ":move '<-2<CR>gv=gv")

-- stay in visual mode after indenting
k("v", "<", "<gv")
k("v", ">", ">gv")
