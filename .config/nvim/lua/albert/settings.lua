vim.opt.clipboard = "unnamedplus"
vim.opt.number = true

vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.cmdheight = 0
vim.opt.showmode = false

vim.opt.cursorline = true
vim.opt.incsearch = true
vim.opt.termguicolors = true

vim.opt.scrolloff = 8

vim.opt.splitright = true
vim.opt.updatetime = 100

local indent_group = vim.api.nvim_create_augroup("IndentationSettings", { clear = true })

local function set_indent(width)
  vim.opt_local.expandtab = true
  vim.opt_local.shiftwidth = width
  vim.opt_local.tabstop = width
  vim.opt_local.softtabstop = width
end

vim.api.nvim_create_autocmd("FileType", {
  group = indent_group,
  pattern = { "lua", "javascript", "javascriptreact", "typescript", "html", "css", "json", "yaml" },
  callback = function()
    set_indent(2)
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = indent_group,
  pattern = { "python", "c", "rust", "go" },
  callback = function()
    set_indent(4)
  end,
})

-- Allows for use of ctrl l in netrw
vim.api.nvim_create_autocmd("FileType", {
  pattern = "netrw",
  callback = function()
    vim.api.nvim_buf_set_keymap(0, "n", "<C-l>", "<C-w><C-l>", { noremap = true, silent = true })
  end,
})

-- makes relativenumber visable
vim.api.nvim_create_augroup("NetrwGroup", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  group = "NetrwGroup",
  pattern = "netrw",
  callback = function()
    vim.opt_local.number = true
    vim.opt_local.relativenumber = true
  end
})
-- makes highlight effect on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank",
    { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})
