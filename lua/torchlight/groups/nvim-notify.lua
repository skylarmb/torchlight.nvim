local M = {}

function M.highlight(c, opts)
  return {
    NotifierContent = { bg = c.bg2, fg = c.cyan },
    NotifierContentDim = { fg = c.green_dim, italic = true },
    NotifierIcon = { bold = true, fg = c.green },
    NotifierTitle = { bold = true, fg = c.green },
    NotifyBackground = { bg = c.bg2 },
    NotifyDEBUGBorder = { link = 'Debug' },
    NotifyDEBUGIcon = { link = 'Debug' },
    NotifyDEBUGTitle = { link = 'Debug' },
    NotifyERRORBorder = { link = 'DiagnosticError' },
    NotifyERRORIcon = { link = 'DiagnosticError' },
    NotifyERRORTitle = { link = 'DiagnosticError' },
    NotifyHINTBorder = { link = 'DiagnosticHint' },
    NotifyHINTIcon = { link = 'DiagnosticHint' },
    NotifyHINTTitle = { link = 'DiagnosticHint' },
    NotifyINFOBorder = { link = 'DiagnosticInfo' },
    NotifyINFOIcon = { link = 'DiagnosticInfo' },
    NotifyINFOTitle = { link = 'DiagnosticInfo' },
    NotifyTRACEBorder = { link = 'Comment' },
    NotifyTRACEIcon = { link = 'Comment' },
    NotifyTRACETitle = { link = 'Comment' },
    NotifyWARNBorder = { link = 'DiagnosticWarn' },
    NotifyWARNIcon = { link = 'DiagnosticWarn' },
    NotifyWARNTitle = { link = 'DiagnosticWarn' },
  }
end

return M
