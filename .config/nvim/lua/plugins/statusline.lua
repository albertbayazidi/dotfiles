local separators = {
    component = { left = '', right = '' },
    section = { left = '', right = '' },
}

local diff_component = {
    'diff',
    colored = true,
    symbols = {
        added = '',
        modified = '~',
        removed = '',
    },
}

local options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = separators.component,
    section_separators = separators.section,
    always_divide_middle = true,
    globalstatus = true,
    refresh = {
        statusline = 200,
        tabline = 500,
        winbar = 300,
    },
}

local filename = {
    'filename',
    file_status = true,
    newfile_status = false,
    path = 0,

    shorting_target = 20,

    symbols = {
        modified = '[+]',
        readonly = '[-]',
        unnamed = '[No Name]',
        newfile = '[New]',
    },
}

local lsp_status = {
    'lsp_status',
    icon = '',
    symbols = {
        spinner = { '⠋', '⠙', '⠹', '⠸', '⠼', '⠴', '⠦', '⠧', '⠇', '⠏' },
        done = '',
        separator = ' ',
    },
    ignore_lsp = {},
}

local sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch', diff_component },
    lualine_c = { filename },

    lualine_x = { 'diagnostics', 'fileformat', lsp_status },
    lualine_y = { 'searchcount', 'filetype' },
    lualine_z = { 'progress' },
}

return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        require('lualine').setup {
            options = options,
            sections = sections,
            inactive_section = sections,
        }
    end,
}
