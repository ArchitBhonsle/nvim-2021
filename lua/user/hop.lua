local hop = require "hop"

hop.setup {}

local k = require "user.utils".keymap
k('n', 'f', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>")
k('n', 'F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>")
k('o', 'f', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, inclusive_jump = true })<cr>")
k('o', 'F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, inclusive_jump = true })<cr>")
k('', 't', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>")
k('', 'T', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>")

require "which-key".register ({
  h = { "<cmd>:HopChar1<cr>", '"hop" to a character'},
  H = {
    name = '"hop"oon',
    w = { "<cmd>:HopWord<cr>", '"hop" to any word'},
    d = { "<cmd>:HopChar2<cr>", '"hop" to a diagraph'},
    p = { "<cmd>:HopPattern<cr>", '"hop" to a pattern'},
  }
}, {
  prefix = "<leader>",
  nowait = true,
})
