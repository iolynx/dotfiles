local capabilities = require("blink.cmp").get_lsp_capabilities()

-- Lua
vim.lsp.config("lua_ls", {
	capabilities = capabilities,
	settings = {
		Lua = {
			diagnostics = { globals = { "vim" } },
			completion = { callSnippet = "Replace" },
		},
	},
})

vim.lsp.config("ts_ls", {
	capabilities = capabilities,
	filetypes = {
		"typescript",
		"typescriptreact",
		"javascript",
		"javascriptreact",
	},
})

-- Python
vim.lsp.config("pyright", {
	capabilities = capabilities,
})

-- C/C++
vim.lsp.config("clangd", {
	capabilities = capabilities,
})

-- Tailwind
vim.lsp.config("tailwindcss", {
	capabilities = capabilities,
})

-- Enable servers
vim.lsp.enable({
	"lua_ls",
	"pyright",
	"clangd",
	"ts_ls",
})
