vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ'z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("i", "jk", "<Esc>l")

vim.keymap.set("v", "Y", "\"+yy")
vim.keymap.set("n", "Y", "\"+yy")
vim.keymap.set("v", "P", "\"+p")
vim.keymap.set("n", "P", "\"+p")

vim.keymap.set("n", "<A-k>", "<C-^><CR>")
vim.keymap.set("n", "<A-l>", ":bd!<CR>")

vim.keymap.set("n", "<leader>l", ":BufferLineCycleNext<CR>")
vim.keymap.set("n", "<leader>h", ":BufferLineCyclePrev<CR>")

vim.keymap.set("i", "<M-BS>", "<C-W>")
--vim.keymap.set("i", "<M-BS>", "<C-W>")
 
-- COMPILE / RUN
vim.api.nvim_create_autocmd("FileType", { pattern = "cpp", 
    command = "nnoremap <buffer> <A-j> :vsplit<CR>:te g++ -Wshadow -Wall -o %:t:r % -g && %:r<CR>i"})

vim.api.nvim_create_autocmd("FileType", { pattern = "c", 
    command = "nnoremap <buffer> <A-j> :vsplit<CR>:te gcc -Wshadow -Wall -o %:t:r % -g && %:r<CR>i"})
