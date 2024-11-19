local M = {}

function M.highlight(c, opts)
  local normalBg = c.bg0
  local normalFg = c.fg0
  local brightFg = c.fg_bright
  local cursorLineBg = c.bg1

  if opts.contrast == 'hard' then
    normalBg = c.bg_dim
    cursorLineBg = c.bg0
  end
  if opts.contrast == 'soft' then
    normalBg = c.bg2
    cursorLineBg = c.bg3
  end

  return {
    Bold = { bold = true },
    Boolean = { fg = c.orange },
    ColorColumn = { bg = c.bg3 },
    Comment = { fg = c.grey2, italic = true },
    Conceal = { fg = c.green },
    Constant = { fg = c.fg3 },
    Cursor = { bg = brightFg, fg = c.bg1 },
    CursorLine = { bg = cursorLineBg },
    CursorLineNr = { bg = cursorLineBg, bold = true, fg = c.yellow },
    Delimiter = { fg = c.fg1 },
    Directory = { fg = c.green },
    EndOfBuffer = { fg = c.bg1 },
    Error = { fg = c.red_bright },
    ErrorMsg = { fg = c.red_bright },
    Exception = { fg = c.red_bright },
    ExtraWhitespace = { bg = c.bg_5, ctermbg = 9 },
    FloatBorder = { bg = c.bg0, fg = c.fg1 },
    FloatShadow = { bg = '#000000', blend = 60 },
    FloatShadowThrough = { bg = '#000000', blend = 100 },
    FloatTitle = { bold = true, fg = c.green },
    FloatermBorder = { bg = c.bg2, fg = c.fg1 },
    Folded = { bg = c.bg3, fg = c.green },
    Function = { fg = c.blue },
    Identifier = { fg = normalFg },
    Keyword = { fg = c.orange },
    LineNr = { bg = cursorLineBg, fg = c.grey1 },
    MatchParen = { bold = true, fg = c.orange },
    ModeMsg = { bold = true, fg = c.orange },
    MoreMsg = { fg = c.cyan },
    MsgArea = { fg = c.fg_dim },
    MsgSeparator = { bg = c.bg0 },
    NonText = { fg = c.grey0 },
    Normal = { bg = normalBg, fg = normalFg },
    NormalDark = { bg = c.bg0, fg = c.fg_dim },
    NormalNC = { bg = cursorLineBg, fg = normalFg },
    Number = { fg = c.orange },
    NvimInternalError = { bg = c.bg_5, ctermbg = 9, ctermfg = 9, fg = c.red_bright },
    Operator = { fg = c.red },
    Pmenu = { bg = c.bg2, fg = normalFg },
    PmenuSbar = { bg = c.bg2, fg = c.fg_dim },
    PmenuSel = { bg = c.bg5 },
    PmenuThumb = { bg = c.bg2, fg = c.fg_dim },
    PreProc = { fg = c.red },
    QuickFixLine = { bg = c.bg4 },
    RedrawDebugClear = { bg = c.bg5, ctermbg = 11 },
    RedrawDebugComposed = { bg = c.green_dim, ctermbg = 10 },
    RedrawDebugRecompose = { bg = c.bg_5, ctermbg = 9 },
    Search = { bg = c.grey0, fg = c.cyan },
    Special = { fg = c.yellow },
    SpecialKey = { fg = c.green },
    SpellBad = { sp = c.red_bright, undercurl = true },
    SpellCap = { sp = c.orange, undercurl = true },
    SpellLocal = { sp = c.orange, undercurl = true },
    SpellRare = { sp = c.orange, undercurl = true },
    Statement = { bold = true, fg = c.yellow_bright },
    StatusLine = { bg = c.bg0, fg = c.fg_dim },
    StatusLineNC = { bg = c.bg0, fg = c.grey0 },
    String = { fg = c.green, italic = true },
    Substitute = { bg = c.bg5, fg = c.cyan },
    Title = { bold = true, fg = c.green },
    Todo = { bg = c.bg5, bold = true, fg = c.cyan },
    Type = { fg = c.yellow },
    Underlined = { fg = c.yellow, underline = true },
    Visual = { bg = c.grey0 },
    WarningMsg = { fg = c.orange },
    Whitespace = { fg = c.bg5 },
    WinBar = { fg = c.fg_dim },
    WinBarNC = { bg = c.bg_dim, fg = c.fg_dim },
    WinSeparator = { bg = c.bg_dim, fg = c.bg0 },

    -- Links
    Question = { link = 'MoreMsg' },
    VertSplit = { link = 'WinSeparator' },
    VisualNOS = { link = 'Visual' },
    WildMenu = { link = 'Pmenu' },
    SignColumn = { link = 'LineNr' },
    Character = { link = 'String' },
    CursorColumn = { link = 'CursorLine' },
    CursorIM = { link = 'Cursor' },
    FoldColumn = { link = 'LineNr' },
    Ignore = { link = 'NonText' },
    IncSearch = { bg = c.grey1, fg = c.yellow_bright },
    CurSearch = { link = 'IncSearch' },
    Italic = { italic = true },
  }
end

return M
