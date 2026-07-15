-- File navigation:
--   * oil   — file exploration

return {
  ----------------------------------------------------------------------------
  -- Oil for filetree navigations
  ----------------------------------------------------------------------------
  {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- for the "icon" column
    lazy = false, -- load at startup so oil replaces netrw when opening a directory
    keys = {
      { "<leader>e", "<cmd>Oil<CR>", desc = "Open parent directory (oil)" },
    },
    opts = {
      view_options = { show_hidden = true },
      columns = { "icon" },
      keymaps = {
        ["<C-l>"] = false, -- keep window movement; unmap oil's default refresh
        ["<C-h>"] = false, -- keep window movement; unmap oil's default split-select
      },
      float = {
        max_width = 0.3,
        max_height = 0.6,
        border = "rounded",
      },
    },
  },
}
