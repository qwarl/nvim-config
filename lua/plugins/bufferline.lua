return {
	"akinsho/bufferline.nvim",
	version = "*",
	opts = {
		options = {
			mode = "buffers", -- display buffers like tabs in vscode
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
			offsets = {
				{ filetype = "neo-tree", text = "File Explorer", separator = true, text_align = "center" },
			},
		},
	},
}
