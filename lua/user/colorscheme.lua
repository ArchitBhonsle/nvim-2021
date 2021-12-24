vim.opt.background = "dark"

local colorscheme = "onedarker"

local ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not ok then
  vim.notify("colorscheme " .. colorscheme .. " not installed")
  return
end
