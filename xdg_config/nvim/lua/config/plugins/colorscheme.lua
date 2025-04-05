return {
  -- {
  --   "rose-pine/neovim",
  --   lazy = false,
  --   priority = 1000,
  --   opts = {
  --     styles = {
  --       bold = true,
  --       italic = false,
  --       transparency = false,
  --     },
  --   },
  --   config = function(_, opts)
  --     require('rose-pine').setup(opts)
  --     vim.cmd.colorscheme "rose-pine-moon"
  --   end
  -- }
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function(_, opts)
      require('catppuccin').setup(opts)
      vim.cmd.colorscheme "catppuccin"
    end
  },

}
