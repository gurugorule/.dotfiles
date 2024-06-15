---@type ChadrcConfig
local M = {}

M.ui = {
  theme = 'catppuccin',
  transparency = true,
}
M.plugins = "custom.plugins"
vim.opt.relativenumber = true
vim.opt.number = true

return M
