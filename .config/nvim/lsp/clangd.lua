vim.lsp.config["clangd"] = {
	cmd = { "clangd" },

	filetypes = { "c" },

	root_markers = { { '.clangd', 'compile_commands.json' }, ".git" },
    capabilities = {
        textDocument = {
          semanticTokens = {
            multilineTokenSupport = true,
          }
        }
    },

}

