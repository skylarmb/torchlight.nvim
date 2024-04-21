local M = {}

function M.highlight(c, opts)
  return {
    NeoTreeGitAdded = { fg = c.green_dim },
    NeoTreeGitConflict = { fg = c.red_bright },
    NeoTreeGitDeleted = { fg = c.red_bright },
    NeoTreeGitModified = { fg = c.orange_dim },
    NeoTreeGitStaged = { fg = c.green_dim },
    NeoTreeGitUnstaged = { fg = c.orange_dim },
    NeoTreeGitUntracked = { fg = c.orange_dim },
    NeoTreeIndentMarker = { link = 'NonText' },
    NeoTreeModified = { link = 'String' },
    NeoTreeRootName = { bold = true, fg = c.fg1 },
    NeoTreeTabActive = { link = 'TabLineSel' },
    NeoTreeTabInactive = { link = 'TabLine' },
    NeoTreeTabSeparatorActive = { link = 'NeoTreeTabActive' },
    NeoTreeTabSeparatorInactive = { link = 'NeoTreeTabInactive' },
  }
end

return M
