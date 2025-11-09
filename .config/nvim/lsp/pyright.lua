vim.lsp.config["pyright"] = {
  cmd = { 'pyright-langserver', '--stdio' },
  filetypes = { "python" },
  root_markers = {
    "pyproject.toml",
    ".git",
    "setup.py",
    "requirements.txt",
    "req.txt",
    "pyrightconfig.json",
  },
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
      },
    },
  },
}
