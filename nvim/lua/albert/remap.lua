--basic keymaps
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>p", vim.cmd.Ex,
    {desc = "Open file explorer"})

-- complex keymaps
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>',
    { desc = 'Exit terminal mode' })

vim.keymap.set('n', '<C-h>', '<C-w><C-h>',
    { desc = 'Move focus to the left window' })

vim.keymap.set('n', '<C-l>', '<C-w><C-l>',
    { desc = 'Move focus to the right window' })

vim.keymap.set('n', '<C-j>', '<C-w><C-j>',
    { desc = 'Move focus to the lower window' })

vim.keymap.set('n', '<C-k>', '<C-w><C-k>',
    { desc = 'Move focus to the upper window' })

vim.keymap.set("n", "J", "gj",
    {desc = "Move down (works with long text)"})

vim.keymap.set("n", "K", "gk",
    {desc = "Move up (works with long text)"})

-- Visual mappings
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv",
    {desc = "move marked marked text down"})

vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv",
    {desc = "move marked marked text up"})

-- LSP mappings
vim.api.nvim_create_autocmd('LspAttach',{
    group = vim.api.nvim_create_augroup('UserLspConfig',
        { clear = true }),
    callback = function(e)
    local opts = {buffer = e.buf}
        vim.keymap.set("n", "gd",
            function() vim.lsp.buf.definition() end, opts,
            {desc = "Go to definition"})

        vim.keymap.set("n", "H",
            function() vim.lsp.buf.hover() end, opts,
            {desc = "Show hover effect"})

        vim.keymap.set("n", "go",
            function() vim.lsp.buf.type_definition() end, opts,
            {desc = "Go to type definition"})

        vim.keymap.set("n", "rn",
            function() vim.lsp.buf.rename() end, opts,
            {desc = "Rename variables"})

        vim.keymap.set("n", "[d",
            function() vim.diagnostic.goto_prev() end, opts,
            {desc = "Move to prev error"})

        vim.keymap.set("n", "]d",
            function() vim.diagnostic.goto_next() end, opts,
            {desc = "Move to next error"})
    end
})
