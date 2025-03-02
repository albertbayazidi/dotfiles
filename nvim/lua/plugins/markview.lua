return {
  "OXY2DEV/markview.nvim",
  lazy = false, -- Recommended
  event = "VeryLazy",
  config = function()
    require("markview").setup({
      preview = {
        filetypes = {
          "markdown",
          "mdx",
        },
        ignore_buftypes = { "typst" },
      },
    })
  end
}
