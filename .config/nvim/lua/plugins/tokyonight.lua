return {
	{
		"folke/tokyonight.nvim",
		enabled = true,
		priority = 1000,
		init = function()
			vim.cmd.colorscheme("tokyonight-night")

			-- You can configure highlights by doing something like:
			--how do i do this
			vim.cmd.hi("Comment gui=none")
		end,
	},
}
