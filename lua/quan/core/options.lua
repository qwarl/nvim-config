local set = vim.opt

-- line numbers
set.number = true         -- shows absolute line number on cursor line (when relative number is on)
set.relativenumber = true -- show relative line numbers

-- tabs & indent
set.tabstop = 2        -- 2 spaces for tabs (prettier default)
set.shiftwidth = 2     -- 2 spaces for indent width
set.expandtab = true   -- convert tabs to spaces
set.autoindent = false -- copy indent from current line when starting new one

-- line wrapping
set.wrap = false -- disable line wrapping

-- search settings
set.ignorecase = true -- ignore case when searching
set.smartcase = true  -- if you include mixed case in your search, assumes you want case-sensitive
set.smartindent = true
set.showtabline = 2
set.conceallevel = 0
-- cursor line
set.cursorline = true -- highlight the current cursor line

-- apprearance
set.termguicolors = true
-- set.signcolumn = "yes" -- show sign column so that text doesn't shift

-- backspace
set.backspace = "indent,eol,start"

--clipboard
set.clipboard = "unnamedplus" -- copy neovim to clipboard

-- allow mouse to be used in neovim
set.mouse = "a"

-- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
set.writebackup = false

-- undercurl
vim.cmd([[let &t_Cs =  "\e[4:3m"]])
vim.cmd([[let &t_Ce =  "\e[4:3m"]])
