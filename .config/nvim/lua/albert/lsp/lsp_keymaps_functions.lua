vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
  callback = function(evnet)
    local function map(mode, keys, func)
      vim.keymap.set(mode, keys, func, { buffer = evnet.buf })
    end

    map("n", "H", vim.lsp.buf.hover)
    map("n", "gs", vim.lsp.buf.signature_help)
    map("n", "gd", vim.lsp.buf.definition)
    map("n", "]d", vim.diagnostic.goto_next)
    map("n", "[d", vim.diagnostic.goto_prev)
    map("n", "<leader>ca", vim.lsp.buf.code_action)
    map("n", "<leader>fq", vim.lsp.buf.format)
    map("n", "<leader>gl", function() vim.diagnostic.open_float({ border = "rounded" }) end)
    map("i", "<C-Space>", function() vim.lsp.completion.get() end)
  end

})
