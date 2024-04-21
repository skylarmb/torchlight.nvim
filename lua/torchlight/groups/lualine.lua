local M = {}

function M.highlight(c, opts)
  return {
    lualine_a_command = { bg = c.red, fg = c.fg0 },
    lualine_a_inactive = { bg = c.green_dim, fg = c.fg0 },
    lualine_a_insert = { bg = c.cyan, fg = c.fg0 },
    lualine_a_normal = { bg = c.green_dim, fg = c.fg0 },
    lualine_a_replace = { bg = c.orange, fg = c.fg0 },
    lualine_a_visual = { bg = c.yellow, fg = c.fg0 },

    lualine_b_command = { bg = c.bg2, fg = c.red_bright },
    lualine_b_inactive = { bg = c.bg0, fg = c.fg0 },
    lualine_b_insert = { bg = c.bg2, fg = c.green },
    lualine_b_normal = { bg = c.bg0, fg = c.cyan },
    lualine_b_replace = { bg = c.bg2, fg = c.red },
    lualine_b_visual = { bg = c.bg2, fg = c.blue },

    lualine_c_inactive = { bg = c.bg2, fg = c.fg2 },
    lualine_c_insert = { bg = c.bg2, fg = c.fg2 },
    lualine_c_normal = { bg = c.bg2, fg = c.fg2 },
    lualine_c_replace = { bg = c.bg2, fg = c.fg2 },
    lualine_c_terminal = { bg = c.bg2, fg = c.fg2 },
    lualine_c_visual = { bg = c.bg2, fg = c.fg2 },

    lualine_transitional_lualine_a_command_to_lualine_b_command = { bg = c.bg2, fg = c.red_bright },
  }
end

return M
