vim.lsp.config["tinymist"] = {
  cmd = { "tinymist"},
  filetypes = {
    "typst",
  },
  root_markers = {".git"},
  settings ={
   formatterMode = "typstyle",
  }
}

