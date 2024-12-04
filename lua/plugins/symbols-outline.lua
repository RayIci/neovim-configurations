return {
	"simrat39/symbols-outline.nvim",
	config = function()
		require("symbols-outline").setup()
		vim.keymap.set(
			"n",
			"<Leader>so",
			"<cmd>SymbolsOutline<CR>",
			{ noremap = true, silent = true, desc = "[S]ymbols [O]utline" }
		)
	end,
}
