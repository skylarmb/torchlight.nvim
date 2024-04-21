local M = {}

function M.highlight(c, opts)
  return {
    MasonNormal = { bg = c.bg0, fg = c.fg_dim },
    markdownCode = { fg = c.green },
    markdownCodeBlock = { fg = c.green },
    healthError = { fg = c.red },
    healthSuccess = { fg = c.green },
    healthWarning = { fg = c.orange },
    MiniAnimateCursor = { nocombine = true, reverse = true },
    NorgreenFloat = { fg = c.fg_dim },
    NeoscrollHiddenCursor = { blend = 100, reverse = true },

    lCursor = { link = 'Cursor' },
    qfFileName = { link = 'Directory' },
    qfLineNr = { link = 'LineNr' },
  }
end

return M
