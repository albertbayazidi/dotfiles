vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
  callback = function(evnet)
    local function map(keys, func)
      vim.keymap.set("n", keys, func, { buffer = evnet.buf })
    end

    map("H", vim.lsp.buf.hover)
    map("gs", vim.lsp.buf.signature_help)
    map("gd", vim.lsp.buf.definition)
    map("]d", vim.diagnostic.goto_next)
    map("[d", vim.diagnostic.goto_prev)
    map("<leader>ca", vim.lsp.buf.code_action)
    map("<leader>fq", vim.lsp.buf.format)
    map("<leader>gl", function() vim.diagnostic.open_float({ border = "rounded" }) end)
    vim.keymap.set("i", "<C-Space>", function() vim.lsp.completion.get() end)

  end

})
