vim.lsp.enable({
  "lua_ls",
  "biome",
  "pyright",
  "clangd",
  "tailwindcss",
  "tinymist",
  "harper",
  "typescript",
  "ruff",
  "svelte",
  "gopls",
  "bash"

})

-- completion
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("my.lsp", {}),
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
    if client:supports_method("textDocument/completion") then
      vim.opt.completeopt = { "menu", "noinsert", "fuzzy", "popup" }
      vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
    end
  end,
})

-- Diagnostics
vim.diagnostic.config({
  virtual_text = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = "rounded",
    source = true,
  },
})
