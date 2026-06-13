return {
	"github/copilot.vim",
	event = "InsertEnter",
	config = function()
		vim.g.copilot_no_tab_map = true

		vim.keymap.set("i", "<C-l>", 'copilot#Accept("\\<CR>")', {
			expr = true,
			replace_keycodes = false,
			desc = "Copilot Accept",
		})

		vim.keymap.set("i", "<M-]>", "<Plug>(copilot-next)")
		vim.keymap.set("i", "<M-[>", "<Plug>(copilot-previous)")
		vim.keymap.set("i", "<C-]>", "<Plug>(copilot-dismiss)")
	end,
}
