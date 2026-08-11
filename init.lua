-- bootstrap lazy.nvim, LazyVim and your plugins
vim.filetype.add({
  filename = {
    ["compose.yaml"] = "yaml.docker-compose",
    ["compose.yml"] = "yaml.docker-compose",
    ["docker-compose.yaml"] = "yaml.docker-compose",
    ["docker-compose.yml"] = "yaml.docker-compose",
  },
})

vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  callback = function()
    for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
      if vim.bo[bufnr].filetype == "yaml.docker-compose" then
        vim.api.nvim_exec_autocmds("FileType", { buffer = bufnr })
      end
    end
  end,
})

require("config.lazy")
