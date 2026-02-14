return {
  cmd = { "docker-langserver", "start", "--stdio" },
  filetypes = { "dockerfile", "Dockerfile" },
  root_markers = { ".git", "docker-compose.yml" },
}
