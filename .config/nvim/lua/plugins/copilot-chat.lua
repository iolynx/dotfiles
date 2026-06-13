return {
	"CopilotC-Nvim/CopilotChat.nvim",
	dependencies = {
		{ "github/copilot.vim" },
		{ "nvim-lua/plenary.nvim" },
	},
	build = "make tiktoken",
	cmd = {
		"CopilotChat",
		"CopilotChatOpen",
		"CopilotChatToggle",
		"CopilotChatExplain",
		"CopilotChatReview",
		"CopilotChatFix",
		"CopilotChatOptimize",
		"CopilotChatDocs",
		"CopilotChatTests",
	},
	keys = {
		{ "<leader>cc", "<cmd>CopilotChatToggle<cr>", desc = "Copilot Chat" },
		{ "<leader>ce", "<cmd>CopilotChatExplain<cr>", desc = "Copilot Explain" },
		{ "<leader>cf", "<cmd>CopilotChatFix<cr>", desc = "Copilot Fix" },
		{ "<leader>co", "<cmd>CopilotChatOptimize<cr>", desc = "Copilot Optimize" },
		{ "<leader>cd", "<cmd>CopilotChatDocs<cr>", desc = "Copilot Docs" },
		{ "<leader>ct", "<cmd>CopilotChatTests<cr>", desc = "Copilot Tests" },
	},
	opts = {
		window = {
			layout = "vertical",
			width = 0.4,
			side = "left",
		},
	},
}
