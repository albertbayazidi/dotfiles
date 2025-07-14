return {
    "nvim-treesitter/nvim-treesitter",
    branch = 'master',
    build = ":TSUpdate",
    lazy = false,
    priority = 50,
    config = function()
        local configs = require("nvim-treesitter.configs")

        configs.setup({
            ensure_installed = {
                "c", "cmake",
                "bash", "lua", "python",
            },

            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },
        })
    end
}
