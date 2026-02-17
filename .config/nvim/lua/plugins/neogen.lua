return {
	"danymat/neogen",
	enabeld = false,
	config = function()
		require("neogen").setup({
			enabled = true, -- optional, enables the plugin
			languages = {
				javascript = {
					template = {
						annotation_convention = "jsdoc",
					},
				},
			},
		})

		-- Keymap for generating docs
		local opts = { noremap = true, silent = true }
		vim.api.nvim_set_keymap("n", "<Leader>nf", ":lua require('neogen').generate()<CR>", opts)
	end,
	-- Uncomment if you want to follow only stable versions
	-- version = "*"
}
