return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	cmd = "Neotree",
	priority = 1000,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
	},
	config = function()
		require("neo-tree").setup({
			source_selector = {
				winbar = false,
				statusline = true,
			},
			default_component_configs = {
				diagnostics = {
					symbols = {
						hint = "", -- Hint symbol
						info = "", -- Info symbol
						warn = "", -- Warning symbol
						error = "", -- Error symbol
					},
				},
			},
			commands = {
				copy_selector = function(state)
					local node = state.tree:get_node()
					local filepath = node:get_id()
					local filename = node.name
					local modify = vim.fn.fnamemodify

					local vals = {
						["1. BASENAME"] = modify(filename, ":r"),
						["2. EXTENSION"] = modify(filename, ":e"),
						["3. FILENAME"] = filename,
						["4. PATH (CWD)"] = modify(filepath, ":."),
						["5. PATH (HOME)"] = modify(filepath, ":~"),
						["6. PATH"] = filepath,
						["7. URI"] = vim.uri_from_fname(filepath),
					}

					local options = vim.tbl_filter(function(val)
						return vals[val] ~= ""
					end, vim.tbl_keys(vals))
					if vim.tbl_isempty(options) then
						vim.notify("No values to copy", vim.log.levels.WARN)
						return
					end
					table.sort(options)
					vim.ui.select(options, {
						prompt = "Choose to copy to clipboard:",
						format_item = function(item)
							return ("%s: %s"):format(item, vals[item])
						end,
					}, function(choice)
						local result = vals[choice]
						if result then
							vim.notify(("Copied: `%s`"):format(result))
							vim.fn.setreg("+", result)
						end
					end)
				end,
			},
			window = {
				mappings = {
					["Y"] = "copy_selector",
				},
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
