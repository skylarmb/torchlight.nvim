local M = {}

function M.highlight(c, opts)
  return {
    -- Title groups - using green for primary titles
    AvanteTitle = { fg = c.bg0, bg = c.green },
    AvanteReversedTitle = { fg = c.green, link = 'NormalFloat' },

    -- Subtitle groups - using cyan for secondary titles
    AvanteSubtitle = { fg = c.bg0, bg = c.cyan },
    AvanteReversedSubtitle = { fg = c.cyan, link = 'NormalFloat' },

    -- Third-level title groups - using grey tones
    AvanteThirdTitle = { fg = c.fg_dim, bg = c.grey0 },
    AvanteReversedThirdTitle = { fg = c.grey0, link = 'NormalFloat' },

    -- Suggestion and annotation - link to comments
    AvanteSuggestion = { link = 'Comment' },
    AvanteAnnotation = { link = 'Comment' },

    -- Hints
    AvantePopupHint = { link = 'NormalFloat' },
    AvanteInlineHint = { link = 'Keyword' },

    -- Deletion markers - using red tones
    AvanteToBeDeleted = { bg = c.red_dim, fg = c.fg_dim, strikethrough = true },
    AvanteToBeDeletedWOStrikethrough = { bg = c.red_dim, fg = c.fg_dim },

    -- Confirm title - using red for warnings/confirmations
    AvanteConfirmTitle = { fg = c.bg0, bg = c.red_bright },

    -- Button states - default buttons use fg_dim
    AvanteButtonDefault = { fg = c.bg0, bg = c.fg_dim },
    AvanteButtonDefaultHover = { fg = c.bg0, bg = c.green },

    -- Primary buttons - using fg colors
    AvanteButtonPrimary = { fg = c.bg0, bg = c.fg2 },
    AvanteButtonPrimaryHover = { fg = c.bg0, bg = c.cyan },

    -- Danger buttons - using red
    AvanteButtonDanger = { fg = c.bg0, bg = c.fg_dim },
    AvanteButtonDangerHover = { fg = c.bg0, bg = c.red_bright },

    -- Prompt input
    AvantePromptInput = {},
    AvantePromptInputBorder = { link = 'NormalFloat' },

    -- Sidebar separators
    AvanteSidebarWinSeparator = { fg = c.bg3, bg = c.bg0 },
    AvanteSidebarWinHorizontalSeparator = { link = 'WinSeparator' },
    AvanteSidebarNormal = { link = 'NormalFloat' },

    -- Comment foreground
    AvanteCommentFg = { link = 'Comment' },

    -- Reversed normal
    AvanteReversedNormal = { fg = c.bg0, bg = c.fg0 },

    -- State spinners - using blue for "thinking" states (purple replacement)
    AvanteStateSpinnerGenerating = { fg = c.bg0, bg = c.blue },
    AvanteStateSpinnerToolCalling = { fg = c.bg0, bg = c.cyan },
    AvanteStateSpinnerFailed = { fg = c.bg0, bg = c.red_bright },
    AvanteStateSpinnerSucceeded = { fg = c.bg0, bg = c.green },
    AvanteStateSpinnerSearching = { fg = c.bg0, bg = c.blue },
    AvanteStateSpinnerThinking = { fg = c.bg0, bg = c.blue },
    AvanteStateSpinnerCompacting = { fg = c.bg0, bg = c.blue },

    -- Task states
    AvanteTaskRunning = { fg = c.blue, bg = c.bg0 },
    AvanteTaskCompleted = { fg = c.green, bg = c.bg0 },
    AvanteTaskFailed = { fg = c.red_bright, bg = c.bg0 },
    AvanteThinking = { fg = c.blue, bg = c.bg0 },

    -- Logo gradient - creating gradient from bright to dim using fg and grey tones
    AvanteLogoLine1 = { fg = c.fg_bright },
    AvanteLogoLine2 = { fg = c.fg0 },
    AvanteLogoLine3 = { fg = c.fg1 },
    AvanteLogoLine4 = { fg = c.fg2 },
    AvanteLogoLine5 = { fg = c.fg3 },
    AvanteLogoLine6 = { fg = c.fg4 },
    AvanteLogoLine7 = { fg = c.fg_dim },
    AvanteLogoLine8 = { fg = c.grey2 },
    AvanteLogoLine9 = { fg = c.grey1 },
    AvanteLogoLine10 = { fg = c.grey0 },
    AvanteLogoLine11 = { fg = c.bg5 },
    AvanteLogoLine12 = { fg = c.bg4 },
    AvanteLogoLine13 = { fg = c.bg3 },
    AvanteLogoLine14 = { fg = c.bg2 },

    -- Conflict markers
    AvanteConflictCurrent = { bg = c.red_dim, bold = true },
    AvanteConflictCurrentLabel = { bg = c.red_dim, fg = c.fg_dim },
    AvanteConflictIncoming = { bg = c.cyan, bold = true },
    AvanteConflictIncomingLabel = { bg = c.cyan, fg = c.bg0 },
  }
end

return M
