return {
    -- Debugging
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "rcarriga/nvim-dap-ui",
            "nvim-neotest/nvim-nio",
            "mfussenegger/nvim-dap-python",
        },
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")

            -- Setup UI
            dapui.setup()

            -- Auto open/close UI
            dap.listeners.after.event_initialized["dapui"] = dapui.open
            dap.listeners.before.event_terminated["dapui"] = dapui.close
            dap.listeners.before.event_exited["dapui"] = dapui.close

            -- Python setup
            require("dap-python").setup("python")

            -- Keymaps
            vim.keymap.set("n", "<F5>", dap.continue, { desc = "Debug: Start/Continue" })
            vim.keymap.set("n", "<F10>", dap.step_over, { desc = "Debug: Step Over" })
            vim.keymap.set("n", "<F11>", dap.step_into, { desc = "Debug: Step Into" })
            vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
            vim.keymap.set("n", "<leader>dt", dapui.toggle, { desc = "Toggle Debug UI" })

            -- Breakpoint appearance
            vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "DiagnosticError" })
            vim.fn.sign_define("DapStopped", { text = "▶", texthl = "DiagnosticInfo" })
        end,
    },
}
