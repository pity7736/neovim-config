vim.lsp.config('*', {
	capabilities = require('blink.cmp').get_lsp_capabilities(),
})

vim.lsp.enable({
	'gopls',
	'rust_analyzer',
	'kotlin_ls',
})

vim.diagnostic.config({
	virtual_text = true,
	underline = true
})

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('my.lsp', {}),
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
    local opts = {buffer = args.buf, remap = false}
    vim.keymap.set("n", "gd", function()
      vim.g.lsp_last_gd_word = vim.fn.expand("<cword>")
      vim.lsp.buf.definition()
    end, opts)
    vim.keymap.set("n", "<leader>gd", function()
      vim.cmd("vsplit")
      vim.lsp.buf.definition()
    end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    --if client:supports_method('textDocument/implementation') then
      -- Create a keymap for vim.lsp.buf.implementation ...
    --end
    -- Auto-format ("lint") on save.
    -- Usually not needed if server supports "textDocument/willSaveWaitUntil".
    if client:supports_method('textDocument/formatting') then
      vim.api.nvim_create_autocmd('BufWritePre', {
        group = vim.api.nvim_create_augroup('gopls.lsp', {clear=false}),
        buffer = args.buf,
        callback = function()
          vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
        end,
      })
    end
  end,
})

