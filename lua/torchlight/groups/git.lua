local M = {}

function M.highlight(c, opts)
  return {
    DiffAdd = { bg = c.green_dim },
    DiffChange = { bg = c.bg4 },
    DiffDelete = { bg = c.bg5, fg = c.red_bright },
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
    GitSignsDeletePreview = { bg = c.bg5, fg = c.red_bright },
    GitSignsDeleteVirtLn = { bg = c.bg5, fg = c.red_bright },
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
    GitSignsVirtLnum = { bg = c.bg5, fg = c.red_bright },

    diffAdded = { fg = c.green_dim },
    diffChanged = { fg = c.orange_dim },
    diffDeleted = { fg = c.red },
    diffNewFile = { fg = c.green },
    diffOldFile = { fg = c.red },
    diffRemoved = { fg = c.red },

    -- Neogit renders each diff in one of three states: the file under the
    -- cursor uses the `*Highlight` groups, every other file uses the plain
    -- groups, and the cursor line itself uses the `*Cursor` groups. Neogit
    -- only defines a group the colorscheme left unset, and it derives the
    -- plain groups from `DiffAdd`/`DiffDelete` above, which puts a green
    -- foreground on a green background. Set all three states here.
    NeogitDiffAdd = { bg = c.bg3, fg = c.green },
    NeogitDiffAddCursor = { bg = c.grey0, fg = c.fg_bright },
    NeogitDiffAddHighlight = { bg = c.grey0, fg = c.green },
    NeogitDiffAddInline = { bg = c.green_dim, fg = c.fg_bright },
    NeogitDiffContext = { bg = c.bg1 },
    NeogitDiffContextCursor = { bg = c.bg4 },
    NeogitDiffContextHighlight = { bg = c.bg4 },
    NeogitDiffDelete = { bg = c.bg3, fg = c.red },
    NeogitDiffDeleteCursor = { bg = c.bg5, fg = c.fg_bright },
    NeogitDiffDeleteHighlight = { bg = c.bg5, fg = c.red_bright },
    NeogitDiffDeleteInline = { bg = c.red_dim, fg = c.fg_bright },
    NeogitHunkHeader = { fg = c.green },
    NeogitHunkHeaderCursor = { bg = c.bg4, fg = c.red },
    NeogitHunkHeaderHighlight = { bg = c.bg4, fg = c.red },
  }
end

return M
