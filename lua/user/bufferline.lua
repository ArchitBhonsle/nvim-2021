local bufferline = require("bufferline")

bufferline.setup({})

local k = require("user.utils").keymap
k("n", "<S-l>", ":BufferLineCycleNext<CR>")
k("n", "<S-h>", ":BufferLineCyclePrev<CR>")

require("which-key").register({
	name = "buffer",
	n = { "<cmd>BufferLineCycleNext<cr>", "next buffer" },
	p = { "<cmd>BufferLineCyclePrev<cr>", "previous buffer" },
	x = { "<cmd>bdelete!<cr>", "close current buffer" },
}, {
	prefix = "<leader>b",
	nowait = true,
})
