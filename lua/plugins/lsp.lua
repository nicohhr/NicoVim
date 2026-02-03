return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    -- 1. Init Mason
    require("mason").setup()
    -- Configure Diagnostics
    vim.diagnostic.config({
        virtual_text = true,
        update_in_insert = true,
        underline = true,
        severity_sort = true,
    })

    -- 2. Init Mason-LSPConfig (The Automation)
    require("mason-lspconfig").setup({
      ensure_installed = { "lua_ls", "pyright" },   ----- HERE WE ADD THE DEFAULT LSP LANGS
      handlers = {
        -- The "Default Handler"
        -- This function is called for every server installed by Mason
        function(server_name)
          require("lspconfig")[server_name].setup({})
        end,

        -- Specific Override: Lua
        ["lua_ls"] = function()
          require("lspconfig").lua_ls.setup({
            settings = {
              Lua = {
                diagnostics = { globals = { "vim" } },
              },
            },
          })
        end,
        -- You can add more specific overrides here if needed
        -- ["rust_analyzer"] = function() ... end,
      },
    })

    -- 3. Keymaps (Global Listener)
    -- This sets up keymaps whenever ANY LSP attaches to a buffer
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
      callback = function(event)
        local map = function(keys, func, desc)
          vim.keymap.set("n", keys, func, { buffer = event.buf, desc = desc })
        end

        -- List all errors in the current file (Space + q)
        map("<leader>q", vim.diagnostic.setloclist, "Diagnostic List")
        map("gd", vim.lsp.buf.definition, "Go to Definition")
        map("gr", vim.lsp.buf.references, "Go to References")
        map("K", vim.lsp.buf.hover, "Hover Documentation")
        map("<leader>rn", vim.lsp.buf.rename, "Rename Symbol")
        map("<leader>ca", vim.lsp.buf.code_action, "Code Action")
      end,
    })
  end,
}
