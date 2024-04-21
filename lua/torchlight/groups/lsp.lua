local M = {}

function M.highlight(c, opts)
  return {
    DiagnosticError = { fg = c.red_bright },
    DiagnosticHint = { fg = c.cyan },
    DiagnosticInfo = { fg = c.cyan },
    DiagnosticOk = { fg = c.yellow_bright },
    DiagnosticSignError = { bg = c.bg4, fg = c.red_bright },
    DiagnosticSignHint = { bg = c.bg4, fg = c.cyan },
    DiagnosticSignInfo = { bg = c.bg4, fg = c.cyan },
    DiagnosticSignWarn = { bg = c.bg4, fg = c.yellow_bright },
    DiagnosticUnderlineError = { sp = c.red_bright, undercurl = true },
    DiagnosticUnderlineHint = { sp = c.cyan, undercurl = true },
    DiagnosticUnderlineInfo = { sp = c.blue, undercurl = true },
    DiagnosticUnderlineWarn = { sp = c.yellow_bright, undercurl = true },
    DiagnosticWarn = { fg = c.yellow_bright },
    LspCodeLens = { fg = c.green_dim },
    LspInfoBorder = { bold = true, fg = c.yellow_bright },
    LspInfoFiletype = { fg = c.cyan },
    LspInfoList = { fg = c.green },
    LspInfoTip = { fg = c.green_dim, italic = true },
    LspInfoTitle = { bold = true, fg = c.green },
    LspReferenceText = { bg = c.grey0 },
    LspReferenceWrite = { bg = c.bg_bright, underline = true },
    LspSignatureActiveParameter = { fg = c.orange },
    NullLsInfoBorder = { fg = c.fg_dim },
    NullLsInfoHeader = { bold = true, fg = c.yellow_bright },
    NullLsInfoSources = { bold = true, fg = c.green },
    NullLsInfoTitle = { fg = c.cyan },

    LspReferenceRead = { link = 'LspReferenceText' },
  }
end

return M
