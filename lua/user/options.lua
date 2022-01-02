local options = {
	shell = "/bin/zsh",
	cmdheight = 2,
	completeopt = { "menuone", "preview", "noselect" },
	ignorecase = true,
	smartcase = true,
	mouse = "a",
	pumheight = 10,
	showmode = false,
	showtabline = 2,
	cursorline = true,
	splitbelow = true,
	splitright = true,
	termguicolors = true,
	smartindent = true,
	expandtab = true,
	shiftwidth = 2,
	tabstop = 2,
	timeoutlen = 1000,
	updatetime = 300,
	undofile = true,
	number = true,
	relativenumber = true,
	signcolumn = "yes",
	wrap = false,
	scrolloff = 10,
	sidescrolloff = 5,
	guifont = "JetBrainsMono Nerd Font:h22",
}

require("user.utils").map_set(vim.opt, options)

vim.opt.shortmess:append("c")
vim.opt.whichwrap:append({
	h = true,
	l = true,
	["<"] = true,
	[">"] = true,
	["["] = true,
	["]"] = true,
})
vim.opt.iskeyword:remove("-")

vim.g.neovide_remember_window_size = true
