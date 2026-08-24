return {
  "olimorris/codecompanion.nvim",
  version = "^19.0.0",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    {
        "MeanderingProgrammer/render-markdown.nvim",
        ft = { "markdown", "codecompanion" }
    },
  },
  opts = {
      adapters = {
          acp = {
              gemini_cli = function()
                  return require("codecompanion.adapters").extend("gemini_cli", {
                      defaults = {
                          auth_method = "oauth-personal", -- "oauth-personal"|"gemini-api-key"|"vertex-ai"
                      }
                  })
              end,
          },
      },
      interactions = {
          chat = {
              adapter = "anthropic",
              model = "claude-opus-5"
          },
          inline = {
              adapter = "anthropic",
              model = "claude-opus-5"
          },
      },
  },
}

