-- For debug adapter installation see:
-- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation

local keymaps = function()
    local map = require("utils").mapkey

    require("which-key").add({
        { "<leader>db", group = "Debugger" },
        { "<leader>dbb", "<cmd>lua require('dap').toggle_breakpoint()<cr>", desc = "Toggle Breakpoint" },
        {
            "<leader>dbc",
            function()
                require("dap.ext.vscode").json_decode = vim.fn.json_decode
                require("dap.ext.vscode").load_launchjs(".vscode/launch.json", nil)
                require("dap").continue()
            end,
            desc = "Continue",
        },
        { "<leader>dbr", "<cmd>lua require('dap').run()<cr>", desc = "Run" },
        { "<leader>dbp", "<cmd>lua require('dap').pause()<cr>", desc = "Pause" },
        { "<leader>dbk", "<cmd>lua require('dap').terminate()<cr>", desc = "Kill" },

        { "<leader>dbt", "<cmd>lua require('nvim-dap-virtual-text').toggle()<cr>", desc = "Toggle Virtual Text" },

        { "<leader>dbu", group = "Debugger Ui" },
        { "<leader>dbut", "<cmd>lua require('dapui').toggle()<cr>", desc = "Toggle Ui" },
        { "<leader>dbur", "<cmd>lua require('dapui').open({ reset = true })<cr>", desc = "Reset Ui" },

        { "<leader>dbs", "<cmd>lua require('dapui').float_element('scopes')<cr>", desc = "Floating Scopes" },
        { "<leader>dbB", "<cmd>lua require('dapui').float_element('breakpoints')<cr>", desc = "Floating Breakpoint" },
        { "<leader>dbS", "<cmd>lua require('dapui').float_element('stacks')<cr>", desc = "Floating Stacks" },
        { "<leader>dbw", "<cmd>lua require('dapui').float_element('watches')<cr>", desc = "Floating Watches" },
        { "<leader>dbR", "<cmd>lua require('dapui').float_element('repl')<cr>", desc = "Floating Repl" },

        { "<leader>dbe", "<cmd>lua require('dapui').eval()<cr>", desc = "Floating Evaluate" },
    })

    map("n", "<F5>", require("dap").continue, { desc = "Debugger: continue" })
    map("n", "<F1>", require("dap").step_into, { desc = "Debugger: step into" })
    map("n", "<F2>", require("dap").step_over, { desc = "Debugger: step over" })
    map("n", "<F3>", require("dap").step_out, { desc = "Debugger: step out" })
end

local dapui_setup = {
    layouts = {
        {
            elements = {
                { id = "scopes", size = 0.25 },
                { id = "breakpoints", size = 0.25 },
                { id = "stacks", size = 0.25 },
                { id = "watches", size = 0.25 },
            },
            size = 40,
            position = "left",
        },
        {
            elements = {
                { id = "repl", size = 0.5 },
                { id = "console", size = 0.5 },
            },
            size = 15,
            position = "bottom",
        },
    },
    floating = {
        border = "rounded",
        mappings = {
            close = { "q", "<Esc>" },
        },
    },
    windows = {
        indent = 1,
    },
}

return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "theHamsta/nvim-dap-virtual-text",

        -- Dap language specific packages
        "mfussenegger/nvim-dap-python",

        -- Mason
        "williamboman/mason.nvim",
        "mfussenegger/nvim-dap",
        "jay-babu/mason-nvim-dap.nvim",
    },
    config = function()
        local dap = require("dap")

        require("mason").setup()
        require("mason-nvim-dap").setup({
            ensure_installed = { "python" },
            automatic_installation = true,
        })

        -- Check if you are using widndows or linux and return the right
        -- python command. This is not required to search for the full
        -- path (even if u are usign a venv) because if the venv is
        -- active the python command is available and it uses the one
        -- provided by the virtual environment
        -- require("dap-python").setup(vim.loop.os_uname().sysname == "Windows_NT" and "python" or "python3")

        local mason_path = vim.fn.glob(vim.fn.stdpath("data") .. "/mason/")
        vim.print("Mason path: " .. mason_path)
        pcall(function()
            require("dap-python").setup(mason_path .. "packages/debugpy/venv/bin/python")
        end)

        -- Dap ui configurations
        local dapui = require("dapui")

        -- Open and close dapui automatically
        dap.listeners.before.attach.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
            dapui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
            dapui.close()
        end
        dapui.setup(dapui_setup)

        -- Virtual text setup (enable variables value inspection on screen near code line)
        require("nvim-dap-virtual-text").setup()

        local sign = vim.fn.sign_define
        sign("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = "" })
        sign("DapBreakpointCondition", { text = "●", texthl = "DapBreakpointCondition", linehl = "", numhl = "" })
        sign("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = "" })
        sign("DapStopped", { text = "", texthl = "DapStopped", linehl = "DapStopped", numhl = "DapStopped" })

        vim.api.nvim_set_hl(0, "DapBreakpoint", { ctermbg = 0, fg = "#993939" })
        vim.api.nvim_set_hl(0, "DapLogPoint", { ctermbg = 0, fg = "#61afef", bg = "#31353f" })
        vim.api.nvim_set_hl(0, "DapStopped", { ctermbg = 0, fg = "#98c379", bg = "#31353f" })
        keymaps()
    end,
}
