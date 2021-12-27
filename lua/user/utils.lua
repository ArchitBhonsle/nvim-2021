local M = {}

M.keymap = function(mode, from, to)
    vim.api.nvim_set_keymap(mode, from, to, { noremap = true, silent = true })
  end

M.terminal_keymap = function(mode, from, to)
    vim.api.nvim_set_keymap(mode, from, to, { silent = true })
  end

M.map_set = function(to, from)
    for k, v in pairs(from) do
      to[k] = v
    end
  end

M.border = {
  v = "│",
  h = "─",
  m = "┼",
  tl = "┌",
  tr = "┐",
  bl = "└",
  br = "┘",
  ml = "├",
  mr = "┤",
  tm = "┬",
  bm = "┴",
}

return M
