-- Use the nixd installed in the user's Nix profile instead of LazyVim's default nil server.
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        nil_ls = { enabled = false },
        nixd = { mason = false },
      },
    },
  },
}
