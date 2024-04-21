<img alt="Fishing by Torchlight in Kai Province" src="https://github.com/skylarmb/torchlight.nvim/assets/7543705/216c8205-39e0-4ee8-b1ea-2854b6c9b250"></img>


<h1 style="text-align: center">torchlight.nvim</h1>

A a warm green colorscheme inspired by the painting "Fishing by Torchlight in Kai Province" by Hokusai. Hokusai lived between 1760 and 1849 and likely painted this painting around 1833.

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
   <summary>C++</summary>
<img width="1125" alt="Screenshot 2024-04-21 at 12 04 12 PM" src="https://github.com/skylarmb/torchlight.nvim/assets/7543705/76bccafe-df38-4038-8c6a-1d74bd5afc74">

</details>

<details>
   <summary>Typescript</summary>
<img width="1125" alt="Screenshot 2024-04-21 at 12 05 39 PM" src="https://github.com/skylarmb/torchlight.nvim/assets/7543705/480a94bf-51e8-4f00-98d9-ee639730ac34">

</details>

<details>
   <summary>Kotlin</summary>
<img width="1125" alt="Screenshot 2024-04-21 at 12 03 39 PM" src="https://github.com/skylarmb/torchlight.nvim/assets/7543705/34515439-4a8a-49fd-9b69-badfa5c040d8">

</details>

<details>
   <summary>Lua</summary>
   <img width="1125" alt="Screenshot 2024-04-21 at 12 10 24 PM" src="https://github.com/skylarmb/torchlight.nvim/assets/7543705/6abb2b44-b0fe-41a2-b91f-695022440c81">
</details>

## Credits

- [`no-clown-fiesta.nvim`](https://github.com/aktersnurra/no-clown-fiesta.nvim/tree/master) for the overall plugin source structure
- [`kanagawa.nvim`](https://github.com/rebelot/kanagawa.nvim) for the Hokusai inspiration
- [`gruvbox.nvim`](https://github.com/ellisonleao/gruvbox.nvim) for the general color<->highlight mapping
