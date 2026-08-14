local M = {}

function M.setup(user_opts)
  local settings = require('torchlight.settings')
  if user_opts then
    settings.set(user_opts)
  end

  -- Read back through settings so defaults are applied for absent keys.
  local opts = settings.opts

  vim.api.nvim_command('hi clear')
  if vim.fn.exists('syntax_on') then
    vim.api.nvim_command('syntax reset')
  end

  vim.o.background = 'dark'
  vim.o.termguicolors = true
  vim.g.colors_name = 'torchlight'

  local util = require('torchlight.util')
  local colors = require('torchlight.colors')
  local groups = require('torchlight.groups')

  for _, group in ipairs(groups) do
    group = group.highlight(colors, opts)
    util.initialise(group)
  end

  require('torchlight.term').highlight(colors)
end

return M
