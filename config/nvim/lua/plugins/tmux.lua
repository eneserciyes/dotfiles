-- Seamless navigation between nvim splits and tmux panes.
--   <C-h/j/k/l> moves to the adjacent nvim split; at the edge it crosses into
--   the neighbouring tmux pane instead. Requires the matching bindings in
--   config/tmux/tmux.conf.

return {
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
    },
    keys = {
      { "<C-h>", "<cmd>TmuxNavigateLeft<CR>", desc = "Go to left window/pane" },
      { "<C-j>", "<cmd>TmuxNavigateDown<CR>", desc = "Go to lower window/pane" },
      { "<C-k>", "<cmd>TmuxNavigateUp<CR>", desc = "Go to upper window/pane" },
      { "<C-l>", "<cmd>TmuxNavigateRight<CR>", desc = "Go to right window/pane" },
    },
  },
}
