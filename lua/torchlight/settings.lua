local M = {}

local DEFAULT = {
  contrast = 'hard',
}

M.opts = {}

function M.set(opts)
  M.opts = vim.tbl_deep_extend('force', DEFAULT, opts or {})
end

M.set()

return M
