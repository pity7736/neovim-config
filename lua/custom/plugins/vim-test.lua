return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      { "fredrikaverpil/neotest-golang", version = "*" },
      "rouge8/neotest-rust",
      "nvim-neotest/neotest-python",
    },
    config = function()
      local neotest_golang_opts = {}  -- Specify custom configuration
      require("neotest").setup({
        adapters = {
          require("neotest-golang")(neotest_golang_opts),
          require("neotest-rust"),
          require("neotest-python")({
            dap = { justMyCode = false },
          }),
        },
      })
    end,
  },
}

