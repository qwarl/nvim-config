return {
	"zbirenbaum/copilot-cmp",
	dependencies = "copilot.lua",
	event = { "InsertEnter", "LspAttach" },
	fix_pairs = true,
	opts = {},
	config = function()
		require("copilot_cmp").setup()
	end,
}
