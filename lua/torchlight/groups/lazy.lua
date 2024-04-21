local M = {}

function M.highlight(c, opts)
  return {
    LazyNormal = { link = 'NormalNC' },
    LazyProgressTodo = { fg = c.grey0 },
  }
end

return M
