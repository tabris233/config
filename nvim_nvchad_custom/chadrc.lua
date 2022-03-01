-- This is an example chadrc file , its supposed to be placed in /lua/custom dir
-- lua/custom/chadrc.lua

local M = {}
local userPlugins = require "custom.plugins"

-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:

M.ui = {
    theme = "onedark",
}

M.options = {
    relativenumber = true,
}

M.plugins = {
    status = {
        colorizer = true,
        alpha = true
    },
    options = {
        statusline = {
            style = "block"
        }
    },
    default_plugin_config_replace = {
        -- dashboard = "custom.configs.dashboard",
        alpha = "custom.configs.alpha",
    },
    install = userPlugins
}

return M
