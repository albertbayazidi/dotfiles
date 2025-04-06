return {
    'chomosuke/typst-preview.nvim',
    ft = "typst",
    version = '1.*',
    --dependencies_bin = "tinymist",
    opts = {
        debug = true,
        port = 6969,
        partial_rendering = true,
        invert_colors = 'never',
        get_root = function(path_of_main_file)
            local root = os.getenv 'TYPST_ROOT'
            if root then
                return root
            end
            return vim.fn.fnamemodify(path_of_main_file, ':p:h')
        end,

        get_main_file = function(path_of_buffer)
            return path_of_buffer
        end,
    }
}
