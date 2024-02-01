local dap = require('dap')
dap.adapters.python = {
  type = 'executable';
  command = vim.fn.environ()['CONDA_PREFIX'] .. '/bin/python';
  args = {'-m', 'debugpy.adapter'}
}

dap.configurations.python = {
  {
    type = 'python';
    request = 'launch';
    name = "Launch file";
    program = "${file}";
    pythonPath = function()
      return vim.fn.environ()['CONDA_PREFIX'] .. '/bin/python'
    end
  }
}

vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = 'Debug: Toggle Breakpoint' })
vim.keymap.set('n', '<F5>', dap.continue, { desc = 'Debug: Start/Continue' })
vim.keymap.set('n', '<F1>', dap.step_into, { desc = 'Debug: Step Into' })
vim.keymap.set('n', '<F2>', dap.step_over, { desc = 'Debug: Step Over' })
vim.keymap.set('n', '<F3>', dap.step_out, { desc = 'Debug: Step Out' })
