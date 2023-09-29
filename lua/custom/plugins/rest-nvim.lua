local rest_nvim = require("rest-nvim")
rest_nvim.setup({
	result_split_in_place = true,
	skip_ssl_verification = true,
	encode_url = false
})

vim.keymap.set('n', '<leader>rr', '<Plug>RestNvim', { desc = 'Run rest under cursor' })
-- vim.api.nvim_set_keymap(
-- 	"n",
-- 	"<space>f",
-- 	":NvimTreeToggle<CR>",
-- 	{
-- 		noremap = true,
-- 		desc = "Toggle Nvim Tre[e]",
-- 	}
-- )

return {}
