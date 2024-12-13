local check = require("util")

if not check.is_win() then
	return {
		"lambdalisue/vim-suda",
	}
end
