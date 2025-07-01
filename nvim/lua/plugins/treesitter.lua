return {
    "nvim-treesitter/nvim-treesitter",
    dependencies = { 'markview.nvim' },
    branch = 'master',
    build = ":TSUpdate",
    lazy = false,
    priority = 50,
    config = function()
        local configs = require("nvim-treesitter.configs")

        configs.setup({
            ensure_installed = {
                "c", "cmake", "go",
                "bash", "lua", "sql", "python", "julia",
                "astro", "typescript", "javascript", "html",
                "typst", "markdown", "markdown_inline",
                "json"
            },

            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },
        })
    end
}
