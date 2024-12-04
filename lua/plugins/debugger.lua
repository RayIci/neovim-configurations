-- For debug adapter installation see:
-- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation

return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
		"jay-babu/mason-nvim-dap.nvim",
	},
	config = function()
		local dap = require("dap")

		-- Mason packages
		local ensure_installed = {
			"python",
		}

		-- Adapters & Configurations
		local adapters = dap.adapters
		local configs = dap.configurations

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
		kmap.set("n", "<Leader>dc", dap.continue, { desc = "Debugger: continue" })
		kmap.set("n", "<Leader>dt", dap.toggle_breakpoint, { desc = "Debugger: toggle breakpoint" })

		-- Dap ui configurations
		local dapui = require("dapui")
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
		dapui.setup({})

		vim.fn.sign_define("DapBreakpoint", { text = "🛑", texthl = "", linehl = "", numhl = "" })

		-- Setup the daps here

		-- Mason download packages
		require("mason").setup()
		require("mason-nvim-dap").setup({
			ensure_installed = ensure_installed,
			automatic_installation = true,
		})

		-- Set the json decode function for deconding .launch.json files (vscode style debugging settings)
		local dap_vscode = require("dap.ext.vscode")
		dap_vscode.json_decode = vim.fn.json_decode

		local launch_settings_path = ".vscode/launch.json"
		dap_vscode.load_launchjs(launch_settings_path, nil)
	end,
}
