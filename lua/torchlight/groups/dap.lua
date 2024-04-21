local M = {}

function M.highlight(c, opts)
  return {
    DapUIBreakpointsCurrentLine = { bold = true, fg = c.fg1 },
    DapUIBreakpointsInfo = { fg = c.cyan },
    DapUIDecoration = { fg = c.fg_dim },
    DapUIFloatBorder = { fg = c.fg_dim },
    DapUILineNumber = { fg = c.yellow },
    DapUIModifiedValue = { bold = true, fg = c.yellow },
    DapUINormalNC = { bg = c.bg2, fg = c.cyan },
    DapUIPlayPause = { fg = c.green },
    DapUIPlayPauseNC = { fg = c.yellow_bright },
    DapUIRestart = { fg = c.green },
    DapUIRestartNC = { fg = c.yellow_bright },
    DapUISource = { fg = c.red_bright },
    DapUIStepBack = { fg = c.yellow },
    DapUIStepBackNC = { fg = c.cyan },
    DapUIStepInto = { fg = c.yellow },
    DapUIStepIntoNC = { fg = c.cyan },
    DapUIStepOut = { fg = c.yellow },
    DapUIStepOutNC = { fg = c.cyan },
    DapUIStepOver = { fg = c.yellow },
    DapUIStepOverNC = { fg = c.cyan },
    DapUIStop = { fg = c.red_bright },
    DapUIStopNC = { fg = c.red_bright },
    DapUIStoppedThread = { fg = c.yellow },
    DapUIThread = { fg = c.fg1 },
    DapUIUnavailable = { fg = c.green_dim },
    DapUIUnavailableNC = { fg = c.grey0 },
    DapUIWatchesEmpty = { fg = c.red_bright },
    DapUIWatchesError = { fg = c.red_bright },
    DapUIWatchesValue = { fg = c.fg1 },
    DapUIWinSelect = { bold = true, ctermfg = 14, fg = c.cyan },

    debugBreakpoint = { bg = c.bg4, fg = c.yellow },
    debugPC = { bg = c.bg_5 },

    DapUIBreakpointsDisabledLine = { link = 'Comment' },
    DapUIBreakpointsPath = { link = 'Directory' },
    DapUIScope = { link = 'Special' },
    DapUIType = { link = 'Type' },
  }
end

return M
