-- For debug adapter installation see:
-- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation

local keymaps = function()
    local map = require("utils").mapkey

    require("which-key").add({
        { "<leader>db",  group = "Debugger" },
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
        { "<leader>dbr",  "<cmd>lua require('dap').run()<cr>",                          desc = "Run" },
        { "<leader>dbp",  "<cmd>lua require('dap').pause()<cr>",                        desc = "Pause" },
        { "<leader>dbk",  "<cmd>lua require('dap').terminate()<cr>",                    desc = "Kill" },

        { "<leader>dbs",  "<cmd>lua require('dap').step_over()<cr>",                    desc = "Step Over" },
        { "<leader>dbi",  "<cmd>lua require('dap').step_into()<cr>",                    desc = "Step Into" },
        { "<leader>dbo",  "<cmd>lua require('dap').step_out()<cr>",                     desc = "Step Out" },

        { "<leader>dbt",  "<cmd>lua require('nvim-dap-virtual-text').toggle()<cr>",     desc = "Toggle Virtual Text" },

        { "<leader>dbu",  group = "Debugger Ui" },
        { "<leader>dbut", "<cmd>lua require('dapui').toggle()<cr>",                     desc = "Toggle Ui" },
        { "<leader>dbur", "<cmd>lua require('dapui').open({ reset = true })<cr>",       desc = "Reset Ui" },

        { "<leader>dbus", "<cmd>lua require('dapui').float_element('scopes')<cr>",      desc = "Floating Scopes" },
        { "<leader>dbub", "<cmd>lua require('dapui').float_element('breakpoints')<cr>", desc = "Floating Breakpoint" },
        { "<leader>dbuS", "<cmd>lua require('dapui').float_element('stacks')<cr>",      desc = "Floating Stacks" },
        { "<leader>dbuw", "<cmd>lua require('dapui').float_element('watches')<cr>",     desc = "Floating Watches" },
        { "<leader>dbuR", "<cmd>lua require('dapui').float_element('repl')<cr>",        desc = "Floating Repl" },

        { "<leader>dbue", "<cmd>lua require('dapui').eval()<cr>",                       desc = "Floating Evaluate" },
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
                { id = "scopes",      size = 0.25 },
                { id = "breakpoints", size = 0.25 },
                { id = "stacks",      size = 0.25 },
                { id = "watches",     size = 0.25 },
            },
            size = 60,
            position = "right",
        },
        {
            elements = {
                { id = "repl",    size = 0.5 },
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
    },
    config = function()
        local dap = require("dap")

        -- Check if you are using widndows or linux and return the right
        -- python command. This is not required to search for the full
        -- path (even if u are usign a venv) because if the venv is
        -- active the python command is available and it uses the one
        -- provided by the virtual environment
        require("dap-python").setup(vim.loop.os_uname().sysname == "Windows_NT" and "python" or "python3")

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

        -- Dap breakpoint symbol on editor ➡  ⚫  ⚪  ⭕ 🔴   More: https://apps.timwhitlock.info/emoji/tables/unicode
        -- vim.fn.sign_define("DapBreakpoint", { text = "🔴", texthl = "", linehl = "", numhl = "" })

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

-- Old configurations
-- TODO: Delete when feel confortable to do it and everything works fine
--[[ return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "nvim-neotest/nvim-nio",
        "theHamsta/nvim-dap-virtual-text",
        "williamboman/mason.nvim",
        "jay-babu/mason-nvim-dap.nvim",
    },
    config = function()
        local dap = require("dap")

        -- Mason packages
        local ensure_installed = {
            "python",
        }

        local launch_settings_path = ".vscode/launch.json"

        -- Adapters & Configurations (no dap.configurations for now)
        local adapters = dap.adapters

        adapters.python = {
            type = "executable",
            command = "python",
            args = { "-m", "debugpy.adapter" },
        }

        -- Keymaps
        local kmap = vim.keymap
        kmap.set("n", "<F10>", dap.step_over, { desc = "Debugger: step over" })
        kmap.set("n", "<F11>", dap.step_into, { desc = "Debubber: step into" })
        kmap.set("n", "<F12>", dap.step_out, { desc = "Debugger: step out" })
        kmap.set("n", "<Leader>dc", function()
            -- Reload if any changes on vscode launch.json
            -- FIXME: now is commented bu the above line should get the new vscode dap.configurations if launch.json is
            -- modified while on the editor is opened. This happen because dap.ext.vscode load dap.configurations when
            -- neovim starts and so if the file .vscode/launch.json is modified the dap.configurations are not updated at runtime,
            -- a neovim restart is required.
            -- require("dap.ext.vscode").load_launchjs(launch_settings_path, nil)
            dap.continue()
        end, { desc = "[D]ebugger: [C]ontinue" })
        kmap.set("n", "<Leader>dt", ":lua require('dapui').toggle()<CR>", { desc = "[D]ebugger: [T]oggle" })
        kmap.set("n", "<Leader>db", dap.toggle_breakpoint, { desc = "[D]ebugger: Toggle [B]reakpoint" })
        kmap.set(
            "n",
            "<Leader>dr",
            ":lua require('dapui').open({ reset = true })<CR>",
            { desc = "[D]ebugger: [R]eset UI" }
        )

        -- Dap ui configurations
        local dapui = require("dapui")
        dap.listeners.before.attach.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
            dapui.open()
        end
        -- dap.listeners.after.event_initialized["dapui_config"] = function()
        --     dapui.open()
        -- end
        dap.listeners.before.event_terminated.dapui_config = function()
            dapui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
            dapui.close()
        end
        dapui.setup({})
        require("nvim-dap-virtual-text").setup()

        -- Dap breakpoint symbol on editor
        vim.fn.sign_define("DapBreakpoint", { text = "🔴", texthl = "", linehl = "", numhl = "" })

        -- Set the json decode function for deconding .vscode/launch.json files (vscode style debugging settings)
        require("dap.ext.vscode").json_decode = vim.fn.json_decode

        -- NOTE: Still to understand if is needed or not (not commented so unused)
        -- require("dap.ext.vscode").load_launchjs(launch_settings_path, nil)

        -- Setup the daps here
        -- Mason download packages
        require("mason").setup()
        require("mason-nvim-dap").setup({
            ensure_installed = ensure_installed,
            automatic_installation = true,
            handlers = {
                function(config)
                    require("mason-nvim-dap").default_setup(config)
                end,
                python = function(config)
                    config.adapters = adapters.python
                    require("mason-nvim-dap").default_setup(config)
                end,
            },
        })
    end,
} ]]
