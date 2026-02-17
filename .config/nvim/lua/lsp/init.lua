local M = {}

-- Shared on-attach logic
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("user-lsp-attach", { clear = true }),
	callback = function(event)
		local map = function(keys, func, desc, mode)
			mode = mode or "n"
			vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
		end

		local tb = require("telescope.builtin")

		map("gd", tb.lsp_definitions, "[G]oto [D]efinition")
		map("gr", tb.lsp_references, "[G]oto [R]eferences")
		map("gI", tb.lsp_implementations, "[G]oto [I]mplementation")
		map("<leader>D", tb.lsp_type_definitions, "Type [D]efinition")
		map("<leader>ds", tb.lsp_document_symbols, "[D]ocument [S]ymbols")
		map("<leader>ws", tb.lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

		map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
		map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction", { "n", "x" })
		map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

		local client = vim.lsp.get_client_by_id(event.data.client_id)

		if client and client:supports_method("textDocument/inlayHint") then
			map("<leader>th", function()
				vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
			end, "[T]oggle Inlay [H]ints")
		end
	end,
})

-- Diagnostics signs
if vim.g.have_nerd_font then
	local signs = { ERROR = "", WARN = "", INFO = "", HINT = "" }
	local diag = {}
	for k, v in pairs(signs) do
		diag[vim.diagnostic.severity[k]] = v
	end
	vim.diagnostic.config({ signs = { text = diag } })
end

-- Load servers
require("lsp.servers")

return M
