<h1 align="center"><code>torchlight.nvim</code></h1>

<img alt="Fishing by Torchlight in Kai Province" src="https://github.com/skylarmb/torchlight.nvim/assets/7543705/216c8205-39e0-4ee8-b1ea-2854b6c9b250"></img>

A cozy colorscheme inspired by the painting "Fishing by Torchlight in Kai Province" by Katsushika Hokusai. Hokusai lived between 1760 and 1849 and likely painted this painting around 1833.

This colorscheme adopts the natural pallette of "Fishing by Torchlight in Kai Province" and thus uses a minimal amount of blue hues. This makes it friendly on the eyes, especially at night.

## Plugin support

Supported plugins include `nvim-treesitter`, `lualine.nvim`, `nvim-tree`, `neo-tree.nvim`, `telescope.nvim`, `nvim-cmp`, `nvim-notify`, `lazy.nvim`, `gitsigns.nvim`, `neogit`, `nvim-dap-ui`, `dashboard-nvim`, `avante.nvim`, and `snacks.nvim`. Many more will work just fine with the default highlight groups. See [lua/torchlight/groups](https://github.com/skylarmb/torchlight.nvim/tree/main/lua/torchlight/groups) for the plugin-specific highlight definitions.

If you use a plugin that is not supported or looks incorrect when using this colorscheme, please [open an issue](https://github.com/skylarmb/torchlight.nvim/issues) or [pull request](https://github.com/skylarmb/torchlight.nvim/pulls).

## Usage

Install using your favorite plugin manager, e.g. `lazy.nvim`

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

## Contrast

Four levels of contrast are available, set via the `contrast` option. `hard` is the default.

`soft` is deprecated. It still works and will keep working, but it is no longer maintained. New colors and fixes are not applied to it. Use `medium` for the closest supported look.

<details>
    <summary><code>soft</code> (deprecated, unmaintained)</summary>
<img width="1374" height="1149" alt="Screenshot 2026-08-17 at 11 39 11 AM" src="https://github.com/user-attachments/assets/87360dc7-e526-48c7-a269-a10caeb9e0ff" />
</details>
<details>
    <summary><code>medium</code></summary>
<img width="1374" height="1149" alt="Screenshot 2026-08-17 at 11 39 41 AM" src="https://github.com/user-attachments/assets/219fe850-ca77-404e-a1a3-353d2987efc5" />
</details>
<details>
    <summary><code>hard</code> (default)</summary>
<img width="1374" height="1149" alt="Screenshot 2026-08-17 at 11 40 04 AM" src="https://github.com/user-attachments/assets/279b164a-297c-47c1-a58a-62728d774241" />
</details>
<details>
    <summary><code>stark</code></summary>
<img width="1374" height="1149" alt="Screenshot 2026-08-17 at 11 41 54 AM" src="https://github.com/user-attachments/assets/6208e816-8eb7-42cc-a75c-029095b2e9b8" />
</details>


## Screenshots

All screenshots captured with `medium` contrast.

<details>
   <summary>C</summary>
<img width="988" alt="Screenshot 2024-04-21 at 2 17 09 PM" src="https://github.com/skylarmb/torchlight.nvim/assets/7543705/b088e0b3-d491-43ee-b4cf-78d1671d7165">

</details>

<details>
   <summary>Python</summary>
<img width="988" alt="Screenshot 2024-04-21 at 2 16 51 PM" src="https://github.com/skylarmb/torchlight.nvim/assets/7543705/11c5a875-e60a-465d-9cf0-07f97756cf75">

</details>

<details>
   <summary>Go</summary>
<img width="988" alt="Screenshot 2024-04-21 at 2 17 42 PM" src="https://github.com/skylarmb/torchlight.nvim/assets/7543705/74ffdc7a-efeb-49af-901e-96832d0696c9">

</details>

<details>
   <summary>Rust</summary>
  <img width="988" alt="Screenshot 2024-04-21 at 2 18 28 PM" src="https://github.com/skylarmb/torchlight.nvim/assets/7543705/8f333426-3860-4252-88f4-8256de319f2f">

</details>

<details>
   <summary>Lua</summary>
   <img width="988" alt="Screenshot 2024-04-21 at 2 21 55 PM" src="https://github.com/skylarmb/torchlight.nvim/assets/7543705/350ced2a-cf94-4781-a8a4-5785ad79bcfa">

</details>

## Extras / ports

The `./extras` folder holds ports of the palette for other tools. Current ports cover Alacritty, WezTerm, Ghostty, and Zed. Other ports are welcome.

## Credits

- [`no-clown-fiesta.nvim`](https://github.com/aktersnurra/no-clown-fiesta.nvim/tree/master) for the overall plugin source structure
- [`kanagawa.nvim`](https://github.com/rebelot/kanagawa.nvim) for the Hokusai inspiration
- [`gruvbox.nvim`](https://github.com/ellisonleao/gruvbox.nvim) for the general color<->highlight mapping
