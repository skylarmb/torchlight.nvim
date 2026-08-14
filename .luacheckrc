-- luacheck configuration for torchlight.nvim

std = 'luajit'

-- Neovim's API table. The plugin declares no other globals.
read_globals = { 'vim' }

-- Applying a colorscheme means writing editor state: vim.g.colors_name,
-- vim.g.terminal_color_*, vim.o.background, vim.o.termguicolors.
globals = { 'vim.g', 'vim.o' }

-- Every groups/*.lua module implements highlight(colors, opts). Most groups
-- ignore opts, but the signature stays uniform because init.lua calls them
-- all through one loop. An unused opts is deliberate here, not a defect.
unused_args = false

exclude_files = {
  -- Terminal emulator colorschemes, not plugin source. They run under their
  -- own Lua runtimes with different globals.
  'extras/',
  -- direnv's nix profile symlinks.
  '.direnv/',
}
