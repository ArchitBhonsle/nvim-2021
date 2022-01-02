local comment = require("Comment")

comment.setup({
	toggler = {
		line = "<leader>/",
		block = "<leader>?",
	},
	pre_hook = function(ctx)
		local comment_utils = require("Comment.utils")
		local tsccs_utils = require("ts_context_commentstring.utils")
		local tsccs_internal = require("ts_context_commentstring.internal")

		-- Detemine whether to use linewise or blockwise commentstring
		local type = ctx.ctype == comment_utils.ctype.line and "__default" or "__multiline"

		-- Determine the location where to calculate commentstring from
		local location = nil
		if ctx.ctype == comment_utils.ctype.block then
			location = tsccs_utils.get_cursor_location()
		elseif ctx.cmotion == comment_utils.cmotion.v or ctx.cmotion == comment_utils.cmotion.V then
			location = tsccs_utils.get_visual_start_location()
		end

		return tsccs_internal.calculate_commentstring({
			key = type,
			location = location,
		})
	end,
})

require("which-key").register({
	["/"] = { "toggle line comment" },
	["?"] = { "toggle block comment" },
}, {
	prefix = "<leader>",
	nowait = true,
})
