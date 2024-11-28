local is_path = require("util.config_checker")

return {
	-- Main LSP Configuration
	"neovim/nvim-lspconfig",
	dependencies = {
		-- Automatically install LSPs and related tools to stdpath for Neovim
		{ "williamboman/mason.nvim", config = true }, -- NOTE: Must be loaded before dependants
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",

		-- Useful status updates for LSP.
		-- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
		{ "j-hui/fidget.nvim", opts = {} },

		-- Allows extra capabilities provided by nvim-cmp
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
			callback = function(event)
				local map = function(keys, func, desc, mode)
					mode = mode or "n"
					vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
				end

				map("<leader>K", vim.lsp.buf.hover, "Show Hover Information")

				map("gd", require("telescope.builtin").lsp_definitions, "Goto Definition")

				-- Find references for the word under your cursor.
				map("gR", require("telescope.builtin").lsp_references, "Goto References")

				-- Jump to the implementation of the word under your cursor.
				--  Useful when your language has ways of declaring types without an actual implementation.
				map("gI", require("telescope.builtin").lsp_implementations, "Goto Implementation")

				-- Jump to the type of the word under your cursor.
				--  Useful when you're not sure what type a variable is and you want to see
				--  the definition of its *type*, not where it was *defined*.
				map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type Definition")

				-- Fuzzy find all the symbols in your current document.
				--  Symbols are things like variables, functions, types, etc.
				map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "Document Symbols")

				-- Fuzzy find all the symbols in your current workspace.
				--  Similar to document symbols, except searches over your entire project.
				map("<leader>Ds", require("telescope.builtin").lsp_dynamic_workspace_symbols, "Workspace Symbols")

				-- Rename the variable under your cursor.
				--  Most Language Servers support renaming across files, etc.
				map("<leader>rn", vim.lsp.buf.rename, "Rename")

				-- Execute a code action, usually your cursor needs to be on top of an error
				-- or a suggestion from your LSP for this to activate.
				map("<leader>ca", vim.lsp.buf.code_action, "Code Action", { "n", "x" })

				-- WARN: This is not Goto Definition, this is Goto Declaration.
				--  For example, in C this would take you to the header.
				map("gD", vim.lsp.buf.declaration, "Goto Declaration")

				local client = vim.lsp.get_client_by_id(event.data.client_id)
				if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
					local highlight_augroup = vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
					vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
						buffer = event.buf,
						group = highlight_augroup,
						callback = vim.lsp.buf.document_highlight,
					})

					vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
						buffer = event.buf,
						group = highlight_augroup,
						callback = vim.lsp.buf.clear_references,
					})

					vim.api.nvim_create_autocmd("LspDetach", {
						group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
						callback = function(event2)
							vim.lsp.buf.clear_references()
							vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event2.buf })
						end,
					})
				end

				if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
					-- Toggle inlay hints
					map("<leader>uh", function()
						local buf = vim.api.nvim_get_current_buf()
						local enabled = not vim.lsp.inlay_hint.is_enabled({ bufnr = buf })
						vim.lsp.inlay_hint.enable(enabled, { bufnr = buf })

						-- Notify user
						if enabled then
							vim.notify("Inlay hints enabled for this buffer.", vim.log.levels.INFO)
						else
							vim.notify("Inlay hints disabled for this buffer.", vim.log.levels.INFO)
						end
					end, "Toggle Inlay Hints")

					map("<leader>uH", function()
						local enabled = not vim.lsp.inlay_hint.is_enabled()
						vim.lsp.inlay_hint.enable(enabled)

						-- Notify user
						if enabled then
							vim.notify("Inlay hints enabled globally.", vim.log.levels.INFO)
						else
							vim.notify("Inlay hints disabled globally.", vim.log.levels.INFO)
						end
					end, "Inlay Hints (Global)")

					-- Enable inlay hints by default
					-- vim.lsp.inlay_hint.enable()
				end
			end,
		})

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

		on_attach = function(client, bufnr)
			if client.server_capabilities.inlayHintProvider then
				vim.lsp.inlay_hint.enable(true, nil)
			end
		end

		local servers = {
			-- lsp
			bashls = {
				filetypes = { "sh", "zsh" },
			},
			lua_ls = {
				settings = {
					Lua = {
						completion = {
							callSnippet = "Replace",
						},
						hint = {
							enable = true,
							arrayIndex = "Disable",
						},
					},
				},
			},
			html = {},
			cssls = {},
			tailwindcss = {},
			emmet_ls = {},
			pyright = {},
			vtsls = {
				settings = {
					typescript = {
						inlayHints = {
							parameterNames = { enabled = "all" },
							parameterTypes = { enabled = true },
							variableTypes = { enabled = true },
							propertyDeclarationTypes = { enabled = true },
							functionLikeReturnTypes = { enabled = true },
							enumMemberValues = { enabled = true },
						},
					},
				},
			},
			marksman = {},
			jsonls = {
				-- lazy-load schemastore when needed
				on_new_config = function(new_config)
					new_config.settings.json.schemas = new_config.settings.json.schemas or {}
					vim.list_extend(new_config.settings.json.schemas, require("schemastore").json.schemas())
				end,
				settings = {
					json = {
						format = {
							enable = true,
						},
						validate = { enable = true },
					},
				},
			},
			taplo = {},
		}

		if is_path.exists_in_config("hypr") then
			servers.hyprls = {}
		end

		require("mason").setup()

		local ensure_installed = vim.tbl_keys(servers or {})
		vim.list_extend(ensure_installed, {
			-- linter and formatter
			"beautysh",
			"black",
			"eslint_d",
			"markdownlint-cli2",
			"markdown-toc",
			"prettier",
			"pylint",
			"shellcheck",
			"stylua", -- Used to format Lua code
		})
		require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

		require("mason-lspconfig").setup({
			handlers = {
				function(server_name)
					local server = servers[server_name] or {}
					server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
					require("lspconfig")[server_name].setup(server)
				end,
			},
		})
	end,
}
