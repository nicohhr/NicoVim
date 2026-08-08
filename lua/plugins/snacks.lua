-- Snacks: NicoVim dashboard header + <leader>fg live grep
return {
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        preset = {
          header = [[
███╗   ██╗██╗ ██████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║██║██║     ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██║██║     ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║██║╚██████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚═╝ ╚═════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
]],
        },
      },
    },
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
