-- Snacks: NicoVim dashboard header (LazyVim-style) + <leader>fg live grep
return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        sources = {
          explorer = { hidden = true },
          files = { hidden = true },
          grep = { hidden = true },
        },
      },
      dashboard = {
        preset = {
          header = [[
          ███╗   ██╗██╗ ██████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗          Z
          ████╗  ██║██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║      Z    
          ██╔██╗ ██║██║██║     ██║   ██║██║   ██║██║██╔████╔██║   z       
          ██║╚██╗██║██║██║     ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ z         
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
