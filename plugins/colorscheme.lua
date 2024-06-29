
return {
    'nvimdev/zephyr-nvim',
    config = function()
        vim.cmd("colorscheme zephyr")
        vim.api.nvim_set_hl(0,"Normal",{bg = "none"})
    end
}

