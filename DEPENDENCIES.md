# Neovim Configuration Dependencies

This configuration is OS-agnostic, but it relies on external system tools to function correctly. LSPs, formatters, linters, and debug adapters are **managed automatically by Mason** -- you only need the system-level dependencies below.

## 1. Core Runtimes & Compilers

These are required for plugins to install and build their dependencies.

- **Neovim:** Version 0.9.0 or later (0.10+ recommended).
- **Node.js & npm:** Required by Mason to install Language Servers and formatters.
- **Python 3:** Required by Mason for Python-based tools and by `nvim-dap-python` for debugging.
- **C Compiler (gcc/clang):** Required by `nvim-treesitter` to compile language parsers.
- **Make:** Required to build `LuaSnip` regex support (`make install_jsregexp`).

## 2. System Utilities

- **Git:** Plugin management (Lazy.nvim) and `gitsigns.nvim`.
- **Ripgrep (`rg`):** Required by Telescope for live text search (`live_grep`).
- **Fd (`fd`):** Recommended for faster file finding in Telescope.
- **Unzip / Tar / Curl:** Required by Mason to download and extract tools.
- **Clipboard Provider:**
  - macOS: Built-in (`pbcopy`/`pbpaste`).
  - Linux (X11): `xclip` or `xsel`.
  - Linux (Wayland): `wl-clipboard`.

## 3. Fonts

- **Nerd Font:** Required for icons in `nvim-tree`, `lualine`, and `mini.icons`.
  - *Recommendation:* [JetBrainsMono Nerd Font](https://www.nerdfonts.com/font-downloads)

---

## Mason-Managed Tools (auto-installed)

These are installed automatically by Mason on first launch. **You do not need to install them manually**, but they are listed here for reference.

### Language Servers (`mason-lspconfig`)
- `lua_ls` -- Lua
- `pyright` -- Python (type checking)
- `ruff` -- Python (linting & formatting)
- `dockerls` -- Dockerfile
- `docker_compose_language_service` -- Docker Compose

### Formatters & Linters (`mason-tool-installer`)
- `markdownlint-cli2` -- Markdown linting
- `mdformat` -- Markdown formatting
- `doctoc` -- Markdown table-of-contents generation

### Debug Adapters
- `debugpy` -- Python debugging (used by `nvim-dap-python`)

### Treesitter Parsers (auto-compiled)
`lua`, `python`, `go`, `json`, `yaml`, `markdown` (plus any others installed on demand via `auto_install = true`)

---

## Installation Commands

### macOS (Homebrew)

```bash
# Core
brew install neovim node python

# Utilities
brew install ripgrep fd git curl

# Compilers (if not already installed)
xcode-select --install
```

### Linux (Debian/Ubuntu)

```bash
# Core
sudo apt install neovim nodejs npm python3 python3-pip python3-venv

# Utilities
sudo apt install ripgrep fd-find git curl unzip tar

# Compilers
sudo apt install build-essential

# Clipboard (pick one)
sudo apt install xclip        # X11
sudo apt install wl-clipboard  # Wayland
```

### Linux (Arch)

```bash
# All-in-one
sudo pacman -S neovim nodejs npm python python-pip base-devel ripgrep fd git curl unzip

# Clipboard (pick one)
sudo pacman -S xclip           # X11
sudo pacman -S wl-clipboard    # Wayland
```

---

## Post-Installation

1. Clone this repository to `~/.config/nvim`.
2. Open Neovim (`nvim`).
3. **Lazy.nvim** will automatically install all plugins.
4. **Mason** will automatically install LSPs, formatters, and debug adapters listed above.
5. **Treesitter** will compile the ensured parsers on first run.
