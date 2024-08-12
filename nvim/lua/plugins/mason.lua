return {
    require("mason").setup({
        ui = {
            icons = {
                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗"
            }
        }
    }),
    require("mason-lspconfig").setup({
        ensure_installed = {
            "gopls",
            "lua_ls",
            "astro",
            "html",
            "htmx",
            "clangd",
        },
        handlers = {
            function (server_name)
                require("lspconfig")[server_name].setup {}
            end
        }
    })
}
