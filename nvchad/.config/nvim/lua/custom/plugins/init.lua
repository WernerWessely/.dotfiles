return {
   -- add pounce
   ["rlane/pounce.nvim"] = {
      config = function()
         require("pounce").setup {
            multi_window = true,
         }
      end,
   },

   -- add trim
   ["cappyzawa/trim.nvim"] = {
      config = function()
         require("trim").setup {
            disable = {}, -- ignore these files
            patterns = {
               [[%s/\s\+$//e]], -- remove unwanted spaces
               [[%s/\($\n\s*\)\+\%$//]], -- trim last line
               [[%s/\%^\n\+//]], -- trim first line
            },
         }
      end,
   },

   -- add null-ls
   ["jose-elias-alvarez/null-ls.nvim"] = {
      after = "nvim-lspconfig",
      config = function()
         require "custom.plugins.null-ls"
      end,
   },
}
