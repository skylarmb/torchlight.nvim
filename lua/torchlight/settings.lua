local M = {}

local DEFAULT = {
  contrast = 'medium',
}

M.opts = {}

function M.set(opts)
  M.opts = vim.tbl_deep_extend('force', DEFAULT, opts or {})
end

M.set()

return M
