return {
	"NvChad/nvim-colorizer.lua",
	config = function()
		require("colorizer").setup({
			user_default_options = {
				tailwind = true,
        always_update = true,
        mode = "foreground",
        css = true,
			},
		})
	end,
}
