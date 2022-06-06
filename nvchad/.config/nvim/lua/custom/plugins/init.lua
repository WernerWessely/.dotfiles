return {

    -- add pounce
    ["rlane/pounce.nvim"] = {
        config = function()
            require("pounce").setup {
                multi_window = true,
            }
        end,
    }
}
