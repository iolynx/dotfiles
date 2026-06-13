return {
	"2kabhishek/seeker.nvim",
	dependencies = { "nvim-telescope/telescope.nvim" },
	enabled = false,
	cmd = { "Seeker" },
	keys = {
		{ "<leader>sf", ":Seeker files<CR>", desc = "Seek Files" },
		{ "<leader>sg", ":Seeker grep<CR>", desc = "Seek Grep" },
		{ "<leader>fw", ":Seeker grep_word<CR>", desc = "Seek Grep Word" },
	},
	opts = {
		picker_provider = "telescope",
	},
}
