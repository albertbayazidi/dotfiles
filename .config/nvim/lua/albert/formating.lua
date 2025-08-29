-- Formating on save
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("lsp", { clear = true }),
  callback = function(args)
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = args.buf,
      callback = function()
        local original_notify = vim.notify
        vim.notify = function() end
        vim.lsp.buf.format { async = false, id = args.data.client_id }
        vim.notify = original_notify
      end,
    })
  end
})
