local M = {}

function M.highlight(c, opts)
  -- Every pane of the picker takes one background: the prompt, the results,
  -- and the preview. Only the selected row differs. These values match the
  -- snacks picker, so both pickers read the same.
  local pickerBg = c.bg0
  local cursorLineBg = c.bg4

  if opts.contrast == 'stark' then
    pickerBg = c.bg_stark
    cursorLineBg = c.bg2
  end

  if opts.contrast == 'hard' then
    pickerBg = c.bg_dim
    cursorLineBg = c.bg3
  end

  if opts.contrast == 'soft' then
    pickerBg = c.bg2
    cursorLineBg = c.bg5
  end

  return {
    TelescopeBorder = { bg = pickerBg, fg = c.fg1 },
    TelescopeMatching = { fg = c.yellow },
    TelescopeMultiIcon = { fg = c.fg1 },
    TelescopeMultiSelection = { fg = c.cyan },
    TelescopeNormal = { bg = pickerBg, fg = c.cyan },
    TelescopePreviewBlock = { fg = c.red },
    TelescopePreviewBorder = { bg = pickerBg },
    TelescopePreviewCharDev = { fg = c.red },
    TelescopePreviewDate = { fg = c.green },
    TelescopePreviewDirectory = { fg = c.green },
    TelescopePreviewExecute = { fg = c.green },
    TelescopePreviewGroup = { fg = c.red },
    TelescopePreviewHyphen = { fg = c.grey0 },
    TelescopePreviewLine = { bg = c.grey0 },
    TelescopePreviewLink = { fg = c.yellow },
    TelescopePreviewMatch = { bg = c.grey1, fg = c.cyan },
    TelescopePreviewMessage = { bg = pickerBg },
    TelescopePreviewMessageFillchar = { bg = pickerBg },
    TelescopePreviewNormal = { bg = pickerBg },
    TelescopePreviewPipe = { fg = c.red },
    TelescopePreviewRead = { fg = c.red },
    TelescopePreviewSize = { fg = c.green },
    TelescopePreviewSocket = { bold = true, fg = c.yellow_bright },
    TelescopePreviewSticky = { fg = c.yellow_bright, italic = true },
    TelescopePreviewTitle = { link = 'TelescopeTitle' },
    TelescopePreviewUser = { fg = c.red },
    TelescopePreviewWrite = { bold = true, fg = c.yellow_bright },
    TelescopePromptBorder = { bg = pickerBg },
    TelescopePromptCounter = { fg = c.grey0 },
    TelescopePromptNormal = { bg = pickerBg },
    TelescopePromptPrefix = { fg = c.fg1 },
    TelescopePromptTitle = { link = 'TelescopeTitle' },
    TelescopeResultsBorder = { bg = pickerBg },
    TelescopeResultsClass = { link = 'Structure' },
    TelescopeResultsComment = { link = 'Comment' },
    TelescopeResultsConstant = { fg = c.red },
    TelescopeResultsDiffAdd = { bg = c.grey0 },
    TelescopeResultsDiffChange = { bg = c.bg4 },
    TelescopeResultsDiffDelete = { bg = c.bg5, fg = c.red_bright },
    TelescopeResultsDiffUntracked = { fg = c.grey0 },
    TelescopeResultsField = { link = '@field' },
    TelescopeResultsFunction = { fg = c.green },
    TelescopeResultsIdentifier = { fg = c.fg1 },
    TelescopeResultsLineNr = { bg = c.bg4, fg = c.grey0 },
    TelescopeResultsMethod = { link = 'Function' },
    TelescopeResultsNormal = { bg = pickerBg, fg = c.fg_dim },
    TelescopeResultsNumber = { fg = c.orange },
    TelescopeResultsOperator = { fg = c.red_bright },
    TelescopeResultsSpecialComment = { fg = c.yellow },
    TelescopeResultsStruct = { link = 'Structure' },
    TelescopeResultsTitle = { link = 'TelescopeTitle' },
    TelescopeResultsVariable = { link = '@variable' },
    TelescopeSelection = { bg = cursorLineBg },
    TelescopeSelectionCaret = { link = 'CursorLineNr' },
    TelescopeTitle = { link = 'Title' },
  }
end

return M
