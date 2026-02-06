return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
        {
            "<leader>f",
            function()
                require("conform").format({ async = true, lsp_format = "fallback" })
            end,
            mode = "",
            desc = "Format buffer",
        },
        {
            "<leader>td",
            function()
                require("conform").format({ formatters = { "doctoc" } })
            end,
            desc = "Generate TOC with doctoc",
        },
    },
    opts = {
        formatters_by_ft = {
            markdown = { "mdformat", "markdownlint-cli2" },
        },
        default_format_opts = {
            lsp_format = "fallback",
        },
        format_on_save = {
            timeout_ms = 3000,
        },
    },
}
