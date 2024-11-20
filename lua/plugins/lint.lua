return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile", "InsertLeave" },
	config = function()
		local lint = require("lint")
		lint.linters_by_ft = {
			javascript = { "eslint_d" },
			typescript = { "eslint_d" },
			javascriptreact = { "eslint_d" },
			typscriptreact = { "eslint_d" },
			python = { "pylint" },
			bash = { "bash" },
			markdown = { "markdownlint-cli2" },
		}

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})

		vim.keymap.set("n", "<leader>tl", function()
			lint.try_lint()
		end, { desc = "Trigger linting for current file" })

		vim.keymap.set("n", "<leader>cl", function()
			if vim.diagnostic.is_enabled() then
				vim.diagnostic.enable(false)
			else
				vim.diagnostic.enable(true)
			end
		end, { desc = "toggle lint" })
	end,
}
