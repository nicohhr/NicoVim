-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

local map = vim.keymap.set

-- DAP F-keys (LazyVim uses <leader>d* by default; see also lua/plugins/snacks.lua for <leader>fg)
map("n", "<F5>", function()
  require("dap").continue()
end, { desc = "Debug: Start/Continue" })
map("n", "<S-F5>", function()
  require("dap").terminate()
end, { desc = "Debug: Stop" })
map("n", "<F9>", function()
  require("dap").toggle_breakpoint()
end, { desc = "Debug: Toggle Breakpoint" })
map("n", "<F10>", function()
  require("dap").step_over()
end, { desc = "Debug: Step Over" })
map("n", "<F11>", function()
  require("dap").step_into()
end, { desc = "Debug: Step Into" })
map("n", "<S-F11>", function()
  require("dap").step_out()
end, { desc = "Debug: Step Out" })

-- Generate markdown TOC (LazyVim markdown extra provides markdown-toc)
map("n", "<leader>td", function()
  require("conform").format({ formatters = { "markdown-toc" }, async = true })
end, { desc = "Generate Markdown TOC" })
