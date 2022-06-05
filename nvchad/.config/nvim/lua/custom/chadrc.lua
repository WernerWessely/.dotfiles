local M = {}

-- load in options
M.options = {
   user = function()
       require("custom.options")
   end,
}

-- load in mappings
M.mappings = require ("custom.mappings")

-- load in plugins
M.plugins = {
   user = require ("custom.plugins")
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
