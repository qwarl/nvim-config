return {
	-- setup mini pairs
	{
		"echasnovski/mini.pairs",
		version = false,
		config = function()
			require("mini.pairs").setup()
		end,
	},
	-- setup mini icons
	{
		"echasnovski/mini.icons",
		version = false,
		config = function()
			require("mini.icons").setup()
		end,
	},
	-- setup mini surround
	{
		"echasnovski/mini.surround",
		version = false,
		config = function()
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
		end,
	},
	-- setup mini ai
	{
		"echasnovski/mini.ai",
		version = false,
		config = function()
			require("mini.ai").setup()
		end,
	},
	-- setup mini splitjoin
	{
		"echasnovski/mini.splitjoin",
		version = false,
		config = function()
			require("mini.splitjoin").setup({
				mappings = {
					toggle = "sj",
					split = "",
					join = "",
				},
			})
		end,
	},
	-- auto root detection for project files
	{
		"echasnovski/mini.misc",
		version = false,
		config = function()
			require("mini.misc").setup({})
			require("mini.misc").setup_auto_root({ ".git", "Makefile", "package.json" })
		end,
	},
	--setup mini move
	{
		"echasnovski/mini.move",
		version = false,
		config = function()
			require("mini.move").setup({})
		end,
	},
	-- setup mini indent
	{
		"echasnovski/mini.indentscope",
		version = false,
		config = function()
			require("mini.indentscope").setup()
		end,
	},
}
