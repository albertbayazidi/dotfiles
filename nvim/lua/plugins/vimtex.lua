return {
  "lervag/vimtex",
  lazy = false,     -- we don't want to lazy load VimTeX
  config = function()
        vim.g.vimtex_view_method = "zathura"
  end
}
