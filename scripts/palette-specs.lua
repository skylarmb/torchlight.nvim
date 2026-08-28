-- Specs for the experimental palettes, read by scripts/gen-hsluv-palette.lua.
--
-- Coordinates are HSLuv: hue 0-360, saturation 0-100 as a share of the most
-- chroma sRGB can hold at that hue and lightness, lightness 0-100 as the eye
-- reads it. HSLuv never leaves the gamut, so any triple here is renderable.
--
-- A ramp's `l` is a range the generator spaces evenly, which is the point of
-- the experiment. `h` and `s` take a scalar to hold steady or a {from, to}
-- pair to move across the ramp.
--
-- The low-blue goal is held throughout: no hue sits in the blue arc. `blue`
-- and `cyan` are ANSI slot names, not colour descriptions, so they stay green.
--
-- HSLuv saturation is a share of a ceiling that collapses as lightness rises,
-- so a ramp that holds saturation loses colour at its light end. State chroma
-- wherever a ramp has to stay rich. Where a ramp is meant to pale as it
-- lightens, saturation says that directly and is the better unit.

--- Ramps shared in shape by every spec; only the coordinates differ. Each
--- argument carries its own hue, lightness range, and either a saturation or a
--- chroma, so a ramp can be stated in whichever the design calls for.
local function ramps(bg, grey, fg)
  bg.keys = { 'bg0', 'bg1', 'bg2', 'bg3', 'bg4', 'bg5' }
  grey.keys = { 'grey0', 'grey1', 'grey2' }
  fg.keys = { 'fg0', 'fg1', 'fg2', 'fg3', 'fg4', 'fg5' }
  return { bg, grey, fg }
end

return {

  {
    name = 'dusk',
    description = 'Dusk: a deep base with warm chroma carried into the neutrals.',
    -- Backgrounds hold real saturation at a warm hue, so the whole window
    -- reads as lit by the flame rather than as grey with warm text on it.
    ramps = ramps(
      { h = 32, s = 14, l = { 8, 24 } },
      { h = 74, s = 32, l = { 32, 50 } },
      -- The foreground hue is free of the background hue. sRGB holds the most
      -- chroma near hue 40 at lightness 62 and near hue 67 at lightness 86, so
      -- a ramp that wants to stay rich has to warm as it darkens. That is the
      -- drift the hand-mixed palette already had. Chroma rather than
      -- saturation, so the light end keeps its colour.
      { h = { 64, 48 }, c = { 44, 72 }, l = { 83, 62 } }
    ),
    colors = {
      bg_stark = { 32, 14, 2.5 },
      bg_dim = { 32, 14, 5 },
      bg_select = { 66, 26, 27 },
      bg_bright = { 66, 30, 38 },
      fg_bright = { h = 66, c = 38, l = 86 },
      fg_dim = { h = 58, c = 44, l = 72 },
      blue = { 96, 46, 55 },
      cyan = { 118, 38, 58 },
      green = { 88, 62, 60 },
      green_dim = { 86, 56, 48 },
      orange = { 30, 84, 60 },
      orange_dim = { 32, 78, 42 },
      red = { 28, 56, 62 },
      red_dim = { 12, 78, 42 },
      red_bright = { 16, 76, 56 },
      yellow = { 48, 86, 70 },
      yellow_bright = { 50, 84, 79 },
      yellow_light = { 54, 68, 73 },
      yellow_dim = { 44, 82, 64 },
      debug = '#FF00FF',
    },
  },

  {
    name = 'dawn',
    description = 'Dawn: pale and cool, every colour kept off the gamut wall.',
    -- Every colour stays clear of the gamut wall, so each one can still be
    -- brightened or deepened later without its hue sliding.
    --
    -- The foreground holds one hue: this palette is meant to read cool and
    -- even, not to chase chroma the way dusk does. Chroma rather than
    -- saturation, because against the falling ceiling a steady saturation
    -- washes the light end out to near white.
    ramps = ramps(
      { h = 68, s = 5, l = { 10, 22 } },
      { h = 86, s = 20, l = { 28, 46 } },
      { h = 62, c = { 37, 48 }, l = { 85, 65 } }
    ),
    colors = {
      bg_stark = { 68, 5, 3 },
      bg_dim = { 68, 5, 6 },
      bg_select = { 84, 16, 26 },
      bg_bright = { 84, 20, 33 },
      fg_bright = { h = 62, c = 30, l = 89 },
      fg_dim = { 62, 32, 73 },
      blue = { 104, 34, 58 },
      cyan = { 124, 26, 61 },
      green = { 94, 46, 63 },
      green_dim = { 92, 42, 51 },
      orange = { 34, 64, 64 },
      orange_dim = { 36, 60, 46 },
      red = { 32, 42, 65 },
      red_dim = { 16, 60, 46 },
      red_bright = { 20, 58, 60 },
      yellow = { 52, 66, 73 },
      yellow_bright = { 54, 62, 81 },
      yellow_light = { 58, 50, 75 },
      yellow_dim = { 48, 62, 68 },
      debug = '#FF00FF',
    },
  },
}
