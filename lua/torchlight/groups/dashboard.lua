local M = {}

function M.highlight(c, opts)
  return {
    DashboardCenter = { fg = c.fg1 },
    DashboardDesc = { fg = c.fg1 },
    DashboardFooter = { fg = c.green_dim },
    DashboardHeader = { fg = c.red_bright },
    DashboardIcon = { fg = c.green },
    DashboardKey = { fg = c.yellow },
    DashboardShortCut = { fg = c.yellow },
  }
end

return M
