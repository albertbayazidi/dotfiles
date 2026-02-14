vim.lsp.config["pyright_docker"] = {
  cmd = { "docker", "exec", "-i", "fenics-dev", "pyright-langserver", "--stdio" },
  filetypes = { "python" },
  root_markers = { "docker-compose.yml", ".git" },
  before_init = function(params)
    params.processId = vim.NIL
  end,
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
      },
    },
  },
}

local function start_docker_pyright()
  vim.ui.input({ prompt = "Container Name: ", default = "fenics-dev" }, function(container)
    if not container or container == "" then return end

    local config = vim.lsp.config["pyright_docker"]
    config.cmd = { "docker", "exec", "-i", container, "pyright-langserver", "--stdio" }

    vim.lsp.enable("pyright", false)
    vim.lsp.enable("pyright_docker", true)
    vim.cmd("LspStart pyright_docker")

    print("LSP: Switched to Docker -> " .. container)
  end)
end

vim.api.nvim_create_user_command("PyrightDocker", start_docker_pyright, { desc = "Start Pyright in Docker" })

vim.api.nvim_create_user_command("PyrightLocal", function()
  vim.lsp.enable("pyright_docker", false)
  vim.lsp.enable("pyright", true)
  vim.cmd("LspStart pyright")
  print("LSP: Switched to Local")
end, { desc = "Switch to Local Pyright" })
