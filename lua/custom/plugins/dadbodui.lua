local cmp = require("cmp")
vim.g.db_ui_execute_on_save = 0

cmp.setup.buffer({ sources = { { name = "vim-dadbod-completion" } } })
return {}
