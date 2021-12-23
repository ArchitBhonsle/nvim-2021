local ok, which_key = pcall(require, "which-key")
if not ok then
  vim.notify("'which-key' not found")
  return
end

which_key.register({
  b = {
    name = "buffer",
    n = { "<CMD>BufferLineCycleNext<CR>", "next buffer" },
    p = { "<CMD>BufferLineCyclePrev<CR>", "previous buffer" },
  }
}, {
  prefix = "<leader>",
  nowait = true,  -- WARN this triggers a keymap even if a longer keymap exists, so make sure no keymap is a subset of another
})
