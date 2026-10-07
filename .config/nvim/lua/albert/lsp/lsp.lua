local lsp_dir = vim.fn.expand("~/.config/nvim/lsp")
local servers = {}

local handle = vim.uv.fs_scandir(lsp_dir)
if handle then
  while true do
    local name, kind = vim.uv.fs_scandir_next(handle)
    if not name then break end

    if kind == "file" and name:match("%.lua$") then
      local server_name = name:gsub("%.lua$", "")
      local file_path = lsp_dir .. "/" .. name

      local ok, config = pcall(dofile, file_path)
      if ok and type(config) == "table" then
        vim.lsp.config[server_name] = config
        table.insert(servers, server_name)
      end
    end
  end
end

vim.lsp.enable(servers)

-- completion
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("my.lsp", {}),
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
    if client:supports_method("textDocument/completion") then
      vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
    end
  end,
})

vim.opt.completeopt = { "menu", "noinsert", "fuzzy", "popup" }
vim.o.pumheight = 8
vim.o.pumborder = "rounded"

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
