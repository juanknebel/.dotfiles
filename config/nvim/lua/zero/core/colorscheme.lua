-- set colorscheme to nightfly with protected call
-- local status, _ = pcall(vim.cmd, "colorscheme catppuccin-mocha")
local status, _ = pcall(vim.cmd, "colorscheme nord")
if not status then
  print("Colorscheme not found!") -- print error if colorscheme not installed
  return
end
