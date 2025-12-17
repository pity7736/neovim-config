-- lackluster
--return {
--    "slugbyte/lackluster.nvim",
--    lazy = false,
--    priority = 1000,
--    init = function()
        --vim.cmd.colorscheme("lackluster")
--        vim.cmd.colorscheme("lackluster-hack") -- my favorite
        -- vim.cmd.colorscheme("lackluster-mint")
--    end,
--}

-- nord
return {
  "dupeiran001/nord.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
  init = function()
	  vim.cmd.colorscheme("nord-dark")
  end
}

