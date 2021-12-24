local bufferline = require "bufferline"

bufferline.setup {}

-- buffer navigation
local k = require "user.utils".keymap
k("n", "<S-l>", ":BufferLineCycleNext<CR>")
k("n", "<S-h>", ":BufferLineCyclePrev<CR>")
