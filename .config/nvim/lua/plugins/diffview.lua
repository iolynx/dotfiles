return {
	"sindrets/diffview.nvim",
	dependencies = "nvim-lua/plenary.nvim", -- Required dependency
	cmd = { "DiffviewOpen", "DiffviewFileHistory" },
	config = true, -- Equivalent to require('diffview').setup({})
}
