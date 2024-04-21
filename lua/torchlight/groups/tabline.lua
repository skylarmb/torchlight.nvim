local M = {}

function M.highlight(c, opts)
  return {
    TabLine = { bg = c.bg0, fg = c.green },
    TabLineFill = { bg = c.bg2 },
    TabLineSel = { bg = c.bg4, fg = c.fg_dim },
  }
end

return M
