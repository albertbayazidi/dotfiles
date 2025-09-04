return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local telecsope_builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>ff', telecsope_builtin.find_files,
            { desc = "fa" })
        vim.keymap.set('n', '<leader>fg', telecsope_builtin.live_grep,
            { desc = "fa" })
        vim.keymap.set('n', '<leader>fb', telecsope_builtin.buffers,
            { desc = "fa" })
        vim.keymap.set('n', '<leader>fh', telecsope_builtin.help_tags,
            { desc = "fa" })
    end
}
