return {
    -- LSP
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/cmp-nvim-lsp",
        },
        config = function()
            -- 1. Init Mason
            require("mason").setup()

            -- Configure Diagnostics
            vim.diagnostic.config({
                virtual_text = true,
                update_in_insert = false,
                underline = true,
                severity_sort = true,
            })

            -- 2. Capabilities (must be set before servers start)
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            -- 3. Init Mason-LSPConfig
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "ruff", "pyright", "dockerls", "docker_compose_language_service" },
                handlers = {
                    -- Default handler: all servers get cmp capabilities
                    function(server_name)
                        require("lspconfig")[server_name].setup({ capabilities = capabilities })
                    end,

                    -- Python: Ruff (formatting + linting)
                    ["ruff"] = function()
                        require("lspconfig").ruff.setup({
                            capabilities = capabilities,
                            on_attach = function(client)
                                -- Disable hover (Pyright handles it)
                                client.server_capabilities.hoveProvider = false
                            end,
                        })
                    end,

                    -- Specific Override: Lua
                    ["lua_ls"] = function()
                        require("lspconfig").lua_ls.setup({
                            capabilities = capabilities,
                            settings = {
                                Lua = {
                                    diagnostics = { globals = { "vim" } },
                                },
                            },
                        })
                    end,
                },
            })

            -- 4. Keymaps (Global Listener)
            -- This sets up keymaps whenever ANY LSP attaches to a buffer
            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
                callback = function(event)
                    local client = vim.lsp.get_client_by_id(event.data.client_id)
                    local map = function(keys, func, desc)
                        vim.keymap.set("n", keys, func, { buffer = event.buf, desc = desc })
                    end

                    map("<leader>q", vim.diagnostic.setloclist, "Diagnostic List")
                    map("gd", vim.lsp.buf.definition, "Go to Definition")
                    map("gr", vim.lsp.buf.references, "Go to References")
                    map("K", vim.lsp.buf.hover, "Hover Documentation")
                    map("<leader>rn", vim.lsp.buf.rename, "Rename Symbol")
                    map("<leader>ca", vim.lsp.buf.code_action, "Code Action")
                    map("<leader>f", function()
                        vim.lsp.buf.format({ async = true })
                    end, "Format")

                    -- Format on Save
                    if client and client.supports_method("textDocument/formatting") then
                        vim.api.nvim_create_autocmd("BufWritePre", {
                            buffer = event.buf,
                            callback = function()
                                vim.lsp.buf.format({ async = false, timeout_ms = 3000 })
                            end,
                        })
                    end
                end,
            })
        end,
    },

    -- Autocompletion
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            { "L3MON4D3/LuaSnip", build = "make install_jsregexp" },
            "saadparwaiz1/cmp_luasnip",
        },
        config = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")

            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-n>"] = cmp.mapping.select_next_item(),
                    ["<C-p>"] = cmp.mapping.select_prev_item(),
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),

                    -- Smart Tab: navigate completion OR jump snippet placeholders
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),

                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                }),
                window = {
                    completion = cmp.config.window.bordered({ border = "rounded" }),
                    documentation = cmp.config.window.bordered({ border = "rounded" }),
                },
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                    { name = "buffer" },
                    { name = "path" },
                }),
            })
        end,
    },
}
