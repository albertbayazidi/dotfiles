return { {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      ensure_installed = {
        "c", "cmake", "zig", "go",
        "bash", "lua", "sql", "python",
        "astro", "typescript", "javascript", "html",
        "typst"
      },

      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end
} }
