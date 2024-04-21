local M = {}

function M.highlight(c)
  vim.g.terminal_color_0 = c.bg0
  vim.g.terminal_color_1 = c.red
  vim.g.terminal_color_2 = c.green
  vim.g.terminal_color_3 = c.fg0
  vim.g.terminal_color_4 = c.cyan
  vim.g.terminal_color_5 = c.orange
  vim.g.terminal_color_6 = c.blue
  vim.g.terminal_color_7 = c.fg0
  vim.g.terminal_color_8 = c.grey0
  vim.g.terminal_color_9 = c.red
  vim.g.terminal_color_10 = c.debug
  vim.g.terminal_color_11 = c.fg2
  vim.g.terminal_color_12 = c.blue
  vim.g.terminal_color_13 = c.orange
  vim.g.terminal_color_14 = c.cyan
  vim.g.terminal_color_15 = c.grey2
end

return M
