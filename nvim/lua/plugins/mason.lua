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
        "lua_ls",
        "astro",
        "tinymist",
        "html",
        "clangd",
    },
    handlers = {
      function(server_name)
        require("lspconfig")[server_name].setup {}
      end
    }
  })
}
