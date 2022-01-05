require("auto-session").setup()
require("session-lens").setup()

require("which-key").register({
	s = { "<cmd>SearchSession<cr>", "search sessions" },
	S = {
		name = "sessions",
		s = { "<cmd>SaveSession<cr>", "save session" },
		r = { "<cmd>RestoreSession<cr>", "restore session" },
		d = { "<cmd>DeleteSession<cr>", "delete session" },
	},
}, {
	prefix = "<leader>",
	nowait = true,
})
