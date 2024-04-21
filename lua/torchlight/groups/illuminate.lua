local M = {}

function M.highlight(palette, opts)
  return {
    IlluminatedWordRead = { underline = true },
    IlluminatedWordText = { underline = true },
    IlluminatedWordWrite = { underline = true },
  }
end

return M
