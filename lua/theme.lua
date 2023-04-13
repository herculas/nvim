vim.o.background = "dark"

local colorscheme = "gruvbox"
local status, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status then
  vim.notify("[Theme] colorscheme: " .. colorscheme .. " not found!")
  return
end
