return {
  'chomosuke/typst-preview.nvim',
  lazy = false, -- or ft = 'typst'
  version = '0.3.*',
  dependencies_bin = "tinymist",
  build = function() require 'typst-preview'.update() end,
}
