<h1 align="center"><code>torchlight.nvim</code></h1>

<img alt="Fishing by Torchlight in Kai Province" src="https://github.com/skylarmb/torchlight.nvim/assets/7543705/216c8205-39e0-4ee8-b1ea-2854b6c9b250"></img>

A cozy colorscheme inspired by the painting "Fishing by Torchlight in Kai Province" by Katsushika Hokusai. Hokusai lived between 1760 and 1849 and likely painted this painting around 1833.

This colorscheme adopts the natural pallette of "Fishing by Torchlight in Kai Province" and thus uses a minimal amount of blue hues. This makes it friendly on the eyes, especially at night.

## Plugin support

A few common plugins are supported including `nvim-treesitter`, `lualine.nvim`, `nvim-tree`, etc. See [lua/torchlight/groups](https://github.com/skylarmb/torchlight.nvim/tree/main/lua/torchlight/groups) for a more complete list. 

PRs welcome to add support for more plugins.

## Usage

Install using your favorite plugin manager, e.g. `lazy.nvim`

```lua
  {
    "skylarmb/torchlight.nvim",
    lazy = false,
    config = function()
      require("torchlight").setup()
    end,
  }
```

## Screenshots 

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

## Credits

- [`no-clown-fiesta.nvim`](https://github.com/aktersnurra/no-clown-fiesta.nvim/tree/master) for the overall plugin source structure
- [`kanagawa.nvim`](https://github.com/rebelot/kanagawa.nvim) for the Hokusai inspiration
- [`gruvbox.nvim`](https://github.com/ellisonleao/gruvbox.nvim) for the general color<->highlight mapping
