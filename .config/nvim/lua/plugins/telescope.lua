return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>ff', builtin.find_files,
            {desc = "fa"})
        vim.keymap.set('n', '<leader>fg', builtin.live_grep,
            {desc = "fa"})
        vim.keymap.set('n', '<leader>fb', builtin.buffers,
            {desc = "fa"})
        vim.keymap.set('n', '<leader>fh', builtin.help_tags,
            {desc = "fa"})

    end
       }
