return {
	"xvzc/chezmoi.nvim",
	enabled = false,
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("chezmoi").setup({
			-- your configurations
		})
	end,
}
