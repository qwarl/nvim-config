return {
	"nvimdev/dashboard-nvim",
	event = "VimEnter",
	opts = function()
		local opts = {
			theme = "doom",
			config = {
				-- header = {},
				center = {
					{ action = "ene | startinsert", desc = " New File", icon = " ", key = "n" },
					{ action = require("telescope.builtin").live_grep, desc = " Text Find", icon = "󱎸 ", key = "t" },
					{
						action = require("telescope.builtin").oldfiles,
						desc = " Recent Files",
						icon = "󰪻 ",
						key = "r",
					},
					{
						action = require("telescope.builtin").find_files,
						desc = " Find Files",
						icon = "󰮗 ",
						key = "f",
					},
					{ action = "Neotree toggle", desc = " Explorer", icon = "󱏒 ", key = "e" },
					{ action = "Lazy", desc = " Lazy", icon = "󰒲 ", key = "l" },
					{ action = "qa", desc = " Quit", icon = " ", key = "q" },
				},
				-- footer = {},
			},
		}
		for _, button in ipairs(opts.config.center) do
			button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
			button.key_format = " %s"
		end
		return opts
	end,
}
