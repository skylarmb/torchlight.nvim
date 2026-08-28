-- Perceptual report on a torchlight palette, printed to stdout.
--
-- HSLuv is a perceptually uniform restatement of sRGB: equal steps in L look
-- equal to the eye, and H holds steady as L changes. Reading the palette
-- through it shows where a ramp that looks regular in hex is not regular in
-- perception.
--
-- Run from the repo root, inside the dev shell:
--   nix develop --command lua scripts/hsluv-report.lua [palette-module]
--
-- Deliberately a dev tool, not part of the plugin. The committed palettes hold
-- plain hex strings, so nvim never loads hsluv at runtime.

package.path = './lua/?.lua;./lua/?/init.lua;' .. package.path

local hsluv = require('hsluv')
local palette = require(arg[1] or 'torchlight.colors')

-- Copy out from behind the palette's unknown-key metatable, which raises.
local raw = {}
for name, hex in pairs(palette) do
  raw[name] = hex
end

local function hsluv_of(hex)
  local t = hsluv.hex_to_hsluv(hex)
  return t[1], t[2], t[3]
end

--- CIELAB coordinates, for a distance the eye agrees with.
local function lab_of(hex)
  local lch = hsluv.rgb_to_lch(hsluv.hex_to_rgb(hex))
  local L, C, H = lch[1], lch[2], math.rad(lch[3])
  return L, C * math.cos(H), C * math.sin(H)
end

--- CIE76 colour difference. Under 2.3 is the just-noticeable threshold.
local function delta_e(a, b)
  local l1, a1, b1 = lab_of(a)
  local l2, a2, b2 = lab_of(b)
  return math.sqrt((l1 - l2) ^ 2 + (a1 - a2) ^ 2 + (b1 - b2) ^ 2)
end

--- WCAG 2.x contrast ratio, which the accessibility thresholds are stated in.
local function contrast(a, b)
  local function luminance(hex)
    local rgb = hsluv.hex_to_rgb(hex)
    local function channel(c)
      return c <= 0.03928 and c / 12.92 or ((c + 0.055) / 1.055) ^ 2.4
    end
    return 0.2126 * channel(rgb[1]) + 0.7152 * channel(rgb[2]) + 0.0722 * channel(rgb[3])
  end
  local x, y = luminance(a), luminance(b)
  if x < y then
    x, y = y, x
  end
  return (x + 0.05) / (y + 0.05)
end

--- Least-squares fit of L against position, so the ideal ramp is the one the
--- palette is already reaching for rather than an invented one.
local function fit_lightness(values)
  local n = #values
  local sx, sy, sxx, sxy = 0, 0, 0, 0
  for i, y in ipairs(values) do
    sx, sy, sxx, sxy = sx + i, sy + y, sxx + i * i, sxy + i * y
  end
  local slope = (n * sxy - sx * sy) / (n * sxx - sx * sx)
  return slope, (sy - slope * sx) / n
end

local RAMPS = {
  { 'background ladder', { 'bg_stark', 'bg_dim', 'bg0', 'bg1', 'bg2', 'bg3', 'bg4', 'bg5' } },
  { 'grey ladder', { 'grey0', 'grey1', 'grey2' } },
  { 'foreground ladder', { 'fg_bright', 'fg0', 'fg1', 'fg2', 'fg3', 'fg4', 'fg5', 'fg_dim' } },
  { 'accent backgrounds', { 'bg_select', 'bg_bright' } },
  {
    'accents',
    {
      'blue',
      'cyan',
      'green',
      'green_dim',
      'orange',
      'orange_dim',
      'red',
      'red_dim',
      'red_bright',
      'yellow',
      'yellow_bright',
      'yellow_light',
      'yellow_dim',
    },
  },
}

-- Ramps whose lightness should step evenly. `steady` marks the ones that
-- should also hold one hue; for those the report synthesises the ideal ramp
-- and measures the distance to it.
--
-- The foreground ramp is not one of them. sRGB holds the most chroma near hue
-- 40 at lightness 62 and near hue 67 at lightness 86, so a foreground that
-- stays rich has to warm as it darkens. Reporting that drift as error would
-- argue for a paler ramp.
local EVEN_RAMPS = {
  { keys = { 'bg0', 'bg1', 'bg2', 'bg3', 'bg4', 'bg5' }, steady = true },
  { keys = { 'grey0', 'grey1', 'grey2' }, steady = true },
  { keys = { 'fg0', 'fg1', 'fg2', 'fg3', 'fg4', 'fg5' } },
}

