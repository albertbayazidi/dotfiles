return {
  {
    "rcarriga/nvim-notify",
    config = function()
      local notify = require("notify")
      notify.setup({
        stages = "fade_in_slide_out", -- Smooth animations
        timeout = 3000,            -- Notification timeout in ms
        background_colour = "#000000", -- Background color
      })
      vim.notify = notify          -- Replace default `vim.notify`

      -- Hook LSP messages into nvim-notify
      vim.lsp.handlers["window/showMessage"] = function(_, result, ctx)
        local client = vim.lsp.get_client_by_id(ctx.client_id)
        local lvl = ({ "ERROR", "WARN", "INFO", "DEBUG" })[result.type]
        notify(result.message, lvl, { title = client and client.name or "LSP" })
      end
    end,
  },
}
