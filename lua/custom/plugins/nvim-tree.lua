local nvim_tree = require("nvim-tree")
nvim_tree.setup()

vim.api.nvim_set_keymap(
	"n",
	"<space>f",
	":NvimTreeToggle<CR>",
	{
		noremap = true,
		desc = "Toggle Nvim Tre[e]",
	}
)

return {}
