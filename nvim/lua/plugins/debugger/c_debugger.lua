local M = {}

function M.setup()
    local dap = require("dap")
    dap.configurations.c = {
        {
            name = "Launch file",
            type = "codelldb",
            request = "launch",
            program = function()
                return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
            end,
            args = function()
                local input = vim.fn.input("Arguments: ")
                local args = {}
                for word in input:gmatch("%S+") do
                    table.insert(args, word)
                end
                return args
            end,
            cwd = "${workspaceFolder}",
            stopOnEntry = false,
        },
    }
end

return M
