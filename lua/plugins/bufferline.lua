return {
	"akinsho/bufferline.nvim",
	version = "*",
	opts = {
		options = {
			mode = "tabs",
			-- mode = "buffers",
			diagnostics = "nvim_lsp",
			diagnostics_indicator = function(count, level, diagnostics_dict, context)
				local s = " "
				for e, n in pairs(diagnostics_dict) do
					local sym = e == "error" and " " or (e == "warning" and " " or "")
					s = s .. n .. sym .. " "
				end
				return s
			end,
			show_buffer_icons = true,
			show_buffer_close_icons = true,
			show_close_icon = true,
			show_tab_indicators = true,
			separator_style = "thin",
			offsets = {
				{ filetype = "neo-tree", text = "File Explorer", separator = "" },
			},
		},
	},
}
