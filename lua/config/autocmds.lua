-- Autocmds are automatically loaded on the VeryLazy event
-- Defaults: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua

-- Match previous NicoVim behavior: no format-on-save for markdown / SKILL.md
local grp = vim.api.nvim_create_augroup("nicovim_markdown", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  group = grp,
  pattern = { "markdown", "markdown.mdx" },
  callback = function(ev)
    vim.b[ev.buf].autoformat = false
  end,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  group = grp,
  pattern = "**/SKILL.md",
  callback = function(ev)
    vim.b[ev.buf].autoformat = false
  end,
})
