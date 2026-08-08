-- Prefer NicoVim <leader>fg = live grep over LazyVim's git-files binding
return {
  {
    "folke/snacks.nvim",
    keys = {
      {
        "<leader>fg",
        function()
          LazyVim.pick("live_grep")()
        end,
        desc = "Grep (Root Dir)",
      },
    },
  },
}
