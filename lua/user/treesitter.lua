local ts_configs = require("nvim-treesitter.configs")

ts_configs.setup({
	ensure_installed = "maintained",
	sync_install = false,
	autopairs = { enable = true },
	highlight = { enable = true },
	indent = { enable = true },
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
})
