vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Function to execute the current file based on filetype
_G.execute_file = function()
	local filetype = vim.bo.filetype
	local filepath = vim.fn.expand("%:p") -- Get full file path
	local cmd = ""

	if filetype == "cpp" then
		-- Compile and execute C++ file
		local executable = vim.fn.expand("%:r") -- Remove extension for the executable
		cmd = string.format('g++ "%s" -o "%s" && "./%s"', filepath, executable, executable)
	elseif filetype == "java" then
		-- Execute Java file
		cmd = string.format(' java "%s" ', filepath)
	elseif filetype == "python" then
		-- Execute Python file
		cmd = string.format('python "%s"', filepath)
	elseif filetype == "rust" then
		cmd = string.format("cargo run")
	else
		print("Filetype not supported for execution!")
		return
	end

	-- Open a terminal and run the command
	-- vim.cmd(string.format('split | terminal %s', cmd))
	-- Using toggleterm:
	require("toggleterm").exec(cmd, 1)
	vim.cmd("startinsert")
end

-- Create an autocmd to bind <Alt>j based on the filetype
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "cpp", "python", "java", "rust" },
	callback = function()
		vim.api.nvim_buf_set_keymap(0, "n", "<C-S-j>", "<cmd>lua execute_file()<CR>", { noremap = true, silent = true })
		vim.api.nvim_buf_set_keymap(0, "n", "<A-j>", "<cmd>lua execute_file()<CR>", { noremap = true })
	end,
})
