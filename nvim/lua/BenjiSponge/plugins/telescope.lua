return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
	},

	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				path_display = { "smart" },
			},
		})

		telescope.load_extension("fzf")

		local keymap = vim.keymap

		keymap.set("n", "<leader>e", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
		keymap.set("n", "<leader>E", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
	end,
}
