local M = {}

function M.highlight(c, opts)
  local pickerBg = c.bg0
  local pickerAltBg = c.bg2
  local cursorLineBg = c.bg4

  if opts.contrast == 'stark' then
    pickerBg = c.bg_stark
    pickerAltBg = c.bg_dim
    cursorLineBg = c.bg2
  end

  if opts.contrast == 'hard' then
    pickerBg = c.bg_dim
    pickerAltBg = c.bg0
    cursorLineBg = c.bg3
  end

  if opts.contrast == 'soft' then
    pickerBg = c.bg2
    pickerAltBg = c.bg3
    cursorLineBg = c.bg5
  end

  return {
    SnacksPicker = { bg = pickerBg, fg = c.fg0 },
    SnacksPickerBorder = { bg = pickerBg, fg = c.fg1 },
    SnacksPickerTitle = { bold = true, fg = c.green },
    SnacksPickerFooter = { fg = c.grey2 },

    SnacksPickerInput = { bg = pickerBg, fg = c.fg0 },
    SnacksPickerInputBorder = { bg = pickerBg },
    SnacksPickerInputTitle = { link = 'SnacksPickerTitle' },
    SnacksPickerPrompt = { fg = c.fg1 },
    SnacksPickerInputSearch = { fg = c.yellow },
    SnacksPickerSpinner = { fg = c.yellow },
    SnacksPickerTotals = { fg = c.grey2 },

    SnacksPickerList = { bg = pickerAltBg, fg = c.fg0 },
    SnacksPickerListBorder = { bg = pickerAltBg },
    SnacksPickerListTitle = { link = 'SnacksPickerTitle' },
    SnacksPickerListCursorLine = { bg = cursorLineBg },

    SnacksPickerPreview = { bg = pickerBg, fg = c.fg0 },
    SnacksPickerPreviewBorder = { bg = pickerBg },
    SnacksPickerPreviewTitle = { link = 'SnacksPickerTitle' },
    SnacksPickerPreviewCursorLine = { bg = c.bg3 },

    SnacksPickerMatch = { bold = true, fg = c.yellow_bright },
    SnacksPickerSearch = { bg = c.grey1, fg = c.yellow_bright },
    SnacksPickerSpecial = { fg = c.yellow },
    SnacksPickerDimmed = { fg = c.grey2 },
    SnacksPickerDelim = { fg = c.grey1 },
    SnacksPickerDir = { fg = c.grey2 },
    SnacksPickerFile = { fg = c.fg0 },
    SnacksPickerDirectory = { fg = c.green },
    SnacksPickerPathHidden = { fg = c.grey1 },
    SnacksPickerPathIgnored = { fg = c.grey1 },
    SnacksPickerLink = { fg = c.fg_dim },
    SnacksPickerLinkBroken = { fg = c.red_bright },
    SnacksPickerSelected = { fg = c.yellow },
    SnacksPickerUnselected = { fg = c.grey2 },
    SnacksPickerTree = { fg = c.grey1 },
    SnacksPickerBufNr = { fg = c.orange },
    SnacksPickerBufFlags = { fg = c.grey1 },
    SnacksPickerBufType = { fg = c.blue },
    SnacksPickerFileType = { fg = c.cyan },
    SnacksPickerDesc = { fg = c.grey2, italic = true },
    SnacksPickerComment = { fg = c.grey2, italic = true },
    SnacksPickerCode = { fg = c.green },
    SnacksPickerItalic = { italic = true },
    SnacksPickerBold = { bold = true },
    SnacksPickerTime = { fg = c.yellow },
    SnacksPickerIdx = { fg = c.orange },
    SnacksPickerRow = { fg = c.green },
    SnacksPickerCol = { fg = c.grey2 },

    SnacksPickerGitBranch = { fg = c.green },
    SnacksPickerGitBranchCurrent = { fg = c.yellow },
    SnacksPickerGitCommit = { fg = c.yellow },
    SnacksPickerGitDate = { fg = c.grey2 },
    SnacksPickerGitAuthor = { fg = c.fg1 },
    SnacksPickerGitType = { fg = c.green },
    SnacksPickerGitScope = { fg = c.fg_dim, italic = true },
    SnacksPickerGitStatus = { fg = c.yellow },
    SnacksPickerGitStatusAdded = { fg = c.green_dim },
    SnacksPickerGitStatusModified = { fg = c.orange_dim },
    SnacksPickerGitStatusDeleted = { fg = c.red_bright },
    SnacksPickerGitStatusRenamed = { fg = c.cyan },
    SnacksPickerGitStatusCopied = { fg = c.cyan },
    SnacksPickerGitStatusUntracked = { fg = c.grey2 },
    SnacksPickerGitStatusIgnored = { fg = c.grey1 },
    SnacksPickerGitStatusUnmerged = { fg = c.red_bright },
    SnacksPickerGitStatusStaged = { fg = c.green },

    SnacksPickerBox = { bg = pickerBg, fg = c.fg0 },
    SnacksPickerBoxBorder = { bg = pickerBg, fg = c.fg1 },
    SnacksPickerBoxTitle = { link = 'SnacksPickerTitle' },
  }
end

return M
