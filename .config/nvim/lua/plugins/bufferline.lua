return {
	"akinsho/bufferline.nvim",
	enabled = true,
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	offsets = {
		{
			filetype = "neo-tree.nvim",
			text = function()
				return vim.fn.getcwd()
			end,
			highlight = "Directory",
			text_align = "left",
		},
	},
	config = function()
		vim.opt.termguicolors = true
		require("bufferline").setup({})
	end,
}
