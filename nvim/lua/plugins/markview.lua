return {
    "OXY2DEV/markview.nvim",
    lazy = false,  -- Recommended
    event = "VeryLazy",
    priority = 49, -- lower order then tree-sitter to avoid error
    config = function()
        require("markview").setup({
            preview = {
                filetypes = {
                    "markdown",
                    "mdx",
                },
                ignore_buftypes = { "typst" },
            },
        })
    end
}
