return {
  'kade5/nvim-dbee',
  dependencies = {
    'MunifTanjim/nui.nvim',
  },
  build = function()
    -- Install tries to automatically detect the install method.
    -- if it fails, try calling it with one of these parameters:
    --    "curl", "wget", "bitsadmin", "go"
    require('dbee').install()
  end,
  config = function()
    require('dbee').setup {
      extra_helpers = {
        ['mssql'] = {
          ['Top 100'] = 'SELECT TOP 100 * FROM {{ .Schema}}.{{ .Table}}',
        },
      },
    }
  end,
  keys = {
    {
      '<leader>bt',
      ":lua require('dbee').toggle()<CR>",
      desc = 'toggle db_ui',
      mode = 'n',
      silent = true,
    },
  },
}
