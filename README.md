# NicoVim (LazyVim)

Neovim config based on [LazyVim](https://github.com/LazyVim/LazyVim).

Branch `lazyvim-rewrite` replaces the previous hand-rolled stack. Original config remains on `main`.

## Structure

```
~/.config/nvim/
├── init.lua              # boots lazy.nvim / LazyVim
├── lazyvim.json          # enabled LazyExtras (managed)
├── lua/config/
│   ├── autocmds.lua      # SKILL.md / markdown no-format-on-save
│   ├── keymaps.lua       # NicoVim aliases + DAP F-keys + TOC
│   ├── lazy.lua          # lazy.nvim setup
│   └── options.lua       # 4-space indent override
└── lua/plugins/
    ├── markdown.lua      # skip render-markdown on SKILL.md
    └── mason.lua         # ensure debugpy
```

## Enabled extras

| Extra | Provides |
|-------|----------|
| `lang.python` | pyright + ruff, venv-selector (`<leader>cv`), dap-python |
| `lang.docker` | dockerls, compose LS, hadolint |
| `lang.markdown` | marksman, render-markdown, prettier/markdownlint/markdown-toc |
| `dap.core` | nvim-dap + dap-ui |

Manage with `:LazyExtras`. Theme is LazyVim default (tokyonight).

## Keymaps worth knowing

| Key | Action |
|-----|--------|
| `<leader>e` | File explorer (neo-tree) |
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep (NicoVim alias; also `<leader>sg` / `<leader>/`) |
| `<leader>cv` | Select Python venv (python files) |
| `<leader>td` | Generate markdown TOC |
| `<F5>` / `<F9>`–`<F11>` | DAP continue / breakpoint / step |
| `<leader>d*` | Full LazyVim debug maps |

## First launch

1. Open Neovim — Lazy installs plugins.
2. Mason installs LSPs/tools from extras.
3. Python: open a `.py` file, `<leader>cv` if the wrong interpreter is active.
4. Optional: `:checkhealth lazyvim`

## Rollback

```bash
git switch main
# or only drop theme later by setting colorscheme in lua/plugins/
```
