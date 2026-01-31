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
  end

})

-- Starting and stopping harper
vim.api.nvim_create_user_command("StopHarper", function()
  vim.lsp.enable("harper", false) -- Want this to be using stop or disable not enable with false flag
end, { desc = "stops harper from giving hints" })

vim.api.nvim_create_user_command("StartHarper", function()
  vim.lsp.enable("harper")
end, { desc = "stops harper from giving hints" })
