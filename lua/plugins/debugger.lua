-- For debug adapter installation see:
-- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation

return {
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
}
