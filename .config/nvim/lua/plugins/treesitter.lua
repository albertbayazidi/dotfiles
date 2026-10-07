return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = { "markview.nvim" },
  branch = "main",
  build = ":TSUpdate",
  lazy = false,
  config = function()
    local ensureInstalled = {
      "c",
      "cmake",
      "go",
      "bash",
      "lua",
      "sql",
      "python",
      "julia",
      "astro",
      "typescript",
      "javascript",
      "html",
      "typst",
      "markdown",
      "markdown_inline",
      "json",
      "java",
      "svelte",
    }

    local alreadyInstalled = require('nvim-treesitter.config').get_installed()
    local parsersToInstall = vim.iter(ensureInstalled)
      :filter(function(parser)
        return not vim.tbl_contains(alreadyInstalled, parser)
      end)
      :totable()

    if #parsersToInstall > 0 then
      require('nvim-treesitter').install(parsersToInstall)
    end

    vim.api.nvim_create_autocmd('FileType', {
      callback = function()
        pcall(vim.treesitter.start)
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
}
