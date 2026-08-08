-- Snacks: NicoVim dashboard header (LazyVim-style) + <leader>fg live grep
return {
  {
    "folke/snacks.nvim",
    opts = {
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
