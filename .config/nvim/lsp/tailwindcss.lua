vim.lsp.config["tailwindcss"] = {
  cmd = {"tailwindcss-language-server"},
  filetypes = {
    "javascript",
    "javascriptreact",
    "svelte",
    "typescript",
  },
  root_markers = {".git"},

}

