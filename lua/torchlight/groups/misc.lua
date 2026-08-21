local M = {}

function M.highlight(c, opts)
  return {
    MasonNormal = { bg = c.bg0, fg = c.fg_dim },
    markdownCode = { fg = c.green },
    markdownCodeBlock = { fg = c.green },
    healthError = { fg = c.red },
    healthSuccess = { fg = c.green },
    healthWarning = { fg = c.orange },
    MiniAnimateCursor = { nocombine = true, reverse = true },
    NorgreenFloat = { fg = c.fg_dim },
    NeoscrollHiddenCursor = { blend = 100, reverse = true },

    -- Neovim's syntax/vim.vim links these to groups that disagree with the
    -- treesitter captures for the same tokens, or leaves them unlinked. Point
    -- them at the treesitter side so vimscript reads the same either way.
    -- Group names differ across Neovim versions, so both spellings appear.
    vimFunctionBang = { link = 'Special' }, -- '!' -> @punctuation.special
    vimFunctionMod = { link = 'Keyword' }, -- 'abort' -> @keyword
    vimFunctionName = { link = 'Function' }, -- unlinked upstream -> @function
    vimIsCommand = { link = 'Keyword' }, -- unlinked upstream -> @keyword
    vimFuncVar = { link = '@variable' }, -- unlinked upstream -> @variable
    vimOperParen = { link = '@variable' }, -- unlinked upstream -> @variable.parameter
    vimVar = { link = '@variable' }, -- vimFunctionParam links through this
    vimVarScope = { link = '@module' }, -- 'l:' -> @module

    lCursor = { link = 'Cursor' },
    qfFileName = { link = 'Directory' },
    qfLineNr = { link = 'LineNr' },
  }
end

return M
