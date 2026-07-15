-- Keymaps that don't belong to a specific plugin. (Plugin keymaps live next to
-- their plugin in lua/plugins/.) Leader is <Space>.
local map = vim.keymap.set

-- Clear search highlight on <Esc>.
map("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })

-- Toggle soft-wrap (off by default; handy for prose / markdown).
map("n", "<leader>tw", "<cmd>set wrap!<CR>", { desc = "[T]oggle [w]rap" })

-- Floating cheat-sheet overlay (a tab per tool). See lua/config/cheatsheet.lua.
map("n", "<leader>?", function() require("config.cheatsheet").open() end, { desc = "Cheat sheet overlay" })

-- Move between splits/windows with Ctrl + h/j/k/l. These are provided by
-- vim-tmux-navigator (see lua/plugins/tmux.lua) so they also cross into tmux
-- panes at the edge of the window layout.

-- Cycle buffers (VSCode-like tab switching).
map("n", "<S-l>", "<cmd>bnext<CR>", { desc = "Next buffer" })
map("n", "<S-h>", "<cmd>bprevious<CR>", { desc = "Previous buffer" })

-- Keep the cursor centered on half-page scroll and search jumps.
map("n", "<C-d>", "<C-d>zz", { desc = "Half-page down (centered)" })
map("n", "<C-u>", "<C-u>zz", { desc = "Half-page up (centered)" })
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Move the visual selection up/down (like Alt+Up/Down in VSCode).
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Stay in visual mode after shifting indentation.
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Conveniences
map('n', '<leader>w', ':write<CR>')
map('n', '<leader>q', ':quit<CR>')
