local hop = require "hop"

hop.setup {}

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
