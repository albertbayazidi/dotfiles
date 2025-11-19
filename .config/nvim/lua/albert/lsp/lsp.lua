vim.lsp.enable({
  "lua_ls",
  "biome",
  "pyright",
  "clangd",
  "tailwindcss",
  "tinymist",
})

-- completion
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("my.lsp", {}),
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
    if client:supports_method("textDocument/completion") then
      vim.opt.completeopt = { "menu", "menuone", "noinsert", "fuzzy", "popup" }
      vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
      vim.keymap.set("i", "<C-Space>", function() vim.lsp.completion.get() end)
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
    sorace = true,
  },
})
