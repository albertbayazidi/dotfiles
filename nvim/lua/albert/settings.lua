vim.opt.clipboard = "unnamedplus"
vim.opt.number = true

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.incsearch = true
vim.opt.termguicolors = true

vim.opt.scrolloff = 8


-- Create an autocommand group
vim.api.nvim_create_augroup('NetrwGroup', { clear = true })

-- Add the autocommand to the group
vim.api.nvim_create_autocmd('FileType', {
    group = 'NetrwGroup',
    pattern = 'netrw',
    callback = function()
        vim.opt_local.number = true
        vim.opt_local.relativenumber = true
    end
})

vim.api.nvim_create_autocmd('TextYankPost',
    {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank',
    { clear = true }),
  callback = function()
      vim.highlight.on_yank()
  end,
    })
