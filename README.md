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
      contrast = "hard", -- available: soft, medium, hard, stark
      palette = "torchlight", -- available: dusk, torchlight, dawn
    },
  },
```

<details>
    <summary><code>LazyVim</code></summary>

LazyVim runs `:colorscheme` after the plugin is set up, and `:colorscheme
torchlight` selects the default palette. To use a specific palette, you must name it in `colorscheme` instead of in `opts`. Contrast is not
affected either way and should still be set in `opts`.

```lua
  -- lua/plugins/colorscheme.lua
  {
    "skylarmb/torchlight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      contrast = "hard", -- available: soft, medium, hard, stark
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "torchlight", -- available: torchlight-dusk, torchlight, torchlight-dawn
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
          contrast = "hard", -- available: soft, medium, hard, stark
          palette = "torchlight", -- available: dusk, torchlight, dawn
        })
      end,
    },
  })
```

</details>

## Variants

Torchlight has three available color palettes. All palettes stay true to my original goal of providing a low-blue theme that is friendly on the eyes. Dusk and Dawn palettes are deterministically derived using [HSLuv](https://www.hsluv.org/) color ramps, so they are exact mathematical transforms of the base palette.

| Palette | `:colorscheme` | Description |
| --- | --- | --- |
| `torchlight` | `torchlight` | Cozy, hand-picked colors |
| `dusk` | `torchlight-dusk` | Deep and warm variant |
| `dawn` | `torchlight-dawn` | Pale and cool variant |

Select one with the `palette` option in `opts` or by name:

```vim
colorscheme torchlight-dusk
```

## Contrast

Four levels of contrast are available, set via the `contrast` option. `hard` is the default.

`soft` is deprecated. It's contrast is too low to be readable in many scenarios, so I decided to abandon it. It still works and will keep working, but I no longer fix bugs for it or really test it locally when reviewing changes. Use `medium` for the closest supported look.

## Screenshots

Palettes run light to dark left to right, contrast levels light to dark top to
bottom.

|                     | `dawn`           | `torchlight`     | `dusk`           |
| ------------------- | ------------- | ------------------- | ------------- |
| `soft` (deprecated) | <img width="1741" height="1260" alt="dawn" src="https://github.com/user-attachments/assets/eea9a652-0539-4886-a85e-efb57ee5973b" /> | <img width="1741" height="1260" alt="default" src="https://github.com/user-attachments/assets/bf0e74b6-6339-4b20-8c1a-0c6e72ed8177" /> | <img width="1741" height="1260" alt="dusk" src="https://github.com/user-attachments/assets/a28876a1-3647-4527-b76d-937ba1f19c09" /> |
| `medium`            | <img width="1741" height="1260" alt="dawn" src="https://github.com/user-attachments/assets/414ddf4d-5085-4ac7-b98e-df0a27f3f87d" /> | <img width="1741" height="1260" alt="default" src="https://github.com/user-attachments/assets/0d862afe-54ba-41d5-8aff-ddec06c06212" /> | <img width="1741" height="1260" alt="dusk" src="https://github.com/user-attachments/assets/1c9a0f8b-e76b-4722-b007-4dd2d05455d2" /> |
| `hard` (default)    | <img width="1741" height="1260" alt="dawn" src="https://github.com/user-attachments/assets/00933325-60bc-4660-83f0-35b9ed6f4828" /> | <img width="1741" height="1260" alt="default" src="https://github.com/user-attachments/assets/82acd0eb-a6cd-41bc-b4ca-ee4628c46813" /> | <img width="1741" height="1260" alt="dusk" src="https://github.com/user-attachments/assets/dfc7b14d-1ef8-41a9-b1f2-66d7e85d0a3d" /> |
| `stark`             | <img width="1741" height="1260" alt="dawn" src="https://github.com/user-attachments/assets/45d5aa4f-5044-4714-bfb6-5bf3445cf41c" /> | <img width="1741" height="1260" alt="default" src="https://github.com/user-attachments/assets/f8e44250-2f37-4ea4-9842-0a77f96c6db2" /> | <img width="1741" height="1260" alt="dusk" src="https://github.com/user-attachments/assets/d233365f-d119-4288-bca4-bb4678fa4c2d" /> | 

## Extras / ports

The `./extras` folder holds ports of the palette for other tools. Current ports cover Alacritty, WezTerm, Ghostty, and Zed. Other ports are welcome. Not every palette and contrast level is ported to every port, but doing so should just be copying a few hex values. PRs welcome.

## Credits

- [`no-clown-fiesta.nvim`](https://github.com/aktersnurra/no-clown-fiesta.nvim/tree/master) for the overall plugin source structure
- [`kanagawa.nvim`](https://github.com/rebelot/kanagawa.nvim) for the Hokusai inspiration
- [`gruvbox.nvim`](https://github.com/ellisonleao/gruvbox.nvim) for the general color<->highlight mapping
