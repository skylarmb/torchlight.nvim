local M = {}

local DEFAULT = {
  contrast = 'hard',
  palette = 'torchlight',
}

M.opts = vim.deepcopy(DEFAULT)

--- Merge options over the ones already in force, so a later setup() that names
--- only one key leaves the rest alone. `:colorscheme torchlight` after
--- `:colorscheme torchlight-<variant>` therefore keeps the chosen contrast.
function M.set(opts)
  M.opts = vim.tbl_deep_extend('force', M.opts, opts or {})
end

--- Drop every option back to its default. Merging never clears a key, so the
--- specs need this to test a first-run setup().
function M.reset()
  M.opts = vim.deepcopy(DEFAULT)
end

return M
