return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local harpoon = require("harpoon")
        local ui = require("harpoon.ui")

        harpoon.setup()

        vim.keymap.set("n",
            "<leader>a", function()
                harpoon:list():add() end,
            { desc = "Add current file to harpoon menu" })

        vim.keymap.set("n",
            "<C-e>", function()
                harpoon.ui:toggle_quick_menu(harpoon:list()) end,
            { desc = "Open quick menu" })

        vim.keymap.set("n",
            "<C-h>", function()
                harpoon:list():select(1) end,
            { desc = "Open first file in menu" })

        vim.keymap.set("n",
            "<C-t>", function()
                harpoon:list():select(2) end,
            { desc = "Open second file in menu" })

-- Toggle previous & next buffers stored within Harpoon list
        vim.keymap.set("n",
             "<C-p>", function()
                harpoon:list():prev() end,
            { desc = "Go to prev buffer" })

        vim.keymap.set("n",
            "<C-n>", function()
                harpoon:list():next() end,
            { desc = "Go to next buffer" })
    end
}


