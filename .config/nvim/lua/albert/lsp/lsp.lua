vim.lsp.enable({
  "lua_ls",
  "biome",
  "pyright",
  "clangd",
  "tailwindcss",
  "tinymist",
  "harper"

})

-- completion
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("my.lsp", {}),
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
    if client:supports_method("textDocument/completion") then
      local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end
      client.server_capabilities.completionProvider.triggerCharacters = chars
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

-- In settings you can sett how long it takes for the floating diagnostic window to pop opp
vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
  group = vim.api.nvim_create_augroup("float_diagnostic", { clear = true }),
  callback = function()
    vim.diagnostic.open_float(nil, { focus = false, border = "rounded" })
  end,
})
