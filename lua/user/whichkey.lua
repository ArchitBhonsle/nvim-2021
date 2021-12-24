local which_key = require "which-key"

which_key.register({
  b = {
    name = "buffer",
    n = { "<cmd>BufferLineCycleNext<cr>", "next buffer" },
    p = { "<cmd>BufferLineCyclePrev<cr>", "previous buffer" },
    c = { "<cmd>bdelete!<cr>", "close current buffer" },
  },
  ["/"] = { "toggle line comment" },
  ["?"] = { "toggle block comment" },
}, {
  prefix = "<leader>",
  nowait = true,  -- this triggers a keymap even if a longer keymap exists, so make sure no keymap is a subset of another
})

