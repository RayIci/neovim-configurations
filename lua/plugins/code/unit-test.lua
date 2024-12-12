local map = require("utils").mapkey

local test_adapters = function()
    return {
        require("neotest-python")({
            dap = { justMyCode = false },
        }),
    }
end

local keybind = function()
    map("n", "<leader>tr", "<cmd>lua require('neotest').run.run()<cr>", { desc = "[T]est: [R]un Nearest" })
    map(
        "n",
        "<leader>tf",
        "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>",
        { desc = "[T]est: Run [F]ile" }
    )
    map(
        "n",
        "<leader>td",
        "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>",
        { desc = "[T]est: [D]ebug Nearest" }
    )
    map("n", "<leader>tS", "<cmd>require('neotest').run.stop()<cr>", { desc = "[T]est: Stop" })
    map("n", "<leader>ta", "<cmd>lua require('neotest').run.attach()<cr>", { desc = "[T]est: [A]ttach" })
    map(
        "n",
        "<leader>tw",
        "<cmd>lua require('neotest').watch.toggle(vim.fn.expand('%'))<cr>",
        { desc = "[T]est: [W]atch File Toggle" }
    )
    map("n", "<leader>to", "<cmd>lua require('neotest').output.open()<cr>", { desc = "[T]est: [O]utput Open" })
    map(
        "n",
        "<leader>tO",
        "<cmd>lua require('neotest').output_panel.toggle()<cr>",
        { desc = "[T]est: [O]utput Panel Toggle" }
    )

    map("n", "<leader>tss", "<cmd>lua require('neotest').summary.toggle()<cr>", { desc = "[T]est: [S]ummary" })
end

return {
    "nvim-neotest/neotest",
    dependencies = {
        "nvim-neotest/nvim-nio",
        "nvim-lua/plenary.nvim",
        "antoinemadec/FixCursorHold.nvim",
        "nvim-treesitter/nvim-treesitter",

        -- Test language specific plugins
        "nvim-neotest/neotest-python",
    },
    config = function()
        require("neotest").setup({
            adapters = test_adapters(),
            cache = {
                enabled = true,
                path = vim.fn.stdpath("cache") .. "/neotest",
            },
        })

        keybind()
    end,
}
