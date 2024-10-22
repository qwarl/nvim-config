return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	cmd = "Neotree",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
	},
	config = function()
		-- If you want icons for diagnostic errors, you'll need to define them somewhere:
		vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
		vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
		vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
		vim.fn.sign_define("DiagnosticSignHint", { text = "󰌵", texthl = "DiagnosticSignHint" })

		require("neo-tree").setup({
			source_selector = {
				winbar = false,
				statusline = true,
			},
		})
	end,
	keys = {
		{ "<leader>ee", "<cmd>Neotree toggle<cr>", desc = "File Explorer (Root Dir)" },
		{ "<leader>eg", "<cmd>Neotree git_status<cr>", desc = "Git Explorer" },
		{ "<leader>eb", "<cmd>Neotree buffers<cr>", desc = "Buffer Explorer" },
		{
			"<leader>cr",
			function()
				local current_buffer_dir = vim.fn.expand("%:p:h") -- Get the directory of the current buffer
				vim.cmd("cd " .. current_buffer_dir)
			end,
			desc = "Change Cwd (Current Buffer)",
		},
	},
}
