return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "williamboman/mason.nvim", config = true },
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"saghen/blink.cmp",
		{ "j-hui/fidget.nvim", opts = {} },
	},
	config = function()
		require("lsp") -- load our own LSP module
	end,
}
