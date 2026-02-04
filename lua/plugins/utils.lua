return {
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("nvim-tree").setup({
                view = { width = 35 },
                git = { enable = true },
            })
        end,
    },

    {
        "nvim-telescope/telescope.nvim",
        version = "*",
        dependencies = {
            "nvim-lua/plenary.nvim", -- Required utility library
        },
        config = function()
            local builtin = require("telescope.builtin")

            -- Keymmaps
            vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
            vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live Grep" })
            vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Buffers" })
            vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help" })
        end,
    },

    {
        'nvim-treesitter/nvim-treesitter',
        lazy = false,
        build = ':TSUpdate', -- Auto-update parsers
        opts = {
            ensure_installed = {
                "lua", "python", "go", "json", "yaml", "markdown",
            },
            auto_install = true,
            highlight = {
                enable = true,
            },
            indent = {
                enable = true,
            },
        },
    },

    {
        "lewis6991/gitsigns.nvim",
        event = { "BufReadPre", "BufNewFile" },
        opts = {
            signs = {
                add          = { text = '┃' },
                change       = { text = '┃' },
                delete       = { text = '_' },
                topdelete    = { text = '‾' },
                changedelete = { text = '~' },
                untracked    = { text = '┆' },
            },
            signs_staged = {
                add          = { text = '┃' },
                change       = { text = '┃' },
                delete       = { text = '_' },
                topdelete    = { text = '‾' },
                changedelete = { text = '~' },
                untracked    = { text = '┆' },
            },
            signs_staged_enable = true,
            signcolumn = true,
            numhl = false,
            linehl = false,
            word_diff = false,
            watch_gitdir = {
                follow_files = true,
            },
            auto_attach = true,
            attach_to_untracked = false,
            current_line_blame = false,
            current_line_blame_opts = {
                virt_text = true,
                virt_text_pos = 'eol',
                delay = 1000,
                ignore_whitespace = false,
                virt_text_priority = 100,
                use_focus = true,
            },
            current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
            sign_priority = 6,
            update_debounce = 100,
            max_file_length = 40000,
            preview_config = {
                border = 'single',
                style = 'minimal',
                relative = 'cursor',
                row = 0,
                col = 1,
            },
            on_attach = function(bufnr)
                local gs = package.loaded.gitsigns
                local map = function(mode, l, r, desc)
                    vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
                end

                -- Navigation
                map("n", "]h", gs.next_hunk, "Next Hunk")
                map("n", "[h", gs.prev_hunk, "Prev Hunk")

                -- Actions
                map("n", "<leader>hs", gs.stage_hunk, "Stage Hunk")
                map("n", "<leader>hr", gs.reset_hunk, "Reset Hunk")
                map("n", "<leader>hp", gs.preview_hunk, "Preview Hunk")
                map("n", "<leader>hb", gs.blame_line, "Blame Line")
            end,
        },
    },
    -- Auto pairs (brackets, quotes)
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup()
        end,
    },

    -- Comment toggling
    {
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end,
    },

    -- Surround (change quotes, brackets)
    {
        "kylechui/nvim-surround",
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup()
        end,
    },

    -- Which-key (shows available keybindings)
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        config = function()
            require("which-key").setup({
                delay = 300, -- Show after 300ms
            })
        end,
    },

    -- Indent guides
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        config = function()
            require("ibl").setup()
        end,
    },
}
