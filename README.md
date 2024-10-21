problems:

- for hyprls config in lsp, need Go to compile it

- on windows, ctrl space doesn't work on cmp or treesitter keymaps config

- set up install hyprls, hyprlang and config if detect hypr, rofi, etc path in lsp, treesitter. not test yet

- when display inlay hints with ts_ls. can't use ctrl l, ctrl h to navigate between arguments on windows. but vtsls can do that but, need to enter insert mode and type something to make inlay hints appear when enable by default. need to test on linux

- important signcolumn = yes but need to use <leader>xx to open diagnostic list and choose one to display sign column and diagnostic list at the same time. maybe need to config again plugin to plugin to know which one cause this problem 
    + update: typo in options. fixed

- <leader>fE or <leader>E of neotree settings doesn't works on windows. need to test on linux. code

``` lua
		{
			"<leader>be",
			function()
				require("neo-tree.command").execute({ source = "buffers", toggle = true })
			end,
			desc = "Buffer Explorer",
		},
		{
			"<leader>fE",
			function()
				require("neo-tree.command").execute({ toggle = true, dir = vim.uv.cwd() })
			end,
			desc = "Explorer NeoTree (cwd)",
		},
```
