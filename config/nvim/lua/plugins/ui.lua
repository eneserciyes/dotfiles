-- UI polish: colorscheme + statusline. ENABLED — set `enabled = false` on a
-- spec to turn it back off.
-- (Treesitter, which is also "UI", lives in its own file: treesitter.lua.)
return {
  ----------------------------------------------------------------------------
  -- Colorscheme: Flexoki — an ink-on-paper palette, warm off-white (#fffcf0)
  -- against near-black (#100f0f). Backgrounds match `theme = light:Flexoki
  -- Light,dark:Flexoki Dark` in config/ghostty/config exactly, so the editor and
  -- the terminal stay in sync.
  -- NOTE: keep exactly ONE colorscheme spec enabled. vague and tokyonight are
  -- kept below, disabled, as easy alternatives.
  ----------------------------------------------------------------------------
  {
    "kepano/flexoki-neovim",
    name = "flexoki",
    enabled = true,
    priority = 1000,
    lazy = false,
    -- Follows the macOS system appearance: nvim detects the terminal background
    -- at startup and re-detects when ghostty sends a theme-change notification,
    -- which flips 'background' and reloads the colorscheme. Plain "flexoki" (not
    -- "flexoki-dark") is the variant-picking entry point — it loads with
    -- `variant = 'auto'`, which reads 'background' — so no autocmd is needed.
    config = function()
      vim.cmd.colorscheme("flexoki")
    end,
  },

  {
      "vague-theme/vague.nvim",
      enabled = false,
      priority = 1000,
      lazy = false,
      config = function()
          vim.cmd("colorscheme vague")
      end,
  },
  -- Alternative: tokyonight. To use it, set enabled = true and disable flexoki.
  -- Also follows the system appearance. Plain "tokyonight" (not
  -- "tokyonight-night") is the variant-picking entry point: it resolves to
  -- `style` on a dark background and to "day" on a light one.
  {
    "folke/tokyonight.nvim",
    enabled = false, -- set to true to enable (and disable the others)
    priority = 1000,
    opts = { style = "night" }, -- the dark half of the pair
    config = function(_, opts)
      require("tokyonight").setup(opts)
      vim.cmd.colorscheme("tokyonight")
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
