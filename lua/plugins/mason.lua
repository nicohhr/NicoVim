-- Extra Mason tools beyond what language extras install
return {
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "debugpy",
      },
    },
  },
}
