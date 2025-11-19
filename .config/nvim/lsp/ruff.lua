vim.lsp.config["ruff"] = {
  cmd = { "ruff", "format" },
  filetypes = {    "python"  },
  root_markers = { "pyproject.toml" },
}

