local M = {}

function M.highlight(c, opts)
  return {
    TelescopeBorder = { bg = c.bg0, fg = c.fg1 },
    TelescopeMatching = { fg = c.yellow },
    TelescopeMultiIcon = { fg = c.fg1 },
    TelescopeMultiSelection = { fg = c.cyan },
    TelescopeNormal = { bg = c.bg0, fg = c.cyan },
    TelescopePreviewBlock = { fg = c.red },
    TelescopePreviewBorder = { bg = c.bg0, fg = c.bg0 },
    TelescopePreviewCharDev = { fg = c.red },
    TelescopePreviewDate = { fg = c.green },
    TelescopePreviewDirectory = { fg = c.green },
    TelescopePreviewExecute = { fg = c.green },
    TelescopePreviewGroup = { fg = c.red },
    TelescopePreviewHyphen = { fg = c.grey0 },
    TelescopePreviewLine = { bg = c.grey0 },
    TelescopePreviewLink = { fg = c.yellow },
    TelescopePreviewMatch = { bg = c.grey1, fg = c.cyan },
    TelescopePreviewMessage = { bg = c.bg0 },
    TelescopePreviewMessageFillchar = { bg = c.bg0 },
    TelescopePreviewNormal = { bg = c.bg0 },
    TelescopePreviewPipe = { fg = c.red },
    TelescopePreviewRead = { fg = c.red },
    TelescopePreviewSize = { fg = c.green },
    TelescopePreviewSocket = { bold = true, fg = c.yellow_bright },
    TelescopePreviewSticky = { fg = c.yellow_bright, italic = true },
    TelescopePreviewTitle = { link = 'TelescopeTitle' },
    TelescopePreviewUser = { fg = c.red },
    TelescopePreviewWrite = { bold = true, fg = c.yellow_bright },
    TelescopePromptBorder = { bg = c.bg0, fg = c.bg0 },
    TelescopePromptCounter = { fg = c.grey0 },
    TelescopePromptNormal = { bg = c.bg0 },
    TelescopePromptPrefix = { fg = c.fg1 },
    TelescopePromptTitle = { link = 'TelescopeTitle' },
    TelescopeResultsBorder = { bg = c.bg2, fg = c.bg2 },
    TelescopeResultsClass = { link = 'Structure' },
    TelescopeResultsComment = { link = 'Comment' },
    TelescopeResultsConstant = { fg = c.red },
    TelescopeResultsDiffAdd = { bg = c.grey0 },
    TelescopeResultsDiffChange = { bg = c.bg4 },
    TelescopeResultsDiffDelete = { bg = c.bg_5, fg = c.red_bright },
    TelescopeResultsDiffUntracked = { fg = c.grey0 },
    TelescopeResultsField = { link = '@field' },
    TelescopeResultsFunction = { fg = c.green },
    TelescopeResultsIdentifier = { fg = c.fg1 },
    TelescopeResultsLineNr = { bg = c.bg4, fg = c.grey0 },
    TelescopeResultsMethod = { link = 'Function' },
    TelescopeResultsNormal = { bg = c.bg2, fg = c.fg_dim },
    TelescopeResultsNumber = { fg = c.orange },
    TelescopeResultsOperator = { fg = c.red_bright },
    TelescopeResultsSpecialComment = { fg = c.yellow },
    TelescopeResultsStruct = { link = 'Structure' },
    TelescopeResultsTitle = { link = 'TelescopeTitle' },
    TelescopeResultsVariable = { link = '@variable' },
    TelescopeSelection = { link = 'CursorLine' },
    TelescopeSelectionCaret = { link = 'CursorLineNr' },
    TelescopeTitle = { link = 'Title' },
  }
end

return M
