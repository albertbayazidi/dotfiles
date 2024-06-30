return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "williamboman/mason.nvim",
    },

    config = function()
        require("mason").setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗"
                }
            }
        })
        require("mason-lspconfig").setup({
            ensure_installed = {
                "gopls",
                "ltex",
                "lua_ls",
                "astro",
                "html",
                "htmx",
                "clangd",
            },
            handlers = {
                function (server_name)
                    --bellow commmnet is nice for finding names                     of the ensured installed list. 
                    --print("setting up", server_name)
                    require("lspconfig")[server_name].setup {}
                end
            }
        })
        require("lspconfig").lua_ls.setup({
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" }
                    }
                }
            }
        })
    end
}

