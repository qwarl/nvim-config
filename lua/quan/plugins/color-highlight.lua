return {
    "NvChad/nvim-colorizer.lua",
    event = { "BufReadPre", "BufNewFile" },
    -- config = true,
    config = function()
        local colorizer = require('colorizer')
        colorizer.setup({
            user_default_options = {
                RGB = true,     -- #RGB hex codes
                RRGGBB = true,  -- #RRGGBB hex codes
                names = true,   -- "Name" codes like Blue or blue
                tailwind = true,
                rgb_fn = true,  -- CSS rgb() and rgba() functions
                hsl_fn = true,  -- CSS hsl() and hsla() functions
                css = false,    -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
                css_fn = false, -- Enable all CSS *functions*: rgb_fn, hsl_fn
                -- update color values even if buffer is not focused
                -- example use: cmp_menu, cmp_docs
                always_update = false,
            }
        })
    end,
}
