return {
	-- configure lsp-config
	["neovim/nvim-lspconfig"] = {
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.plugins.lspconfig")
		end,
	},

	-- add pounce
	["rlane/pounce.nvim"] = {
		config = function()
			require("pounce").setup({
				multi_window = true,
			})
		end,
	},

	-- add trim
	["cappyzawa/trim.nvim"] = {
		config = function()
			require("trim").setup({
				disable = {}, -- ignore these files
				patterns = {
					[[%s/\s\+$//e]], -- remove unwanted spaces
					-- [[%s/\($\n\s*\)\+\%$//]], -- trim last line
					[[%s/\%^\n\+//]], -- trim first line
				},
			})
		end,
	},

	-- add null-ls
	["jose-elias-alvarez/null-ls.nvim"] = {
		after = "nvim-lspconfig",
		config = function()
			require("custom.plugins.null-ls")
		end,
	},

	-- add project
	["ahmedkhalf/project.nvim"] = {
		config = function()
			require("project_nvim").setup({
				manual_mode = true,
				detection_methods = { "pattern", "lsp" },
				patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json" },
				show_hidden = true,
			})
		end,
	},

	-- add telescope project
	["nvim-telescope/telescope-file-browser.nvim"] = {},
	["nvim-telescope/telescope-project.nvim"] = {},

	-- add lightbulb
	["kosayoda/nvim-lightbulb"] = {
		requires = "antoinemadec/FixCursorHold.nvim",
		config = function()
			require("nvim-lightbulb").setup({ autocmd = { enabled = true } })
		end,
	},

	-- add fzf
	["junegunn/fzf"] = { run = "./install --bin" },
	["junegunn/fzf.vim"] = {},

	-- toggle lsp diagnostics
	["WhoIsSethDaniel/toggle-lsp-diagnostics.nvim"] = {},

	-- close all buffers but this one
	["numtostr/BufOnly.nvim"] = { cmd = "BufOnly" },

	-- trouble for diagnostics
	["folke/trouble.nvim"] = {
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup({})
		end,
	},
}
