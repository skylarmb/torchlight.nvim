local M = {}

function M.highlight(c, opts)
  return {
    DiffAdd = { bg = c.green_dim },
    DiffChange = { bg = c.bg4 },
    DiffDelete = { bg = c.bg_5, fg = c.red_bright },
    DiffText = { bg = c.bg_bright },

    GitSignsAdd = { bg = c.bg3, fg = c.green_dim },
    GitSignsAddInline = { reverse = true },
    GitSignsAddLn = { bg = c.grey0 },
    GitSignsAddLnInline = { reverse = true },
    GitSignsAddNr = { bg = c.bg3, fg = c.green_dim },
    GitSignsAddPreview = { bg = c.grey0 },
    GitSignsChange = { bg = c.bg3, fg = c.orange_dim },
    GitSignsChangeInline = { reverse = true },
    GitSignsChangeLn = { bg = c.bg3 },
    GitSignsChangeLnInline = { reverse = true },
    GitSignsChangeNr = { bg = c.bg3, fg = c.orange_dim },
    GitSignsChangedelete = { bg = c.bg3, fg = c.orange_dim },
    GitSignsChangedeleteLn = { bg = c.bg3 },
    GitSignsChangedeleteNr = { bg = c.bg3, fg = c.orange_dim },
    GitSignsCurrentLineBlame = { fg = c.grey0 },
    GitSignsDelete = { bg = c.bg3, fg = c.red_bright },
    GitSignsDeleteInline = { reverse = true },
    GitSignsDeleteLnInline = { reverse = true },
    GitSignsDeleteNr = { bg = c.bg3, fg = c.red_bright },
    GitSignsDeletePreview = { bg = c.bg_5, fg = c.red_bright },
    GitSignsDeleteVirtLn = { bg = c.bg_5, fg = c.red_bright },
    GitSignsDeleteVirtLnInLine = { reverse = true },
    GitSignsStagedAdd = { bg = c.bg3, fg = c.green_dim },
    GitSignsStagedAddLn = { bg = c.grey0 },
    GitSignsStagedAddNr = { bg = c.bg3, fg = c.green_dim },
    GitSignsStagedChange = { bg = c.bg3, fg = c.yellow_dim },
    GitSignsStagedChangeLn = { bg = c.bg3 },
    GitSignsStagedChangeNr = { bg = c.bg3, fg = c.yellow_dim },
    GitSignsStagedChangedelete = { bg = c.bg3, fg = c.yellow_dim },
    GitSignsStagedChangedeleteLn = { bg = c.bg3 },
    GitSignsStagedChangedeleteNr = { bg = c.bg3, fg = c.yellow_dim },
    GitSignsStagedDelete = { bg = c.bg3, fg = c.red_dim },
    GitSignsStagedDeleteNr = { bg = c.bg3, fg = c.red_dim },
    GitSignsStagedTopdelete = { bg = c.bg3, fg = c.red_dim },
    GitSignsStagedTopdeleteNr = { bg = c.bg3, fg = c.red_dim },
    GitSignsTopdelete = { bg = c.bg3, fg = c.red_bright },
    GitSignsTopdeleteNr = { bg = c.bg3, fg = c.red_bright },
    GitSignsUntracked = { bg = c.bg3, fg = c.green_dim },
    GitSignsUntrackedLn = { bg = c.grey0 },
    GitSignsUntrackedNr = { bg = c.bg3, fg = c.green_dim },
    GitSignsVirtLnum = { bg = c.bg_5, fg = c.red_bright },

    diffAdded = { fg = c.green_dim },
    diffChanged = { fg = c.orange_dim },
    diffDeleted = { fg = c.red },
    diffNewFile = { fg = c.green },
    diffOldFile = { fg = c.red },
    diffRemoved = { fg = c.red },

    NeogitDiffAddHighlight = { bg = c.grey0 },
    NeogitDiffContextHighlight = { bg = c.bg4 },
    NeogitDiffDeleteHighlight = { bg = c.bg_5 },
    NeogitHunkHeader = { fg = c.green },
    NeogitHunkHeaderHighlight = { bg = c.bg4, fg = c.red },
  }
end

return M