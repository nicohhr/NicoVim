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
            require("lualine").setup({
                options = { theme = "tokyonight" },
            })
        end,
    },
}
