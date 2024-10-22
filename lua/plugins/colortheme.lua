return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	lazy = false,
	config = function()
		require("catppuccin").setup({ flavour = "macchiato", transparent_background = false })
		vim.cmd.colorscheme("catppuccin")
	end,
}
