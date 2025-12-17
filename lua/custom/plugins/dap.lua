return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "leoluz/nvim-dap-go",
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
      "nvim-neotest/nvim-nio",
      "williamboman/mason.nvim",
      "theHamsta/nvim-dap-virtual-text"
    },
    config = function()
      local dap = require "dap"
      local ui = require "dapui"
      ui.setup()
      require("nvim-dap-virtual-text").setup()

      require('dap-go').setup({
          delve = {
              path = "dlv",
          }
      })

      vim.keymap.set("n", "<leader>bp", dap.toggle_breakpoint)
      vim.keymap.set("n", "<space>gb", dap.run_to_cursor)

      -- Eval var under cursor
      vim.keymap.set("n", "<space>?", function()
        ui.eval(nil, { enter = true })
      end)

      vim.keymap.set("n", "<F1>", dap.continue)
      vim.keymap.set("n", "<F2>", dap.step_into)
      vim.keymap.set("n", "<F3>", dap.step_over)
      vim.keymap.set("n", "<F4>", dap.step_out)
      vim.keymap.set("n", "<F5>", dap.step_back)
      vim.keymap.set("n", "<F6>", dap.restart)

      dap.listeners.after.event_initialized['dapui_config'] = ui.open
      dap.listeners.before.event_terminated['dapui_config'] = ui.close
      dap.listeners.before.event_exited['dapui_config'] = ui.close
    end,
  },
}

