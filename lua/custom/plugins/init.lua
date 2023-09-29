-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
	"kdheepak/lazygit.nvim",
	-- optional for floating window border decoration
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	"jose-elias-alvarez/null-ls.nvim",
	ft = { "python" },

	"jay-babu/mason-null-ls.nvim",
	"ThePrimeagen/vim-be-good",
	{
		'windwp/nvim-autopairs',
		event = "InsertEnter",
		opts = {} -- this is equalent to setup({}) function
	},
	{
		"christoomey/vim-tmux-navigator",
		lazy = false,

	},
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
	},
	{
		"rest-nvim/rest.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},
}
