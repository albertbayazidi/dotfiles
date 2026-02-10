return {
  cmd = { 'pyright-langserver', '--stdio' },
  filetypes = { "python" },
  root_markers = { "pyproject.toml", ".git", "setup.py", "requirements.txt" },
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
      },
    },
  },
}
