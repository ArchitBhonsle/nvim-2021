require("toggleterm").setup({
	open_mapping = "<C-\\>",
	size = function(term)
		if term.direction == "horizontal" then
			return 15
		elseif term.direction == "vertical" then
			return vim.o.columns * 0.4
		end
	end,
	direction = "float",
	float_opts = {
		border = "single",
		width = math.floor(vim.o.columns * 0.9),
		height = math.floor(vim.o.lines * 0.8),
		winblend = 15,
	},
})

require("which-key").register({
	["\\"] = { "<cmd>ToggleTerm direction=horizontal<cr>", "floating terminal" },
	["|"] = { "<cmd>ToggleTerm direction=vertical<cr>", "horizontal terminal" },
}, {
	prefix = "<leader>",
	nowait = true,
})
