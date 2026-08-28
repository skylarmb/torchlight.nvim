local CONTRASTS = { 'soft', 'medium', 'hard', 'stark' }
local PALETTES = require('torchlight.palettes').names()

--- Resolve a group to its final attributes, following any link.
local function get_hl(name)
  return vim.api.nvim_get_hl(0, { name = name, link = false })
end

--- Names of every group the theme defines.
--- Scanning nvim's whole highlight table instead would pick up built-in and
--- third-party groups, which the theme does not control.
local function defined_groups(contrast, palette)
  local colors = require('torchlight.palettes').get(palette or 'torchlight')
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

    -- setup() with no options must resolve to the documented default. This
    -- also fixes the background that vimcolorschemes.com renders, because
    -- its extractor runs a bare `:colorscheme torchlight`.
    it('defaults to hard contrast', function()
      require('torchlight.settings').reset()
      require('torchlight').setup()
      assert.equals('hard', require('torchlight.settings').opts.contrast)
      assert.equals(0x131312, get_hl('Normal').bg)
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

    it('raises on an unknown palette name', function()
      assert.has_error(function()
        require('torchlight.palettes').get('definitely_not_a_palette')
      end)
    end)

    -- A group reads whichever colors it names regardless of the palette in
    -- force, and the guard raises on a missing one. Parity is what keeps a
    -- variant from failing only on a plugin nobody tested it against.
    for _, palette in ipairs(PALETTES) do
      it('defines the same keys as torchlight in ' .. palette, function()
        local function keys(name)
          local out = {}
          for key in pairs(require('torchlight.palettes.' .. name)) do
            out[#out + 1] = key
          end
          table.sort(out)
          return out
        end
        assert.same(keys('torchlight'), keys(palette))
      end)
    end
  end)

  describe('variants', function()
    for _, palette in ipairs(PALETTES) do
      local name = palette == 'torchlight' and 'torchlight' or 'torchlight-' .. palette

      it('load via :colorscheme ' .. name, function()
        assert.has_no.errors(function()
          vim.cmd.colorscheme(name)
        end)
        assert.equals(name, vim.g.colors_name)
      end)

      -- The same defect the default palette is checked for, applied to every
      -- variant. A generated ramp can land a foreground on a background.
      it('never set fg equal to bg in ' .. palette, function()
        require('torchlight.settings').reset()
        require('torchlight').setup({ palette = palette })
        local offenders = {}
        for _, group in ipairs(defined_groups('hard', palette)) do
          local hl = get_hl(group)
          if hl.fg and hl.bg and hl.fg == hl.bg then
            table.insert(offenders, string.format('%s (#%06X)', group, hl.fg))
          end
        end
        table.sort(offenders)
        assert.same({}, offenders)
      end)
    end

    -- Switching back must actually switch back, and must not silently reset
    -- an option the user set earlier.
    it('return to the default palette and keep the contrast', function()
      require('torchlight.settings').reset()
      require('torchlight').setup({ contrast = 'stark' })
      vim.cmd.colorscheme('torchlight-dusk')
      vim.cmd.colorscheme('torchlight')
      assert.equals('torchlight', vim.g.colors_name)
      assert.equals('stark', require('torchlight.settings').opts.contrast)
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
    -- Visual must stay clear of every background it can be drawn over. The
    -- value changes per contrast level, so check each level.
    for _, contrast in ipairs(CONTRASTS) do
      it('keeps Visual distinct from diff backgrounds at contrast=' .. contrast, function()
        require('torchlight').setup({ contrast = contrast })
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
          'DiffText',
          'CursorLine',
          'Normal',
          'Search',
          'IncSearch',
        }) do
          if get_hl(name).bg == visual then
            table.insert(clashes, name)
          end
        end
        assert.same({}, clashes)
      end)
    end
  end)
end)
