-- lua/plugins/ui.lua
return {
    -- Mini Icons
    {
        'echasnovski/mini.icons',
        version = false,
        config = function()
            require('mini.icons').setup()
        end
    },
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
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            local theme = require("lualine.themes.cyberdream")
            local colors = require("cyberdream.colors").default

            for _, section in pairs(theme) do
                if type(section) == "table" then
                    for _, part in pairs(section) do
                        if type(part) == "table" and part.bg == "NONE" then
                            part.bg = colors.bg_alt
                        end
                    end
                end
            end

            require("lualine").setup({
                options = { theme = theme },
            })
        end,
    },
    -- Markdown rendering
    {
        "MeanderingProgrammer/render-markdown.nvim",
        dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.icons" },
        ft = { "markdown" },
        opts = {
            pipe_table = { preset = "round" },
        },
    },
}
