return {
  "nvimdev/zephyr-nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "echasnovski/mini.icons",
    "nvim-tree/nvim-web-devicons",
  },

  config = function()
    vim.cmd("colorscheme zephyr")
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  end,
}
