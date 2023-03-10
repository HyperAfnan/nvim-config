local builtin = require("telescope.builtin")

local function set_keymap(mode, lhs, rhs)
	vim.keymap.set(mode, lhs, rhs, { silent = true, noremap = true })
end

vim.g.mapleader = ","

-- Normal
set_keymap("", "k", "gk")
set_keymap("", "j", "gj")
set_keymap("n", "<CR>", "<esc>o")
set_keymap("n", "q", ":q<CR>")
set_keymap("n", "w", ":w<CR>")
set_keymap("n", "<space>", ":")
set_keymap("v", "<space>", ":")
set_keymap("n", ",,x", ":write<CR> :source %<CR>")

-- single line movement
set_keymap("n", "<A-left>", "0")
set_keymap("n", "<A-right>", "$")
set_keymap("i", "<A-right>", "<ESC>$ i")
set_keymap("i", "<A-left>", "<ESC>0 i")

-- Indentation
set_keymap("v", "<", "<gv")
set_keymap("v", ">", ">gv")
set_keymap("n", "<", "<<")
set_keymap("n", ">", ">>")

set_keymap("t", "<ESC>", "<C-\\><C-n>")

-- for split movement
set_keymap("", "<A-h>", "<C-w>h")
set_keymap("", "<A-j>", "<C-w>j")
set_keymap("", "<A-k>", "<C-w>k")
set_keymap("", "<A-l>", "<C-w>l")

-- for quick buffer switching
set_keymap("n", "<tab>", ":bnext<CR>")
set_keymap("n", "<S-tab>", ":bprevious<CR>")
set_keymap("n", ",bd", ":bdelete!<CR>")

-- For quickfix list
set_keymap("n", "<C-j>", ":cnext<CR>")
set_keymap("n", "<C-h>", ":cprev<CR>")

set_keymap("n", "Y", "y$")

-- For quick renames
set_keymap("n", ",rr", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

--Some custom completion
set_keymap("i", "<C-c>", "<C-x><C-v>") -- for Commands
set_keymap("i", "<C-f>", "<C-x><C-f>") -- for files

-- Telescope
set_keymap("n", "<leader>ff", builtin.find_files)
set_keymap("n", "<leader>fg", builtin.live_grep)
set_keymap("n", "<leader>fb", builtin.buffers)
set_keymap("n", "<leader>fh", builtin.help_tags)

-- Remaps
set_keymap("n", ",ghs", ":Gitsigns stage_hunk<CR>")
set_keymap("n", ",ghr", ":Gitsigns reset_hunk<CR>")
set_keymap("n", ",gbs", ":Gitsigns stage_buffer<CR>")
set_keymap("n", ",gbr", ":Gitsigns reset_buffer<CR>")
set_keymap("n", ",ghu", "<cmd>Gitsigns undo_stage_hunk<CR>")
