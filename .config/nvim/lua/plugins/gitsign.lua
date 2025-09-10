return {
    "lewis6991/gitsigns.nvim",
    config = function()
        local gitsigns = require("gitsigns")

        -- Setup for gitsigns
        gitsigns.setup({
            signs = {
                add = { text = "+" },
                change = { text = "~" },
                delete = { text = "-" },
                topdelete = { text = "‾" },
                untracked = { text = "┆" },
            },
        })

        -- Helper function for keybinding
        local function map(mode, lhs, rhs, opts)
            opts = opts or {}
            vim.keymap.set(mode, lhs, rhs, opts)
        end

        map('n', '<leader>hr', gitsigns.reset_hunk)
        map('n', '<leader>hs', gitsigns.stage_buffer)
        map('v', '<leader>hr', function()
            gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
        end)
        map('n', ']c', gitsigns.next_hunk)
        map('n', '[c', gitsigns.prev_hunk)
        map('n', '<leader>hR', gitsigns.reset_buffer)
        map('n', '<leader>hS', gitsigns.stage_buffer)
        map('n', '<leader>hp', gitsigns.preview_hunk)
    end
}
