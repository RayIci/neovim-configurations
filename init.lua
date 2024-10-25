-- NEOVIM SETTINGS
require("core.keymaps") -- keymaps
require("core.options") -- options

-- Lazy package manager setup
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Lazy plugin setup
require("lazy").setup({
	require("plugins.lsp"), -- neovim language server protocol plugin
	require("plugins.none-ls"), -- linting, formatting, etc... with lsp

	require("plugins.colortheme"), -- neovim theme
	require("plugins.neotree"), -- neovim file tree
	require("plugins.telescope"), -- neovim file search and other
	require("plugins.treesitter"), -- code highlight and other
	require("plugins.bufferline"), -- buffered windows
	require("plugins.lualine"), -- neovim status bar
	require("plugins.cmp-autocompletion"), -- code completition
	require("plugins.alpha"), -- neovim starting page
	require("plugins.indent-blankline"), -- neovim indent lines
	require("plugins.inc-rename"), -- rename project varaible
	require("plugins.git-integration"), -- git integration
	require("plugins.lsp-signature"), -- function signature
	require("plugins.misc"), -- useful other plugins
})
