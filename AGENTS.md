# AGENTS.md

Torchlight is a Neovim colorscheme. The plugin sets highlight groups. It has no
runtime behavior beyond that.

## Documentation

`doc/torchlight.txt` is the vim help file. A person writes it by hand. No tool
generates it, and no CI job updates it.

The help file is not a copy of `README.md`. The README shows screenshots and
introduces the colorscheme. The help file answers what a user asks at the
`:help` prompt: how to install the plugin, which options exist, and which
values each option accepts. Keep it short.

Update `doc/torchlight.txt` when a change alters what a user sets or sees. This
covers a new option, a renamed option, a new option value, a new supported
plugin, and a change to the install steps. A change to a single color needs no
documentation update.

After you edit the help file, rebuild the tag index:

```sh
nvim --headless -c 'helptags doc' -c 'qa'
```

Commit `doc/tags` with `doc/torchlight.txt`. A stale tag index breaks `:help`.

Give every section a tag in the form `*torchlight-<section>*`. Check a tag
after you add it:

```sh
nvim --headless --clean --cmd 'set rtp+=.' -c 'help torchlight-contrast' -c 'qa'
```

## Layout

| path | holds |
| --- | --- |
| `lua/torchlight/colors.lua` | the palette, one table of named hex values |
| `lua/torchlight/groups/` | one module per plugin, each returns highlight groups |
| `lua/torchlight/groups/init.lua` | the list of active group modules |
| `lua/torchlight/init.lua` | `setup()`, applies every group module |
| `colors/torchlight.lua` | entry point for `:colorscheme torchlight` |
| `extras/` | ports for alacritty, ghostty, wezterm, and zed |
| `test/` | vusted specs |

Add a group module to `groups/init.lua`. A module that is absent from that list
never runs.

Each group module exports `highlight(colors, opts)`. Keep this signature even
when the module ignores `opts`.

## Checks

Enter the development shell with direnv, or run `nix develop`. The shell holds
neovim, vusted, luacheck, and stylua.

```sh
stylua --check .
luacheck .
vusted ./test
```

CI runs these three commands through `nix develop`. A green run on your machine
means a green run in CI.

## Rules the tests enforce

1. The palette raises an error on an unknown color name. Read a color through
   `colors.lua` only after you add it there. A typo does not fall back to nil.
2. No group sets `fg` to the same value as `bg`. Such a group paints its text in
   its own background color, and the text disappears. To hide a character,
   choose a background that differs from the text color.
3. The theme loads under all four contrast levels: soft, medium, hard, and
   stark. Read `opts.contrast` when a group needs a different color per level.
4. `Visual` must differ from every background it covers. A selection that
   matches the line under it is invisible.

## Colors

`colors.lua` holds two kinds of value.

The `bg0` to `bg5` ladder packs closely, from `#1E1D1D` to `#302F2E`. These are
line and pane backgrounds. Two of them next to each other read as one color.

`grey0`, `grey1`, and `bg_bright` sit above that ladder. These are selection,
search, and emphasis backgrounds. They paint on top of a ladder color, so they
must stay far from it.

Do not give a ladder color to a group that paints over another background.

## Ports

`extras/` holds terminal and editor themes. They carry the same hex values as
`colors.lua`. Update them when you change a palette value that they use.

The ports define 16 ANSI colors plus foreground, background, cursor, and
selection. They hold no equivalent of a Neovim highlight group.
