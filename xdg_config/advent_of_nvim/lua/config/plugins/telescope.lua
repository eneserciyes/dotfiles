return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
  },
  config = function()
    require('telescope').setup {
      pickers = {
        find_files = { theme = "ivy" },
        git_files = { theme = "ivy" }
      },
      extensions = {
        fzf = {}
      }
    }

    require('telescope').load_extension('fzf')

    vim.keymap.set("n", "<leader>fh", require('telescope.builtin').help_tags)
    vim.keymap.set("n", "<leader>ff", require('telescope.builtin').find_files)
    vim.keymap.set("n", "<leader>en", function()
      require('telescope.builtin').find_files {
        cwd = vim.fn.stdpath("config")
      }
    end)

    -- git
    vim.keymap.set("n", "<C-p>", require('telescope.builtin').git_files)

    -- lsp
    -- vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references)

    -- multi-grep
    require("config.telescope.multigrep").setup()
  end
}
