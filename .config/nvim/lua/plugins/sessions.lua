return {
	"rmagatti/auto-session",
	lazy = false,

	keys = {
		{ "<leader>wr", "<cmd>AutoSession search<CR>", desc = "Session search" },
		{ "<leader>ww", "<cmd>AutoSession save<CR>", desc = "Save session" },
		{ "<leader>wt", "<cmd>AutoSession toggle<CR>", desc = "Toggle autosave" },
	},

	---@module "auto-session"
	---@type AutoSession.Config
	opts = {
		auto_restore = true,
		git_use_branch_name = true,
		git_auto_restore_on_branch_change = true,

		session_lens = {
			previewer = "active_buffer",
			mappings = {
				delete_session = { "i", "<C-d>" },
				alternate_session = { "i", "<C-s>" },
				copy_session = { "i", "<C-y>" },
			},
			theme_conf = {
				border = true,
				-- layout_config = {
				--   width = 0.8, -- Can set width and height as percent of window
				--   height = 0.5,
				-- },
			},
		},
	},
}
