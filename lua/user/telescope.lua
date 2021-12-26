local telescope = require "telescope"
local t_builtin = require "telescope.builtin"
local t_themes = require "telescope.themes"

telescope.setup {
  defaults = {
    path_display = "smart",
  },
  extensions = {
    ["ui-select"] = {
      t_themes.get_dropdown {}
    }
  }
}

telescope.load_extension "fzy_native" -- overrides the file & generic sorter
telescope.load_extension "ui-select"

require "which-key".register({
  b = {
    b = { function() t_builtin.buffers {} end, "browse open buffers" },
  },
  D = {
    name = "diagnostics",
    d = { function() t_builtin.diagnostics {} end, "diagnostics" },
  },
  G = {
    name = "git",
    b = { function() t_builtin.branches {} end, "branches" },
    c = { function() t_builtin.commits {} end, "commits" },
    C = { function() t_builtin.buffer_commits {} end, "buffer commits" },
  },
  f = { function() t_builtin.find_files {} end, "find files" },
  F = {
    name = 'more "find"s',
    ['"'] = { function() t_builtin.registers {} end, "registers" },
    ["'"] = { function() t_builtin.marks {} end, "marks" },
    [":"] = { function() t_builtin.commands {} end, "commands" },
    b = { function() t_builtin.buffers {} end, "buffers" },
    f = { function() t_builtin.file_browser {} end, "files and folders" },
    g = { function() t_builtin.live_grep {} end, "live grep" },
    G = { function() t_builtin.grep_string {} end, "grep string under cursor" },
    h = { function() t_builtin.help_tags {} end, "help" },
    l = { function() t_builtin.loclist {} end, "location list" },
    q = { function() t_builtin.quickfix {} end, "quickfix list" },
    -- s = { function() t_builtin.spell_suggest {} end, "spelling suggestions" },
    s = {
      name = "symbols",
      e = { function() t_builtin.symbols { sources = { "emoji" } } end, "emoji" },
      k = { function() t_builtin.symbols { sources = { "kaomoji" } } end, "kaomoji" },
      m = { function() t_builtin.symbols { sources = { "math" } } end, "math" },
      l = { function() t_builtin.symbols { sources = { "latex" } } end, "latex" },
      g = { function() t_builtin.symbols { sources = { "gitmoji" } } end, "gitmoji" },
    }
  },
  l = {
    a = { function() t_builtin.lsp_code_actions {} end, "code actions" },
    A = { function() t_builtin.lsp_range_code_actions {} end, "range code actions" },
    i = { function() t_builtin.lsp_implementations {} end, "implementations" },
    s = { function() t_builtin.lsp_dynamic_workspace_symbols {} end, "symbols" },
    -- s = { function() t_builtin.lsp_workspace_symbols {} end, "symbols" },
    S = { function() t_builtin.lsp_document_symbols {} end, "document symbols" },
    u = { function() t_builtin.lsp_references {} end, "references" },
  },
}, {
  prefix = "<leader>",
  nowait = true,
});

