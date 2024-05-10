vim.g.slime_target = "tmux"

vim.g.slime_default_config = {socket_name = 'default', target_pane = "{last}"}

vim.g.slime_python_ipython = 1

vim.g.slime_dont_ask_default = 1

vim.keymap.set("n", "<C-c><C-x>", ":%SlimeSend<CR>")
