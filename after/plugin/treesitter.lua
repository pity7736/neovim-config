local parsers = { "go", "rust", "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" }

require("nvim-treesitter").install(parsers)

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "go", "rust", "c", "lua", "vim", "help", "query", "markdown" },
  callback = function()
    vim.treesitter.start()
  end,
})
