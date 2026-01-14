-- [[ Basic Keymaps ]]
vim.keymap.set("i", "jk", "<Esc>l")
vim.keymap.set("i", "kj", "<Esc>l")

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
vim.keymap.set("n", "<C-n>", "<cmd>cnext<CR>")
vim.keymap.set("n", "<C-p>", "<cmd>cprev<CR>")

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

--  See `:help wincmd` for a list of all window commands
-- vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
-- vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
-- vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
-- vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- replacing everything ^ here ^ with tmux-navigation
vim.keymap.set("n", "C-h", "<cmd> TmuxNavigateLeft<CR>", { desc = "window left" })
vim.keymap.set("n", "C-j", "<cmd> TmuxNavigateDown<CR>", { desc = "window down" })
vim.keymap.set("n", "C-k", "<cmd> TmuxNavigateUp<CR>", { desc = "window up" })
vim.keymap.set("n", "C-l", "<cmd> TmuxNavigateRight<CR>", { desc = "window right" })

-- This is for pasting from the system clipboard
vim.keymap.set("v", "<S-p>", '"+p')
vim.keymap.set("n", "<S-p>", '"+p')
vim.keymap.set("v", "<S-y>", '"+y')
vim.keymap.set("n", "<S-y>", '"+y')
vim.keymap.set("i", "<C-S-v>", '<Esc>"+pa')

-- For switching between buffers using Alt H, L
vim.api.nvim_set_keymap("n", "<M-h>", ":BufferLineCyclePrev<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<M-l>", ":BufferLineCycleNext<CR>", { noremap = true })
-- vim.api.nvim_set_keymap("n", "<M-i>", ":bd!<CR>", { noremap = true })

-- neogen
--- vim.api.nvim_set_keymap("n", "<Leader>pf", ":lua require('neogen').generate()<CR>", { noremap = true, silent = true })

-- Ctrl Backspace
vim.api.nvim_set_keymap("i", "<C-BS>", "<C-w>", { noremap = true })
vim.api.nvim_set_keymap("i", "<C-h>", "<C-w>", { noremap = true })

-- folds

-- barbar commands
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- these are all barbar commands, im not using barbar anymore so commenting them
-- Move to previous/next
-- map("n", "<A-h>", "<Cmd>BufferPrevious<CR>", opts)
-- map("n", "<A-l>", "<Cmd>BufferNext<CR>", opts)

-- Re-order to previous/next
-- map("n", "<A-<>", "<Cmd>BufferMovePrevious<CR>", opts)
-- map("n", "<A->>", "<Cmd>BufferMoveNext<CR>", opts)

-- Close buffer
-- map("n", "<A-i>", "<Cmd>BufferClose<CR>", opts)

-- Magic buffer-picking mode
map("n", "<A-p>", "<Cmd>BufferLinePick<CR>", opts)
map("n", "<A-S-p>", "<Cmd>BufferPickDelete<CR>", opts)

vim.keymap.set("n", "<M-i>", function()
	local bd = require("mini.bufremove").delete
	if vim.bo.modified then
		local choice = vim.fn.confirm(("Save changes to %q?"):format(vim.fn.bufname()), "&Yes\n&No\n&Cancel")
		if choice == 1 then -- Yes
			vim.cmd.write()
			bd(0, false)
		elseif choice == 2 then -- No
			bd(0, true)
		end
	else
		bd(0, false)
	end
end, { desc = "Delete Buffer (Preserve Layout)" })

-- Sort automatically by...
map("n", "<leader>bb", "<Cmd>BufferOrderByBufferNumber<CR>", opts)
map("n", "<leader>bn", "<Cmd>BufferOrderByName<CR>", opts)
map("n", "<leader>bd", "<Cmd>BufferOrderByDirectory<CR>", opts)
map("n", "<leader>bl", "<Cmd>BufferOrderByLanguage<CR>", opts)
map("n", "<leader>bw", "<Cmd>BufferOrderByWindowNumber<CR>", opts)

-- for shifting lines with J K etc (i think)
vim.keymap.set("v", "J", ":m '>+1<CR>gv-gv")
vim.keymap.set("v", "K", ":m '>-2<CR>gv-gv")
