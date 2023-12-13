how to config plugins installed by lazy nvim
store it in /plugins

return {
    'link/to/plugins',
    dependencies = {'link/to/dependencies'},
    config = function ()
    local name_of_plugin = require('plugins')
    <!-- below config like in packer nvim -->
    <!-- opts = {} equal with function() -->
    name_of_plugin.setup({
        config normal like packer nvim
    })

    end,
}
