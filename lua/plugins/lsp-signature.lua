return {
	"ray-x/lsp_signature.nvim",
	-- event = "VeryLazy",
	opts = {
		bind = true,
		handler_opts = {
			border = "rounded",
		},
	},
	config = function(_, opts)
		require("lsp_signature").setup(opts)

		vim.keymap.set({ "n" }, "<Leader>tsf", function()
			require("lsp_signature").toggle_float_win()
		end, { silent = true, noremap = true, desc = "[T]oggle [S]ignature [F]loating window" })

		vim.keymap.set({ "n" }, "<Leader>tsh", function()
			vim.lsp.buf.signature_help()
		end, { silent = true, noremap = true, desc = "[T]oggle [S]ignature [H]elp" })
	end,
}
