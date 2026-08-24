-- Keymaps also live next to the plugin they belong to:
--   lua/custom/lsp.lua                 - gd, K (buffer-local, set in LspAttach)
--   lua/custom/plugins/dap.lua         - bp, gb, ?, F1-F6 (debugging)
--   lua/custom/plugins/luasnip.lua     - C-j, C-k (snippet expand/jump)
--   lua/custom/plugins/gitsigns.lua    - hunk navigation/stage/reset
--   after/plugin/telescope.lua         - ff, fg, fb, fh, ss
--   after/plugin/harpoon.lua           - a, e, C-h/t/n/s/g/c, C-S-P/N
--   after/plugin/undotree.lua          - u

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.nu = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.incsearch = true
vim.opt.splitright = true
--vim.keymap.set("n", "<leader>ex", vim.cmd.Ex)

-- tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true
vim.keymap.set("n", "<leader>vt", ":NvimTreeToggle<CR>")
vim.keymap.set("n", "<leader>vf", ":NvimTreeFindFile<CR>")

-- testing
vim.keymap.set("n", "<leader>tr", ':lua require("neotest").run.run()<CR>', {noremap = true, silent = true}) 
vim.keymap.set("n", "<leader>td", ':lua require("neotest").run.run({strategy = "dap"})<CR>', {noremap = true, silent = true}) 
vim.keymap.set("n", "<leader>tf", ':lua require("neotest").run.run(vim.fn.expand("%"))<CR>', {noremap = true, silent = true}) 
vim.keymap.set("n", "<leader>ta", ':lua require("neotest").run.run({suite = true})<CR>', {noremap = true, silent = true}) 
vim.keymap.set("n", "<leader>to", ':lua require("neotest").output.open()<CR>', {noremap = true, silent = true}) 
vim.keymap.set("n", "<leader>tO", ':lua require("neotest").output.open({enter = true})<CR>', {noremap = true, silent = true}) 
vim.keymap.set("n", "<leader>tp", ':lua require("neotest").output_panel.toggle()<CR>', {noremap = true, silent = true}) 
vim.keymap.set("n", "<leader>ts", ':lua require("neotest").summary.toggle()<CR>', {noremap = true, silent = true})
vim.keymap.set("n", "<leader>tk", ':lua require("neotest").run.stop()<CR>', {noremap = true, silent = true})
vim.keymap.set("n", "<leader><Enter>", 'o<ESC>')
vim.keymap.set("n", "<leader><C-Enter>", 'O<ESC>')

