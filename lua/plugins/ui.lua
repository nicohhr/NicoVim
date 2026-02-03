-- lua/plugins/ui.lua
return {
  -- Colorscheme
  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("cyberdream").setup({
        transparent = true,
        italic_comments = true,
        borderless_telescope = true,
      })
      vim.cmd.colorscheme("cyberdream")
    end,
  },

  -- Statusline
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          component_separators = { left = " ", right = " " },
          section_separators = { left = " ", right = " " },
          theme = "cyberdream",  -- matches your colorscheme
          globalstatus = true,
        },
        sections = {
          lualine_a = {
            {
              "mode",
              icon = "",
              fmt = function(mode)
                return mode:lower()
              end,
            },
          },
          lualine_b = {
            { "branch", icon = "" },
          },
          lualine_c = {
            {
              "diagnostics",
              symbols = {
                error = " ",
                warn = " ",
                info = " ",
                hint = "󰝶 ",
              },
            },
            { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
            { "filename", padding = { left = 0, right = 1 } },
          },
          lualine_x = {
            { "diff" },
          },
          lualine_y = {
            { "progress" },
            { "location" },
          },
          lualine_z = {
            { "datetime", style = "  %H:%M" },
          },
        },
      })
    end,
  },
}
