-- UI polish: colorscheme + statusline. ENABLED — set `enabled = false` on a
-- spec to turn it back off.
-- (Treesitter, which is also "UI", lives in its own file: treesitter.lua.)
return {
  ----------------------------------------------------------------------------
  -- Colorscheme: Rosé Pine, matching the terminal palette in Ghostty.
  ----------------------------------------------------------------------------

  {
    "rose-pine/neovim",
    name = "rose-pine",
    priority = 1000,
    lazy = false,
    opts = { variant = "main" },
    config = function(_, opts)
      require("rose-pine").setup(opts)
      vim.cmd.colorscheme("rose-pine")
    end,
  },

  ----------------------------------------------------------------------------
  -- Statusline — the bottom bar: mode, git branch, diagnostics, file info.
  -- (mini.statusline is a lighter alternative if you want fewer deps.)
  ----------------------------------------------------------------------------
  {
    "nvim-lualine/lualine.nvim",
    enabled = true, -- set to false to disable
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        theme = "auto",
        globalstatus = true, -- one statusline shared across all splits
        section_separators = "",
        component_separators = "|",
      },
    },
  },

  ----------------------------------------------------------------------------
  -- Indent guides — faint vertical lines marking indent levels (like VS Code).
  ----------------------------------------------------------------------------
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      indent = { char = "│" },
      scope = { enabled = true, show_start = false, show_end = false },
    },
  },
}
