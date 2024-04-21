local M = {}

function M.highlight(c, opts)
  return {
    IndentBlanklineChar = { fg = c.grey0 },
    IndentBlanklineContextChar = { fg = c.green },
    IndentBlanklineContextStart = { sp = c.grey2, underline = true },
    IndentBlanklineSpaceChar = { fg = c.grey0 },
    IndentBlanklineSpaceCharBlankline = { fg = c.grey0 },
    IblIndent = { fg = c.bg5 },
  }
end

return M
