-- Torchlight color scheme for WezTerm
-- Uncomment one of the background options below to set contrast level

-- Contrast levels (uncomment one):
local bg = "#1E1D1D"  -- medium (default)
-- local bg = "#252424"  -- soft
-- local bg = "#131312"  -- hard
-- local bg = "#0d0d0d"  -- stark

local fg = "#E3CA9A"
-- local fg = "#E8D2A9"  -- alternative foreground (brighter)

config.colors = {
    -- Default colors
    foreground = fg,
    background = bg,

    -- Normal colors
    ansi = {
        bg, -- black
        "#D0654B", -- red
        "#979764", -- green
        "#E3A138", -- yellow
        "#848A68", -- blue
        "#D97E4A", -- magenta
        "#799173", -- cyan
        "#E3CA9A", -- white
    },

    -- Bright colors
    brights = {
        "#575547", -- bright black
        "#D0654B", -- bright red
        "#979764", -- bright green
        "#E3A138", -- bright yellow
        "#848A68", -- bright blue
        "#D97E4A", -- bright magenta
        "#799173", -- bright cyan
        "#E8D2A9", -- bright white
    },

    -- Other settings
    cursor_fg = bg,
    cursor_bg = fg,
    selection_fg = bg,
    selection_bg = fg,
}
