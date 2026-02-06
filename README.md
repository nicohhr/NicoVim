# NicoVim

## Structure

```
~/.config/nvim/
├── init.lua                 # Entry point: base options, keymaps, loads lazy.nvim
├── lua/
│   ├── config/
│   │   └── lazy.lua         # Bootstraps lazy.nvim and auto-imports lua/plugins/
│   └── plugins/
│       ├── lsp.lua          # LSP servers, Mason, mason-tool-installer, diagnostics
│       ├── formatting.lua   # conform.nvim — formatter orchestration
│       ├── ui.lua           # Colorscheme, statusline, icons
│       ├── utils.lua        # File explorer, telescope, treesitter, git, etc.
│       └── dap.lua          # Debug Adapter Protocol (Python)
└── .luarc.json              # Lua language server workspace config
```

### What goes where

| File | Purpose |
|---|---|
| `init.lua` | Vim options (`vim.opt`), global keymaps, leader key. No plugins here — only base Neovim settings. Ends with `require("config.lazy")` to kick off plugin loading. |
| `lua/config/lazy.lua` | Bootstraps the lazy.nvim plugin manager and imports everything under `lua/plugins/`. You rarely need to touch this. |
| `lua/plugins/lsp.lua` | LSP server configs (pyright, ruff, lua_ls, docker). Mason setup and `mason-tool-installer` for auto-installing non-LSP tools (formatters, linters). LSP keymaps (`gd`, `gr`, `K`, etc.). |
| `lua/plugins/formatting.lua` | conform.nvim config. Declares which formatters run per filetype. Handles format-on-save and `<leader>f`. Falls back to LSP formatting for filetypes without a dedicated formatter. |
| `lua/plugins/ui.lua` | Visual plugins: colorscheme, statusline (lualine), file icons. |
| `lua/plugins/utils.lua` | General-purpose plugins: nvim-tree, telescope, treesitter, gitsigns, autopairs, commenting, surround, which-key, hlchunk. |
| `lua/plugins/dap.lua` | Debugging setup (nvim-dap) for Python. |

### Adding a new plugin

Create a new file under `lua/plugins/` or add to an existing one. lazy.nvim auto-imports every file in that directory — no registration step needed.
