return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local treesitter_configs = require("nvim-treesitter.configs")
		treesitter_configs.setup({
			ensure_installed = {
				"javascript",
				"typescript",
				"tsx",
				"c_sharp",
				"html",
				"css",
				"python",
				"yaml",
				"sql",
				"bash",
				"markdown",
				"markdown_inline",
				"lua",
			},
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