print('== coordinates')
for _, ramp in ipairs(RAMPS) do
  print('-- ' .. ramp[1])
  local prev
  for _, name in ipairs(ramp[2]) do
    local H, S, L = hsluv_of(raw[name])
    local step = ''
    if prev then
      step = string.format('   dL %+6.2f  dH %+6.1f  dS %+6.1f', L - prev.L, H - prev.H, S - prev.S)
    end
    print(
      string.format('  %-13s %-8s  H %6.1f  S %5.1f  L %5.1f%s', name, raw[name], H, S, L, step)
    )
    prev = { H = H, S = S, L = L }
  end
  print('')
end

print('== lightness evenness')
for _, ramp in ipairs(EVEN_RAMPS) do
  local names = ramp.keys
  local hues, sats, lums = {}, {}, {}
  for i, name in ipairs(names) do
    hues[i], sats[i], lums[i] = hsluv_of(raw[name])
  end
  local slope, intercept = fit_lightness(lums)
  local function mean(t)
    local sum = 0
    for _, v in ipairs(t) do
      sum = sum + v
    end
    return sum / #t
  end
  local hue, saturation = mean(hues), mean(sats)
  print(
    string.format(
      '-- %s..%s   L %.1f %+.2f/step',
      names[1],
      names[#names],
      intercept + slope,
      slope
    )
  )
  for i, name in ipairs(names) do
    local even = intercept + slope * i
    local detail = ''
    if ramp.steady then
      -- Only a ramp meant to hold one hue has a single-hue ideal to compare to.
      local ideal = hsluv.hsluv_to_hex({ hue, saturation, math.max(0, math.min(100, even)) })
      detail = string.format('   even+steady %s  dE %5.2f', ideal, delta_e(raw[name], ideal))
    end
    print(
      string.format('  %-13s %s   off-even dL %+5.2f%s', name, raw[name], lums[i] - even, detail)
    )
  end
  print('')
end

print('== pairs the eye cannot separate (dE < 2.3)')
local names = {}
for name in pairs(raw) do
  if name ~= 'debug' then
    names[#names + 1] = name
  end
end
table.sort(names)
for i = 1, #names do
  for j = i + 1, #names do
    local a, b = names[i], names[j]
    local d = delta_e(raw[a], raw[b])
    if d < 2.3 then
      local note = raw[a]:lower() == raw[b]:lower() and '  (identical)' or ''
      print(string.format('  %-13s %-13s dE %5.2f%s', a, b, d, note))
    end
  end
end

print('\n== contrast against bg0 (' .. raw.bg0 .. ')')
local foregrounds = {}
for _, name in ipairs(names) do
  if not name:match('^bg') then
    foregrounds[#foregrounds + 1] = name
  end
end
table.sort(foregrounds, function(a, b)
  return contrast(raw[a], raw.bg0) < contrast(raw[b], raw.bg0)
end)
for _, name in ipairs(foregrounds) do
  local ratio = contrast(raw[name], raw.bg0)
  print(
    string.format(
      '  %-13s %s  WCAG %5.2f%s',
      name,
      raw[name],
      ratio,
      ratio < 4.5 and '  below AA' or ''
    )
  )
end

print('\n== saturation headroom in sRGB')
-- HSLuv S is a percentage of the most chroma sRGB can hold at that lightness
-- and hue. Near 100 a colour is pinned to the gamut wall, so it cannot be
-- brightened or deepened without the hue sliding.
local saturated = {}
for _, name in ipairs(names) do
  local H, S, L = hsluv_of(raw[name])
  if S > 20 then
    saturated[#saturated + 1] = { name = name, H = H, S = S, L = L }
  end
end
table.sort(saturated, function(a, b)
  return b.S < a.S
end)
for _, entry in ipairs(saturated) do
  print(
    string.format(
      '  %-13s H %6.1f  S %5.1f  L %5.1f%s',
      entry.name,
      entry.H,
      entry.S,
      entry.L,
      entry.S > 80 and '  pinned to the gamut wall' or ''
    )
  )
end
