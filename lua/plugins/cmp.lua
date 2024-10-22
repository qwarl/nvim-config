return {
	"hrsh7th/nvim-cmp",
	version = false, -- Use the latest version available
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",   -- LSP source
		"hrsh7th/cmp-buffer",     -- Buffer source
		"hrsh7th/cmp-path",       -- Path source
		{
			"L3MON4D3/LuaSnip",   -- Snippet engine
			version = "v2.*",     -- Follow the latest release
		},
		"saadparwaiz1/cmp_luasnip", -- For LuaSnip integration
		"rafamadriz/friendly-snippets", -- Useful snippets
		"onsails/lspkind.nvim",   -- VS Code-like pictograms
		"FelipeLema/cmp-async-path",
		"hrsh7th/cmp-calc",
		"hrsh7th/cmp-cmdline",
		{
			"zbirenbaum/copilot-cmp",
			config = function()
				require("copilot_cmp").setup({
					fix_pairs = true,
				})
			end,
		},
	},
	opts = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local lspkind = require("lspkind")

		-- Load snippets from friendly-snippets
		require("luasnip.loaders.from_vscode").lazy_load()

		return {
			completion = {
				completeopt = "menuone,noselect,preview", -- Options for completion menu
			},
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body) -- Expand snippets using LuaSnip
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-p>"] = cmp.mapping.select_prev_item(), -- Previous suggestion
				["<C-n>"] = cmp.mapping.select_next_item(), -- Next suggestion
				["<C-b>"] = cmp.mapping.scroll_docs(-4), -- Scroll docs up
				["<C-f>"] = cmp.mapping.scroll_docs(4),  -- Scroll docs down

				["<C-Space>"] = cmp.mapping.complete(),  -- Show completion suggestions
				["<C-e>"] = cmp.mapping.abort(),         -- Close completion window
				["<CR>"] = cmp.mapping.confirm({ select = false }), -- Confirm with selection
				["<C-y>"] = cmp.mapping.confirm({ select = true }), -- Confirm with selection
				["<S-CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item with shift + enter
				['<C-l>'] = cmp.mapping(function()
					if luasnip.expand_or_locally_jumpable() then
						luasnip.expand_or_jump()
					end
				end, { 'i', 's' }),
				['<C-h>'] = cmp.mapping(function()
					if luasnip.locally_jumpable(-1) then
						luasnip.jump(-1)
					end
				end, { 'i', 's' }),
			}),
			sources = cmp.config.sources({
				{ name = "copilot" },
				{ name = "nvim_lsp" }, -- LSP source for code suggestions
				{ name = "luasnip" }, -- Snippet source for LuaSnip
				{ name = "buffer" }, -- Current buffer source for text within the buffer
				{ name = "path" }, -- File system paths source
				{
					name = "async_path",
					options = {
						trailing_slash = false,
						label_trailing_slash = true,
						show_hidden_files_by_default = false,
						-- above are default settings.
					},
				},
				{ name = "calc" },
			}),
			formatting = {
				format = lspkind.cmp_format({
					maxwidth = 50,
					ellipsis_char = "...",
					symbol_map = { Copilot = "" },
				}),
			},
			experimental = {
				ghost_text = true,
			},
			cmp.setup.cmdline("/", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "buffer" },
				},
			}),
			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "path" },
				}, {
					{
						name = "cmdline",
						option = {
							ignore_cmds = { "Man", "!" },
						},
					},
				}),
			}),
		}
	end,
}
