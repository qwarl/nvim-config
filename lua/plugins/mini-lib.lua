return {
	"echasnovski/mini.nvim",
	version = false,
	config = function()
		require("mini.pairs").setup()

		require("mini.icons").setup()

		require("mini.surround").setup({
			mappings = {
				add = "gza", -- Add surrounding in Normal and Visual modes
				delete = "gzd", -- Delete surrounding
				find = "gzf", -- Find surrounding (to the right)
				find_left = "gzF", -- Find surrounding (to the left)
				highlight = "gzh", -- Highlight surrounding
				replace = "gzr", -- Replace surrounding
				update_n_lines = "gzn", -- Update `n_lines`
			},
		})

		require("mini.ai").setup()

		require("mini.splitjoin").setup({
			mappings = {
				toggle = "sj",
				split = "",
				join = "",
			},
		})

		require("mini.misc").setup({})

		require("mini.misc").setup_auto_root({ ".git", "Makefile", "package.json" })
	end,
}
