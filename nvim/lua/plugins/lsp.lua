return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "williamboman/mason.nvim",
    "neovim/nvim-lspconfig",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/nvim-cmp",
    {
      "L3MON4D3/LuaSnip",
      version = "v2.*",
      build = "make install_jsregexp",
    },
    "saadparwaiz1/cmp_luasnip",
  },

  config = function()
    require("mason").setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
        }
      }
    })
    require("mason-lspconfig").setup({
      ensure_installed = {
        "gopls",
        "lua_ls",
        "astro",
        "tinymist",
        "html",
        "htmx",
        "clangd",
      },

      handlers = {
        function(server_name)
          require("lspconfig")[server_name].setup {}
        end
      }
    })

    local cmp = require("cmp")
    local cmp_select = { behavior = cmp.SelectBehavior.Select }

    cmp.setup({
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-p>"] = cmp.mapping.select_prev_item(
          cmp_select,
          { desc = "Pick prev suggestion" }),

        ["<C-n>"] = cmp.mapping.select_next_item(
          cmp_select,
          { desc = "Pick next suggestion" }),

        ["<C-y>"] = cmp.mapping.confirm({ select = true }
        , { desc = "confirm" }),

        ["<C-Space>"] = cmp.mapping.complete(),
      }),
      sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "path" },
        },
        { { name = "buffer" }, })
    })

    local lspconfig = require("lspconfig")
    lspconfig.lua_ls.setup({
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim", "none" }
          }
        }
      }
    })
  end
}
