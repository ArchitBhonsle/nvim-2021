local harpoon_mark = require "harpoon.mark"
local harpoon_ui = require "harpoon.ui"

require "which-key".register ({
  h = { "<cmd>:HopChar1<cr>", '"hop" to a character'},
  H = {
    name = '"hop"oon',
    h = { function() harpoon_mark.add_file() end, "add file to harpoon" },
    u = { function() harpoon_ui.toggle_quick_menu() end, "toggle harpoon ui" },
    k = { function() harpoon_ui.nav_next() end, "go to next harpoon" },
    j = { function() harpoon_ui.nav_prev() end, "go to previous harpoon" },
  }
}, {
  prefix = "<leader>",
  nowait = true,
})
