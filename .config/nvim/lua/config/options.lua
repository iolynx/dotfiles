-- NOTE OPTIONS

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- NOTE
vim.g.have_nerd_font = true

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.mouse = "a"

vim.opt.breakindent = true
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = "yes"

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = "  ", trail = "·", nbsp = "␣" }

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

vim.opt.cursorline = true
vim.cmd("hi CursorLine guibg=#40394F")
-- vim.api.nvim_set_hl(0, "CursorLine", { bg = "#40394F", blend = 88 })
-- Optional : Cursor'Line' like an actual underline
-- vim.api.nvim_set_hl(0, "CursorLine", { underline = true })

vim.opt.scrolloff = 13
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- highlight options
vim.api.nvim_set_hl(0, "IndentBlanklineContextChar", { fg = "#7A8382" })
-- its somewhere else rn

--Cursor options
vim.api.nvim_set_hl(0, "Cursor", { fg = "red", bg = "white" })
-- vim.opt.guicursor = "n-v-c:block,i-ci-ve:block/Cursor,r-cr:hor20"

-- line cursor (trad)
-- vim.opt.guicursor = "n-v-c:block-Cursor/lCursor,"
-- 	.. "i-ci:ver35-Cursor/lCursor-blinkwait200-blinkoff500-blinkon500,"
-- 	.. "ve:ver35-Cursor,"
-- 	.. "r-cr:hor20-Cursor/lCursor,"
-- 	.. "o:hor50-Cursor,"
-- 	.. "sm:block-Cursor"

-- goat block cursor (color diff when typing, blink)
vim.opt.guicursor = "n-v-c:block-Cursor/lCursor,"
	.. "i-ci:block/lCursor-blinkwait200-blinkoff500-blinkon500,"
	.. "ve:ver35-Cursor,"
	.. "r-cr:hor20-Cursor/lCursor,"
	.. "o:hor50-Cursor,"
	.. "sm:block-Cursor"

-- underline cursor ?!?
-- vim.opt.guicursor = "n-v-c:block-Cursor/lCursor,"
-- 	.. "i-ci:hor40/lCursor-blinkwait200-blinkoff500-blinkon500,"
-- 	.. "ve:ver35-Cursor,"
-- 	.. "r-cr:hor20-Cursor/lCursor,"
-- 	.. "o:hor50-Cursor,"
-- 	.. "sm:block-Cursor"

-- vim.opt.guicursor = "n-v-c:block-Cursor/lCursor,"
-- 	.. "i-ci:block/lCursor,"
-- 	.. "ve:ver35-Cursor,"
-- 	.. "r-cr:hor20-Cursor/lCursor,"
-- 	.. "o:hor50-Cursor,"
-- 	.. "sm:block-Cursor-blinkwait575-blinkoff550-blinkon575,"

-- Neovide only options:
if vim.g.neovide then
	vim.g.neovide_title_text_color = "white"
	-- vim.opt.guicursor = "n-v-c:block,i-ci-ve:hor15,r-cr:hor20"

	vim.opt.guicursor = "n-v-c:block-Cursor/lCursor,"
		.. "i-ci:hor18-Cursor/lCursor,"
		.. "ve:ver35-Cursor,"
		.. "r-cr:hor20-Cursor/lCursor,"
		.. "o:hor50-Cursor,"
		.. "sm:block-Cursor-blinkwait175-blinkoff150-blinkon175,"
		.. "a:blinkwait200-blinkoff500-blinkon500-Cursor/lCursor"
	-- vim.opt.guicursor = "n-v-c:block,i-ci-ve:block,r-cr:hor20"   -- only block

	vim.g.neovide_opacity = 0.45
	vim.g.neovide_window_blurred = true
	vim.g.neovide_floating_blur_amount_x = 1.5
	vim.g.neovide_floating_blur_amount_y = 1.5
	vim.g.neovide_fullscreen = false

	-- cursor animation length (lesser is faster)
	vim.g.neovide_cursor_animation_length = 0.015
	vim.g.neovide_refresh_rate = 150
	vim.g.neovide_cursor_vfx_mode = ""

	-- vim.opt.guifont = "0xProto\\ Nerd\\ Font:h11"
	vim.opt.guifont = "Iosevka\\ Nerd\\ Font:h14"
	-- vim.opt.guifont = "CaskaydiaCove \\NF:h11"
end
