return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local telescope = require('telescope')
        telescope.setup {
            defaults = {
                file_ignore_patterns = {
                    "backups",
                    "personlig",
                    "software"
                }
            }
        }

        local telescope_builtin = require('telescope.builtin')

        vim.keymap.set('n', '<leader>ff', telescope_builtin.find_files, { desc = "fa" })
        vim.keymap.set('n', '<leader>fg', telescope_builtin.live_grep, { desc = "fa" })
        vim.keymap.set('n', '<leader>fb', telescope_builtin.buffers, { desc = "fa" })
        vim.keymap.set('n', '<leader>fh', telescope_builtin.help_tags, { desc = "fa" })
    end
}
