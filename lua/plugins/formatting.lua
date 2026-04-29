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
        format_on_save = function(bufnr)
            local file_name = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(bufnr), ":t")
            local filetype = vim.bo[bufnr].filetype
            if file_name == "SKILL.md" then
                return
            end
            if filetype == "markdown" then
                return
            end

            return {
                timeout_ms = 3000,
            }
        end,
    },
}
