return {
  'tpope/vim-fugitive',
  lazy = true,
  config = function()
    vim.keymap.set('n', '<leader>gs', function()
      vim.cmd.vsplit()
      vim.cmd '0G'
    end)
  end,
}
