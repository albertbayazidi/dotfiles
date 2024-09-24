return { {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      ensure_installed = {
        "c", "cmake", "go",
        "bash", "lua", "sql", "python", "julia",
        "astro", "typescript", "javascript", "html",
        "typst",
        "json"
      },

      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end
} }
