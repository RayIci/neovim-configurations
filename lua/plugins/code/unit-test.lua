local map = require("utils").mapkey

local test_adapters = function()
    return {
        require("neotest-python")({
            dap = { justMyCode = false },
        }),
    }
end

local keybind = function()
    require("which-key").add({
        { "<leader>tt",  group = "Test" },
        { "<leader>ttr", "<cmd>lua require('neotest').run.run()<cr>",                   desc = "Run" },
        { "<leader>ttf", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", desc = "Run File" },
        { "<leader>ttd", "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>", desc = "Debug Nearest" },
        { "<leader>ttS", "<cmd>lua require('neotest').run.stop()<cr>",                  desc = "Stop" },
        { "<leader>tta", "<cmd>lua require('neotest').run.attach()<cr>",                desc = "Attach" },
        {
            "<leader>ttw",
            "<cmd>lua require('neotest').watch.toggle(vim.fn.expand('%'))<cr>",
            desc = "Watch File Toggle",
        },
        { "<leader>tto", "<cmd>lua require('neotest').output.open()<cr>",         desc = "Output Open" },
        { "<leader>ttc", "<cmd>lua require('neotest').output.close()<cr>",        desc = "Output Close" },
        { "<leader>ttO", "<cmd>lua require('neotest').output_panel.toggle()<cr>", desc = "Output Panel Toggle" },
        { "<leader>tts", "<cmd>lua require('neotest').summary.toggle()<cr>",      desc = "Summary Toggle" },
    })
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
