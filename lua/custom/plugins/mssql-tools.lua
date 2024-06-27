local home = os.getenv 'HOME'
if not home then
  return
end

return {
  dir = home .. '/Projects/nvim-plugins/nvim-mssql-tools/',
  config = function()
    require('mssql-tools').setup()
  end,
  keys = {
    {
      '<leader>me',
      ":lua require('mssql-tools').requests.execute_query_doc()<CR>",
      desc = 'Execute entire buffer as query',
      mode = 'n',
      silent = true,
    },
    {
      '<leader>mq',
      ":lua require('mssql-tools').requests.cancel_query()<CR>",
      desc = 'Cancel query',
      mode = 'n',
      silent = true,
    },
    {
      '<leader>mc',
      ":lua require('mssql-tools').requests.connect_to_database()<CR>",
      desc = 'Connects to database',
      mode = 'n',
      silent = true,
    },
    {
      '<leader>ma',
      ":lua require('mssql-tools').attach_client()<CR>",
      desc = 'Attach lsp to buffer',
      mode = 'n',
      silent = true,
    },
    {
      '<leader>mve',
      ":lua require('mssql-tools').requests.execute_query_selection()<CR>",
      desc = 'Execute Query by selection',
      mode = 'v',
      silent = true,
    },
    {
      '<leader>mi',
      ":lua require('mssql-tools').requests.refresh_intellisense()<CR>",
      desc = 'Refresh Intellisense',
      mode = 'n',
      silent = true,
    },
    {
      '<leader>mo',
      ":lua require('mssql-tools').oe.ui.open_object_explorer()<CR>",
      desc = 'Open object explorer',
      mode = 'n',
      silent = true,
    },
    {
      '<leader>mx',
      ":lua require('mssql-tools').oe.ui.toggle_node()<CR>",
      desc = 'Toggle object explorer node',
      mode = 'n',
      silent = true,
    },
    {
      '<leader>ms',
      ":lua require('mssql-tools').oe.ui.open_script()<CR>",
      desc = 'Open script as chooser',
      mode = 'n',
      silent = true,
    },
  },
}
