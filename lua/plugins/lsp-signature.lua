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

		vim.keymap.set({ "n" }, "<Leader>tf", function()
			require("lsp_signature").toggle_float_win()
		end, { silent = true, noremap = true, desc = "[T]oggle [s]ignature [f]loating window" })

		vim.keymap.set({ "n" }, "<Leader>th", function()
			vim.lsp.buf.signature_help()
		end, { silent = true, noremap = true, desc = "[T]oggle [s]ignature [h]elp" })
	end,
}
