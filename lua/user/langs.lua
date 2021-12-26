local rust_tools = require "rust-tools"
rust_tools.setup {}

require "which-key".register ({
  r = {
    name = "rust",
    h = { function() require('rust-tools.inlay_hints').toggle_inlay_hints() end, "toggle inlay hints" },
    r = { function() require('rust-tools.runnables').runnables() end, "runnables" },
    m = { function() require'rust-tools.expand_macro'.expand_macro() end, "expand macro" },
    j = { function() require'rust-tools.move_item'.move_item(false) end, "move item down" },
    k = { function() require'rust-tools.move_item'.move_item(true) end, "move item up" },
    c = { function() require'rust-tools.open_cargo_toml'.open_cargo_toml() end, "open Cargo.toml" },
    p = { function() require'rust-tools.parent_module'.parent_module() end, "parent module" },
  }
}, {
  prefix = "<leader>L",
  nowait = true,
})

