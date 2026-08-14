local M = {
  bg_stark = '#0d0d0d',
  bg_dim = '#131312',
  bg0 = '#1E1D1D',
  bg1 = '#212120',
  bg2 = '#252424',
  bg3 = '#292827',
  bg4 = '#2D2C2B',
  bg5 = '#302F2E',
  -- Emphasis background, painted on top of another background (DiffText over
  -- DiffChange, LspReferenceWrite). Sits above the bg ladder so it stays
  -- readable when stacked.
  bg_bright = '#4C4A3E',

  fg0 = '#E3CA9A',
  fg1 = '#DCBB7E',
  fg2 = '#D5AF67',
  fg3 = '#CFA351',
  fg4 = '#C9973A',
  fg5 = '#C49138',
  fg_bright = '#E8D2A9',
  fg_dim = '#C6AA77',

  debug = '#FF00FF',

  blue = '#848A68',
  cyan = '#799173',
  green = '#979764',
  green_dim = '#7E7B4C',
  grey0 = '#414035',
  grey1 = '#575547',
  grey2 = '#6c6b58',
  orange = '#D97E4A',
  orange_dim = '#8C5627',
  red = '#c48b6d',
  red_dim = '#B5412C',
  red_bright = '#D0654B',
  yellow_light = '#D2A860',
  yellow = '#E3A138',
  yellow_bright = '#E3A138',
  yellow_dim = '#D9923B',
}

-- A misspelled color name reads as nil, which nvim_set_hl accepts as "no
-- color". The group then renders with no background and the typo is silent.
-- Raise instead. Level 2 reports the caller's line, not this one.
return setmetatable(M, {
  __index = function(_, key)
    error(string.format('unknown color: %s', tostring(key)), 2)
  end,
})
