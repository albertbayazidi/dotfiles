return {
    "stevearc/conform.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                lua = { "stylua" },
                c = { "clang-format" },
                cpp = { "clang-format" },
            },
            format_on_save = {
                lsp_fallback = true,
            },
        })
    end,
}
