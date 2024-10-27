problems:

- for hyprls config in lsp, need Go to compile it

- on windows, ctrl space doesn't work on cmp or treesitter keymaps config

- set up install hyprls, hyprlang and config if detect hypr, rofi, etc path in lsp, treesitter. not test yet

  + update: it works

- on windows, when setup ts_ls as TypeScript lsp. can't use <c-l>, <c-h> to navigate between arguments of function snippets code. on linux, it works well.

```lua
    -- setup inlay hint for ts_ls
    ts_ls = {
        settings = {
            typescript = {
                inlayHints = {
                    includeInlayEnumMemberValueHints = true,
                    includeInlayFunctionLikeReturnTypeHints = true,
                    includeInlayFunctionParameterTypeHints = true,
                    includeInlayParameterNameHints = 'all',
                    includeInlayParameterNameHintsWhenArgumentMatchesName = true, -- false
                    includeInlayPropertyDeclarationTypeHints = true,
                    includeInlayVariableTypeHints = true,
                    includeInlayVariableTypeHintsWhenTypeMatchesName = true -- false
                }
            },
            javascript = {
                inlayHints = {
                    includeInlayEnumMemberValueHints = true,
                    includeInlayFunctionLikeReturnTypeHints = true,
                    includeInlayFunctionParameterTypeHints = true,
                    includeInlayParameterNameHints = 'all',
                    includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                    includeInlayPropertyDeclarationTypeHints = true,
                    includeInlayVariableTypeHints = true,
                    includeInlayVariableTypeHintsWhenTypeMatchesName = true
                }
            },
        },
    },
```

- important signcolumn = yes but need to use <leader>xx to open diagnostic list and choose one to display sign column and diagnostic list at the same time. maybe need to config again plugin to plugin to know which one cause this problem
  + update: typo in options. fixed

- setting `disable_filetypes = { "dashboard" }` in lualine configuration (for linux) and `hide = { statusline }` in dashboard (for windows) to make sure statusline doesn't display in dashboard
    - update: the first works for linux and second works on windows, cmt first setting on windows to make it no visible a blank lualine
- about display image in neovim. terminal supports kitty graphic protocol should uses `kitty` as backend for better perf, terminal supports sixel will uses `ueberzug` to display images. in tmux, no idea how to detect what terminal tmux is running on

- <leader>ca currently show action via notification but not popup
    - update: noice setup caused this. temp disable it
