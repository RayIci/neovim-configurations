-- For debug adapter installation see:
-- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation

return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
	},
	config = function()
		local dap = require("dap")

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

		-- Setup the daps here
	end,
}
