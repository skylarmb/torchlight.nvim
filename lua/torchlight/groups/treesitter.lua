local M = {}

function M.highlight(c, opts)
  return {
    ['@variable'] = { fg = c.fg1 },
    ['@parameter'] = { fg = c.green },
    ['@punctuation.bracket'] = { fg = c.fg_dim },
    ['@constructor.lua'] = { fg = c.fg5 },
    ['@attribute'] = { link = 'Constant' },
    ['@character.special'] = { link = 'SpecialChar' },
    ['@constant.builtin'] = { link = 'Special' },
    ['@constant.macro'] = { link = 'Define' },
    ['@constructor'] = { fg = c.yellow },
    ['@exception'] = { fg = c.red_bright },
    ['@function.builtin'] = { link = 'Special' },
    ['@function.macro'] = { link = 'Macro' },
    ['@keyword.luap'] = { link = '@string.regex' },
    ['@keyword.operator'] = { fg = c.red_bright },
    ['@keyword.return'] = { fg = c.red_bright, italic = true },
    ['@lsp.mod.readonly'] = { link = 'Constant' },
    ['@lsp.mod.typeHint'] = { link = 'Type' },
    ['@lsp.type.builtinConstant'] = { link = '@constant.builtin' },
    ['@lsp.type.class'] = { link = 'Structure' },
    ['@lsp.type.comment'] = { link = 'Comment' },
    ['@lsp.type.decorator'] = { link = 'Function' },
    ['@lsp.type.enum'] = { link = 'Structure' },
    ['@lsp.type.enumMember'] = { link = 'Constant' },
    ['@lsp.type.function'] = { link = 'Function' },
    ['@lsp.type.interface'] = { link = 'Structure' },
    ['@lsp.type.macro'] = { link = 'Macro' },
    ['@lsp.type.magicFunction'] = { link = '@function.builtin' },
    ['@lsp.type.method'] = { link = '@method' },
    ['@lsp.type.namespace'] = { link = '@namespace' },
    ['@lsp.type.parameter'] = { link = '@parameter' },
    ['@lsp.type.property'] = { link = 'Identifier' },
    ['@lsp.type.selfParameter'] = { link = '@variable.builtin' },
    ['@lsp.type.struct'] = { link = 'Structure' },
    ['@lsp.type.type'] = { link = 'Type' },
    ['@lsp.type.typeParameter'] = { link = 'Typedef' },
    ['@lsp.type.variable'] = { fg = c.fg3 },
    ['@lsp.typemod.function.builtin'] = { link = '@function.builtin' },
    ['@lsp.typemod.function.defaultLibrary'] = { link = '@function.builtin' },
    ['@lsp.typemod.function.readonly'] = { link = 'Function' },
    ['@lsp.typemod.keyword.documentation'] = { link = 'Special' },
    ['@lsp.typemod.method.defaultLibrary'] = { link = '@function.builtin' },
    ['@lsp.typemod.operator.controlFlow'] = { link = '@exception' },
    ['@lsp.typemod.operator.injected'] = { link = 'Operator' },
    ['@lsp.typemod.string.injected'] = { link = 'String' },
    ['@lsp.typemod.variable.defaultLibrary'] = { link = 'Special' },
    ['@lsp.typemod.variable.global'] = { link = 'Constant' },
    ['@lsp.typemod.variable.injected'] = { link = '@variable' },
    ['@lsp.typemod.variable.static'] = { link = 'Constant' },
    ['@punctuation.delimiter'] = { fg = c.fg_dim },
    ['@punctuation.special'] = { fg = c.yellow },
    ['@string.escape'] = { fg = c.red_bright },
    ['@string.regex'] = { fg = c.green },
    ['@string.special'] = { link = 'SpecialChar' },
    ['@symbol'] = { fg = c.fg1 },
    ['@tag.attribute'] = { fg = c.fg1 },
    ['@tag.delimiter'] = { link = '@constructor' },
    ['@text.danger'] = { bg = c.fg4, fg = c.fg_bright },
    ['@text.diff.add'] = { fg = c.green },
    ['@text.diff.delete'] = { fg = c.red_bright },
    ['@text.emphasis'] = { italic = true },
    ['@text.environment'] = { link = 'Keyword' },
    ['@text.environment.name'] = { link = 'String' },
    ['@text.literal'] = { link = 'String' },
    ['@text.math'] = { link = 'Constant' },
    ['@text.note'] = { bg = c.bg_bright, fg = c.fg1 },
    ['@text.quote'] = { link = '@parameter' },
    ['@text.reference'] = { link = 'Identifier' },
    ['@text.strong'] = { bold = true },
    ['@text.title'] = { link = 'Function' },
    ['@text.todo'] = { link = 'Todo' },
    ['@text.underline'] = { link = 'Underlined' },
    ['@text.uri'] = { link = 'Underlined' },
    ['@text.warning'] = { bg = c.fg4, fg = c.yellow },
    ['@type.definition'] = { link = 'Typedef' },
    ['@variable.builtin'] = { fg = c.red, italic = true },
    TSPlaygroundFocus = { bg = c.grey0 },
    TSPlaygroundLang = { fg = c.green },
    TSQueryLinterError = { fg = c.red_bright },
    TreesitterContext = { link = 'Folded' },
    TreesitterContextBottom = {},
    TreesitterContextLineNumber = { bg = c.bg4, fg = c.green },
  }
end

return M
