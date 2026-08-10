return {
  {
    "linux-cultist/venv-selector.nvim",
    opts = function(_, opts)
      opts.options = opts.options or {}
      opts.options.statusline_func = opts.options.statusline_func or {}
      opts.options.statusline_func.lualine = function()
        local python = require("venv-selector").python()
        return python and "py " .. vim.fn.fnamemodify(python, ":~") or ""
      end
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      table.insert(opts.sections.lualine_x, 1, "venv-selector")
    end,
  },
}
