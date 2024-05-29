local client = vim.lsp.start_client {
  name = 'mssql-lsp',
  cmd = { '/home/zeke/Projects/sqltoolsservice/MicrosoftSqlToolsServiceLayer' },
}

if not client then
  vim.notify 'No client found'
  return
end

create_session = function()
  vim.print 'started connection'
  vim.lsp.buf_request_all(0, 'objectexplorer/createsession', {
    sessionId = 5,
  }, function(results)
    vim.print(results)
  end)
end

list_databases = function()
  vim.print 'started connection'
  vim.lsp.buf_request_all(0, 'connection/listdatabases', {
    ownerUri = 'test.sql',
  }, function(results)
    vim.print(results)
  end)
end

change_database = function()
  vim.lsp.buf_request_all(0, 'connection/changedatabase', {
    ownerUri = 'test.sql',
    newDatabase = 'Prod',
  }, function(results)
    vim.print(results)
  end)
end

rebuild_intellisense = function()
  vim.lsp.buf_request_all(0, 'intellisense/rebuild', {
    ownerUri = 'test.sql',
  }, function(results)
    vim.print(results)
  end)
end

get_connection_string = function()
  vim.print 'started connection'
  vim.lsp.buf_request_all(0, 'connection/getconnectionstring', {
    ownerUri = 'test.sql',
  }, function(results)
    vim.print(results)
  end)
end

connection_complete = function()
  vim.lsp.buf_request_all(0, 'connection/complete', {
    ownerUri = 'test.sql',
  }, function(results)
    vim.print(results)
  end)
end

execute_query = function()
  vim.lsp.buf_request_all(0, 'query/simpleexecute', {
    queryString = '',
    ownerUri = 'test.sql',
  }, function(results)
    vim.print(results)
  end)
end

connect_to_database = function()
  vim.print 'started connection'
  vim.lsp.buf_request_all(0, 'connection/connect', {
    ownerUri = 'test.sql',
    connection = {
      serverName = '',
      userName = '',
      password = '',
      databaseName = '',
      authenticationType = 'SqlLogin',
    },
  }, function(results)
    vim.print(results)
    -- list_databases()
  end)
end

vim.keymap.set('n', '<leader>cb', ':lua connect_to_database()<CR>', { desc = 'Connect to Database' })
vim.keymap.set('n', '<leader>lb', ':lua list_databases()<CR>', { desc = 'List Databases' })
vim.keymap.set('n', '<leader>gcs', ':lua get_connection_string()<CR>', { desc = 'Get Conncetion String' })
vim.keymap.set('n', '<leader>eq', ':lua execute_query()<CR>', { desc = 'Execute Query' })
vim.keymap.set('n', '<leader>rbi', ':lua rebuild_intellisense()<CR>', { desc = 'Rebuild Intellisense' })
vim.keymap.set('n', '<leader>chb', ':lua change_database()<CR>', { desc = 'Change Database' })
vim.keymap.set('n', '<leader>cnc', ':lua connection_complete()<CR>', { desc = 'Connection Complete' })

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'sql',
  callback = function()
    vim.lsp.buf_attach_client(0, client)
    vim.notify 'mssql-lsp client attached'
    -- connect_to_database()
  end,
})
