local M = {}

function M.highlight(c, opts)
  return {
    NvimTreeBookmark = { fg = c.green },
    NvimTreeExecFile = { bold = true, fg = c.green },
    NvimTreeFolderIcon = { fg = c.blue },
    NvimTreeGitDeleted = { fg = c.red_bright },
    NvimTreeGitDirty = { fg = c.orange_dim },
    NvimTreeGitMerge = { fg = c.yellow_light },
    NvimTreeGitNew = { fg = c.green_dim },
    NvimTreeGitRenamed = { fg = c.orange },
    NvimTreeGitStaged = { fg = c.green_dim },
    NvimTreeImageFile = { fg = c.red_bright },
    NvimTreeIndentMarker = { fg = c.blue },
    NvimTreeLiveFilterPrefix = { bold = true, fg = c.orange },
    NvimTreeLiveFilterValue = { bold = true },
    NvimTreeModifiedFile = { fg = c.green },
    NvimTreeNormal = { bg = c.bg3, fg = c.fg0 },
    NvimTreeOpenedFile = { fg = c.yellow, italic = true },
    NvimTreeRootFolder = { bold = true, fg = c.fg1 },
    NvimTreeSpecialFile = { fg = c.yellow },
    NvimTreeSymlink = { link = 'Type' },
    NvimTreeWindowPicker = { bg = c.bg3, bold = true, fg = c.yellow },
  }
end

return M
