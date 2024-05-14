local client = vim.lsp.start_client {
  name = 'mssql-lsp',
  cmd = { '/home/zeke/Projects/sqltoolsservice/MicrosoftSqlToolsServiceLayer' },
}

if not client then
  vim.notify 'No client found'
  return
end

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'sql',
  callback = function()
    vim.notify 'mssql-lsp client attached'
    vim.lsp.buf_attach_client(0, client)
  end,
})
