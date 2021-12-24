local telescope = require "telescope"
local t_builtin = require "telescope.builtin"

telescope.setup {}

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
    b = { function() t_builtin.buffers {} end, "buffers" },
    f = { function() t_builtin.file_browser {} end, "files and folders" },
    g = { function() t_builtin.live_grep {} end, "live grep" },
    G = { function() t_builtin.grep_string {} end, "grep string under cursor" },
    h = { function() t_builtin.help_tags {} end, "help" },
    l = { function() t_builtin.loclist {} end, "location list" },
    q = { function() t_builtin.quickfix {} end, "quickfix list" },
    s = { function() t_builtin.spell_suggest {} end, "spelling suggestions" },
  },
  l = {
    a = { function() t_builtin.lsp_code_actions {} end, "code actions" },
    A = { function() t_builtin.lsp_range_code_actions {} end, "range code actions" },
    i = { function() t_builtin.lsp_implementations {} end, "implementations" },
    u = { function() t_builtin.lsp_references {} end, "references" },
  },
}, {
  prefix = "<leader>",
  nowait = true,
});

