return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "theHamsta/nvim-dap-virtual-text",
        "nvim-neotest/nvim-nio"
    },
    config = function()
        local dap = require("dap")

        dap.adapters.codelldb = {
            type = "server",
            port = "${port}",
            executable = {
                command = "codelldb",
                args = { "--port", "${port}" },
            },
        }

        require("plugins.debugger.c_debugger").setup()

        vim.keymap.set("n", "<leader>db", function() dap.toggle_breakpoint() end, { desc = "Toggle Breakpoint" })
        vim.keymap.set("n", "<leader>dc", function() dap.continue() end, { desc = "Continue" })
        vim.keymap.set("n", "<leader>dC", function() dap.run_to_cursor() end, { desc = "Run to Cursor" })
        vim.keymap.set("n", "<leader>dT", function() dap.terminate() end, { desc = "Terminate" })
    end
}
