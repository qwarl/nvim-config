return {
	"echasnovski/mini.nvim",
	version = false,
	config = function(_, opts)
		-- setup mini pairs
		require("mini.pairs").setup()

		-- setup mini icons
		require("mini.icons").setup()

		-- setup mini surround
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

		-- setup mini ai
		require("mini.ai").setup()

		-- setup mini splitjoin
		require("mini.splitjoin").setup({
			mappings = {
				toggle = "sj",
				split = "",
				join = "",
			},
		})

		-- setup miscellanous utilities
		require("mini.misc").setup({})

		-- auto root detection for project files
		require("mini.misc").setup_auto_root({ ".git", "Makefile", "package.json" })

		-- setup mini move
		require("mini.move").setup({})

		-- setup mini indent
		require("mini.indentscope").setup()
	end,
}
