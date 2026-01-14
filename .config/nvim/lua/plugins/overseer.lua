return {
	"stevearc/overseer.nvim",
	enabled = false,
	setup = function()
		require("overseer").setup({
			templates = { "builtin" },
		})
	end,
	opts = {},
}
