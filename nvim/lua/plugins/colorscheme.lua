return {
        "ntk148v/habamax.nvim",
        dependencies={ "rktjmp/lush.nvim" }, 
        config = function()
            vim.cmd("colorscheme habamax")

            -- background none
            vim.api.nvim_set_hl(0,"Normal",{bg = "none"})
        end
        }
