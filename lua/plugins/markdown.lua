-- Markdown tweaks on top of lazyvim.plugins.extras.lang.markdown
return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    optional = true,
    opts = {
      ignore = function(buf)
        local name = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(buf), ":t")
        return name == "SKILL.md"
      end,
    },
  },
}
