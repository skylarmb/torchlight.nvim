local M = {}

-- A misspelled color name reads as nil, which nvim_set_hl accepts as "no
-- color". The group then renders with no background and the typo is silent.
-- Raise instead. Level 2 reports the caller's line, not this one.
local function guard(palette)
  return setmetatable(palette, {
    __index = function(_, key)
      error(string.format('unknown color: %s', tostring(key)), 2)
    end,
  })
end

--- Load a palette by name and return it with the unknown-key guard attached.
function M.get(name)
  local ok, palette = pcall(require, 'torchlight.palettes.' .. name)
  if not ok then
    error(string.format('unknown palette: %s', tostring(name)), 2)
  end
  return guard(palette)
end

--- Names of every palette shipped with the theme, sorted.
function M.names()
  local names = {}
  local pattern = 'lua/torchlight/palettes/*.lua'
  for _, path in ipairs(vim.api.nvim_get_runtime_file(pattern, true)) do
    local name = vim.fn.fnamemodify(path, ':t:r')
    if name ~= 'init' then
      names[#names + 1] = name
    end
  end
  table.sort(names)
  return names
end

return M
