local CONTRASTS = { 'soft', 'medium', 'hard', 'stark' }

--- Resolve a group to its final attributes, following any link.
local function get_hl(name)
  return vim.api.nvim_get_hl(0, { name = name, link = false })
end

--- Names of every group the theme defines.
--- Scanning nvim's whole highlight table instead would pick up built-in and
--- third-party groups, which the theme does not control.
local function defined_groups(contrast)
  local colors = require('torchlight.colors')
  local opts = { contrast = contrast }
  local names = {}
  for _, module in ipairs(require('torchlight.groups')) do
    for name in pairs(module.highlight(colors, opts)) do
      names[#names + 1] = name
    end
  end
  return names
end

describe('torchlight', function()
  describe('loads', function()
    -- nvim_set_hl rejects both unknown keys and malformed colors, and the
    -- palette raises on an unknown color name. So a clean setup() proves
    -- every group in the theme is well formed.
    for _, contrast in ipairs(CONTRASTS) do
      it('with contrast=' .. contrast, function()
        assert.has_no.errors(function()
          require('torchlight').setup({ contrast = contrast })
        end)
        assert.equals('torchlight', vim.g.colors_name)
      end)
    end

    it('via :colorscheme', function()
      assert.has_no.errors(function()
        vim.cmd.colorscheme('torchlight')
      end)
    end)
  end)

  describe('palette', function()
    it('raises on an unknown color name', function()
      local colors = require('torchlight.colors')
      assert.has_error(function()
        return colors.definitely_not_a_color
      end)
    end)

    it('exposes defined colors', function()
      assert.equals('#302F2E', require('torchlight.colors').bg5)
    end)
  end)

  describe('highlights', function()
    before_each(function()
      require('torchlight').setup({ contrast = 'medium' })
    end)

    -- A group whose text matches its own background is unreadable. This is
    -- the defect reported in issue #2, where neogit derived NeogitDiffAdd
    -- from DiffAdd and landed on green-on-green. The picker border groups
    -- hit the same defect and hid their own box-drawing characters. The
    -- theme has no legitimate use for fg equal to bg, so allow no exception.
    for _, contrast in ipairs(CONTRASTS) do
      it('never sets fg equal to bg at contrast=' .. contrast, function()
        require('torchlight').setup({ contrast = contrast })
        local offenders = {}
        for _, name in ipairs(defined_groups(contrast)) do
          local hl = get_hl(name)
          if hl.fg and hl.bg and hl.fg == hl.bg then
            table.insert(offenders, string.format('%s (#%06X)', name, hl.fg))
          end
        end
        table.sort(offenders)
        assert.same({}, offenders)
      end)
    end

    -- Neogit only defines a highlight group the colorscheme left unset, and
    -- it derives the missing ones from DiffAdd/DiffDelete. Define all three
    -- display states here so none of them are guessed.
    it('defines every neogit diff state', function()
      local missing = {}
      for _, kind in ipairs({ 'Add', 'Delete', 'Context' }) do
        for _, state in ipairs({ '', 'Highlight', 'Cursor' }) do
          local name = 'NeogitDiff' .. kind .. state
          if not next(get_hl(name)) then
            table.insert(missing, name)
          end
        end
      end
      assert.same({}, missing)
    end)

    -- A selection painted the same color as the line under it is invisible.
    -- Visual must stay clear of every background it can be drawn over.
    it('keeps Visual distinct from diff backgrounds', function()
      local visual = get_hl('Visual').bg
      local clashes = {}
      for _, name in ipairs({
        'NeogitDiffAdd',
        'NeogitDiffAddHighlight',
        'NeogitDiffAddCursor',
        'NeogitDiffDelete',
        'NeogitDiffDeleteHighlight',
        'NeogitDiffContext',
        'NeogitDiffContextHighlight',
        'GitSignsAddLn',
        'GitSignsAddPreview',
        'DiffAdd',
        'DiffChange',
        'DiffDelete',
        'CursorLine',
      }) do
        if get_hl(name).bg == visual then
          table.insert(clashes, name)
        end
      end
      assert.same({}, clashes)
    end)
  end)
end)
