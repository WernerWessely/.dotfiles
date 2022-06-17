-- TODO:
--  - Add project plugin
--  - Add fuzzy search in project
--  - Add git integration

local M = {}

-- load in options
M.options = {
    user = function()
        require "custom.options"
    end,
}

-- load in mappings
M.mappings = require "custom.mappings"

-- load in plugins
M.plugins = {

    options = {
        lspconfig = {
            setup_lspconf = "custom.plugins.lspconfig",
        },

        statusline = {
            separator_style = "round",
        },
    },

    -- enable git in tree
    override = {
        ["kyazdani42/nvim-tree.lua"] = {
            renderer = {
                icons = {
                    show = {
                        git = true,
                    },
                },
            },
            git = {
                enable = true,
                ignore = false,
            }
        },
    },

    user = require "custom.plugins",
}

-- ui settings
M.ui = {
    -- set the nord theme
    theme = "nord",
    -- enable the cursor line
    hl_override = {
        CursorLine = { bg = "one_bg" },
    },
}

return M
