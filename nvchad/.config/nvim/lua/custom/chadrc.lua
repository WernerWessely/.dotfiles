-- TODO:
-- - Add shade
-- - Add twilight
-- - Add trouble
-- - Add lsp_signature
-- - Add navigator
-- - Add treesitter-textsubjects
-- - Add nvim-neoclip.lua
-- - Add cheatsheet.nvim
-- - Add fuzzy search in project
-- - Add git integration

local M = {}

-- load in options
M.options = {
	user = function()
		require("custom.options")
	end,
}

-- load in mappings
M.mappings = require("custom.mappings")

-- load in plugins
M.plugins = {
	override = {
		-- enable git in tree
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
			},
		},

		-- add some extensions to telescope
		["nvim-telescope/telescope.nvim"] = {
			extensions_list = { "themes", "terms", "projects", "project", "file_browser" },
			extensions = {
				project = {
					base_dirs = {
						{ "~/proj/me", max_depth = 2 },
						{ "~/proj/br", max_depth = 2 },
						{ "~", max_depth = 2 },
						{ "~/.config", max_depth = 8 },
					},
					hidden_files = true,
				},
			},
		},
		-- set some ui settings
		["NvChad/ui"] = {
			statusline = {
				separator_style = "round", -- default/round/block/arrow
			},
		},
	},

	user = require("custom.plugins"),
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
