<h1 align="center"><code>torchlight.nvim</code></h1>

<img alt="Fishing by Torchlight in Kai Province" src="https://github.com/skylarmb/torchlight.nvim/assets/7543705/216c8205-39e0-4ee8-b1ea-2854b6c9b250"></img>

A cozy colorscheme inspired by the painting "Fishing by Torchlight in Kai Province" by Katsushika Hokusai. Hokusai lived between 1760 and 1849 and likely painted this painting around 1833.

This colorscheme adopts the natural pallette of "Fishing by Torchlight in Kai Province" and thus uses a minimal amount of blue hues. This makes it friendly on the eyes, especially at night.

## Plugin support

Supported plugins include `nvim-treesitter`, `lualine.nvim`, `nvim-tree`, `neo-tree.nvim`, `telescope.nvim`, `nvim-cmp`, `nvim-notify`, `lazy.nvim`, `gitsigns.nvim`, `neogit`, `nvim-dap-ui`, `dashboard-nvim`, `avante.nvim`, and `snacks.nvim`. Many more will work just fine with the default highlight groups. See [lua/torchlight/groups](https://github.com/skylarmb/torchlight.nvim/tree/main/lua/torchlight/groups) for the plugin-specific highlight definitions.

If you use a plugin that is not supported or looks incorrect when using this colorscheme, please [open an issue](https://github.com/skylarmb/torchlight.nvim/issues) or [pull request](https://github.com/skylarmb/torchlight.nvim/pulls).

## Usage

Install with your favorite plugin manager. See [Variants](#variants) for the
palettes and [Contrast](#contrast) for the contrast levels.

```lua
  {
    "skylarmb/torchlight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      contrast = "hard", -- possible values: medium, hard, stark (soft is deprecated)
      palette = "torchlight", -- possible values: torchlight, dusk, dawn
    },
  },
```

<details>
    <summary><code>LazyVim</code></summary>

LazyVim runs `:colorscheme` after the plugin is set up, and `:colorscheme
torchlight` selects the default palette. Naming a variant in `opts.palette`
therefore has no effect: name it in `colorscheme` instead. Contrast is not
affected either way.

```lua
  -- lua/plugins/colorscheme.lua
  {
    "skylarmb/torchlight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      contrast = "hard",
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "torchlight-dusk", -- or torchlight, torchlight-dawn
    },
  },
```

</details>

<details>
    <summary><code>pckr.nvim</code></summary>

```lua
  require("pckr").add({
    {
      "skylarmb/torchlight.nvim",
      config = function()
        require("torchlight").setup({
          contrast = "hard",
          palette = "torchlight", -- or dusk, dawn
        })
      end,
    },
  })
```

</details>

## Variants

Three palettes ship with the theme. `torchlight` is the default and is
unchanged.

| Palette | `:colorscheme` | Description |
| --- | --- | --- |
| `torchlight` | `torchlight` | The original, mixed by hand. |
| `dusk` | `torchlight-dusk` | A deep base with warm chroma carried into the neutrals. |
| `dawn` | `torchlight-dawn` | Pale and cool, every colour kept off the gamut wall. |

`dusk` and `dawn` are built from HSLuv specs, so their ramps step evenly in
perceived lightness. Every palette holds the low-blue goal.

Select one with the `palette` option or by name:

```vim
colorscheme torchlight-dusk
```

Every contrast level works with every palette.

Whichever of the two names the palette last wins, and `:colorscheme` always
names one: `:colorscheme torchlight` returns to the default palette. Contrast is
never affected, so `:colorscheme torchlight-dawn` keeps the level already in
force.

## Contrast

Four levels of contrast are available, set via the `contrast` option. `hard` is the default.

`soft` is deprecated. It still works and will keep working, but it is no longer maintained. New colors and fixes are not applied to it. Use `medium` for the closest supported look.

## Screenshots

Palettes run light to dark left to right, contrast levels light to dark top to
bottom.

|                     | `dawn`        | `torchlight`        | `dusk`        |
| ------------------- | ------------- | ------------------- | ------------- |
| `soft` (deprecated) | dawn soft     | torchlight soft     | dusk soft     |
| `medium`            | dawn medium   | torchlight medium   | dusk medium   |
| `hard` (default)    | dawn hard     | torchlight hard     | dusk hard     |
| `stark`             | dawn stark    | torchlight stark    | dusk stark    |

## Extras / ports

The `./extras` folder holds ports of the palette for other tools. Current ports cover Alacritty, WezTerm, Ghostty, and Zed. Other ports are welcome.

## Credits

- [`no-clown-fiesta.nvim`](https://github.com/aktersnurra/no-clown-fiesta.nvim/tree/master) for the overall plugin source structure
- [`kanagawa.nvim`](https://github.com/rebelot/kanagawa.nvim) for the Hokusai inspiration
- [`gruvbox.nvim`](https://github.com/ellisonleao/gruvbox.nvim) for the general color<->highlight mapping
