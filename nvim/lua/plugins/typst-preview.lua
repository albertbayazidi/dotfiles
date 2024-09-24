return {
  'chomosuke/typst-preview.nvim',
  lazy = false, -- or ft = 'typst'
  version = '0.3.*',
  dependencies_bin = "tinymist",
 -- config = function()
   -- local typst = require("typst-preview")
  --  typst.setup({
   --   debug = true,
   -- })
 -- end,

  build = function() require 'typst-preview'.update() end,

}
