return {
	"lewis6991/gitsigns.nvim",
	config = function()
		require("gitsigns").setup({
			numhl = true,
      signcolumn = false,
			current_line_blame_opts = {
				virt_text = true,
				virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
				delay = 100,
				ignore_whitespace = false,
				virt_text_priority = 100,
			},
			current_line_blame = true,
			current_line_blame_formatter = "<author>, <author_time:%m-%d-%Y> - <summary>",
		})
	end,
}
