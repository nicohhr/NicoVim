# Dependencies

LazyVim + Mason install most language tools. You still need system packages.

## System

- **Neovim** 0.11+ (0.12 recommended)
- **Git**, **curl**, **unzip**
- **ripgrep** (`rg`) — search
- **fd** — file find + venv-selector
- **Node.js** — some Mason packages / markdown-preview
- **C compiler** — treesitter parsers
- **Nerd Font** — icons (e.g. JetBrainsMono Nerd Font)
- **Python 3** — host / fallback; project envs via uv/venv
- **uv** (optional) — preferred Python toolchain; venv-selector understands it

### macOS

```bash
brew install neovim ripgrep fd node git
# Nerd Font via brew cask or manual install
```
## Mason-managed (auto via extras)

- Python: `pyright`, `ruff`, `debugpy`
- Docker: `docker-language-server`, `docker-compose-language-service`, `hadolint`
- Markdown: `marksman`, `markdownlint-cli2`, `markdown-toc`, `prettier`
- Core: `stylua`, `shfmt`, …

Run `:Mason` to inspect.
