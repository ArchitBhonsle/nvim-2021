local ok, bufferline = pcall(require, "bufferline")
if not ok then
  vim.notify("'bufferline' not found")
  return
end

bufferline.setup {}

-- buffer navigation
local k = require("user.utils").keymap
k("n", "<A-k>", ":BufferLineCycleNext<CR>")
k("n", "<A-j>", ":BufferLineCyclePrev<CR>")
