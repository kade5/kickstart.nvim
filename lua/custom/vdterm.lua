local Terminal = require('toggleterm.terminal').Terminal
local dbee = require 'dbee'
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

local tmp_dir = '/var/tmp/dbee-stores/'
local call_state = nil

dbee.api.core.register_event_listener('call_state_changed', function(data)
  if data.call.error == nil then
    call_state = data.call.id
  end
end)

Open_Results_Vd = function()
  if not dbee.is_open() or call_state == nil then
    return
  end
  os.execute('mkdir -p ' .. tmp_dir)
  local csv_path = tmp_dir .. tostring(call_state) .. '.csv'
  dbee.store('csv', 'file', { extra_arg = csv_path })
  Create_vd_term(csv_path)
end

-- vim.api.nvim_set_keymap('n', '<leader>vd', "<cmd>lua Create_vd_term('players.csv')<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>vd', '<cmd>lua Open_Results_Vd()<CR>', { noremap = true, silent = true })
