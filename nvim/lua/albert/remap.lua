--basic keymaps
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>p", vim.cmd.Ex)

-- complex keymaps
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "gj")
vim.keymap.set("n", "K", "gk")

vim.api.nvim_create_autocmd('LspAttach',{
    group = vim.api.nvim_create_augroup('UserLspConfig',
        { clear = true }),
    callback = function(e)
    local opts = {buffer = e.buf}
        vim.keymap.set("n", "gd",
            function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "h",
            function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("n", "go",
            function() vim.lsp.buf.type_definition() end, opts)
        vim.keymap.set("n", "rn",
            function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("n", "[d",
            function() vim.diagnostic.goto_prev() end, opts)
        vim.keymap.set("n", "]d",
            function() vim.diagnostic.goto_next() end, opts) 
    end
})




