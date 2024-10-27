return {
	"mistweaverco/kulala.nvim",
	ft = "http",
	opts = {},
	keys = {
		{ "<leader>Rs", "<cmd>lua require('kulala').run()<cr>", desc = "Send the request" },
		{ "<leader>Rt", "<cmd>lua require('kulala').toggle_view()<cr>", desc = "Toggle headers/body" },
		{ "<leader>Rp", "<cmd>lua require('kulala').jump_prev()<cr>", desc = "Jump to previous request" },
		{ "<leader>Rn", "<cmd>lua require('kulala').jump_next()<cr>", desc = "Jump to next request" },
		{ "<leader>Ri", "<cmd>lua require('kulala').inspect()<cr>", desc = "Inspect current request" },
		{ "<leader>Rc", "<cmd>lua require('kulala').copy()<cr>", desc = "Copy current request as curl" },
		{ "<leader>RP", "<cmd>lua require('kulala').from_curl()<cr>", desc = "Paste curl from clipboard" },
	},
}
