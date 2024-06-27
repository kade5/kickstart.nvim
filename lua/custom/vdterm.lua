local Terminal = require('toggleterm.terminal').Terminal
local sqltools = require 'mssql-tools'
local tools_managers = sqltools.managers

Create_vd_term = function(path)
  local vd = Terminal:new {
    cmd = 'visidata ' .. path,
    display_name = 'Visidata ' .. path,
    direction = 'float',
    float_opts = {
      border = 'double',
    },
    -- function to run on opening the terminal
    on_open = function(term)
      vim.cmd 'startinsert!'
      -- vim.api.nvim_buf_set_keymap(term.bufnr, 'n', 'q', '<cmd>close<CR>', { noremap = true, silent = true })
    end,
    -- function to run on closing the terminal
    on_close = function(term)
      vim.cmd 'startinsert!'
    end,
  }
  vd:toggle()
end

local tmp_dir = '/var/tmp/mssql-results/'

Open_Results_Vd = function()
  local buffer_manager = tools_managers.get_manager(vim.api.nvim_get_current_buf())
  if buffer_manager.result_id == 0 or not buffer_manager.result_id then
    vim.print 'Query results not ready'
    return
  end
  os.execute('mkdir -p ' .. tmp_dir)
  local csv_path = tmp_dir .. buffer_manager.connection_id .. '_' .. buffer_manager.result_id .. '.csv'
  if csv_path == buffer_manager.result_file_path then
    Create_vd_term(csv_path)
    return
  end
  sqltools.requests.save_to_csv(csv_path, Create_vd_term)
end

vim.api.nvim_set_keymap('n', '<leader>mvd', '<cmd>lua Open_Results_Vd()<CR>', { noremap = true, silent = true })
