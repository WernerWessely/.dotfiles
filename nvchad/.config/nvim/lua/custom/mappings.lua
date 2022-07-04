local M = {}

M.disabled = {
	-- Disabled or overwritten:
	["<C-n>"] = "",
	["<leader>pt"] = "",
}

M.general = {

	n = {
		-- write buffer
		["<leader><leader>"] = { "<cmd> w <CR>", "   write buffer" },

		-- quit with saving
		["<leader>a"] = { "<cmd> wqa <CR>", "   quit without saving" },

		-- quit without saving
		["<leader>q"] = { "<cmd> qa! <CR>", "   quit without saving" },

		-- make Y behave like other capitals
		["Y"] = { "yg_", "   yank to end of line" },

		-- keeping the shit centered
		["n"] = { "nzzzv", "n   find next centered" },
		["N"] = { "Nzzzv", "N   find previous centered" },
		["J"] = { "mzJ`z", "J   bring up next line centerd" },

		-- pounce for normal mode
		["s"] = { "<cmd> Pounce <CR>", "   pounce to word", opts = { noremap = true, silent = true } },
		["S"] = {
			"<cmd> PounceRepeat <CR>",
			"   pounce previous to word",
			opts = { noremap = true, silent = true },
		},

		-- some telescoping
		["<leader>fp"] = {
			"<cmd> Files ~/proj<CR>",
			"   find files in ~/proj",
		},
		["<leader>fc"] = { "<cmd> Telescope commands <CR>", "   find command" },
		["<leader>sb"] = { "<cmd> BLines <CR>", "   search in current buffer" },
		["<leader>sp"] = {
			function()
				require("telescope.builtin").live_grep({
					additional_args = function(_)
						return { "--no-ignore-vcs", "--hidden", "--follow", "--smart-case", "-g", "!.git" }
					end,
				})
			end,

			"   search in current project",
		},
		["<leader>oo"] = {
			function()
				require("telescope").extensions.project.project({
					display_type = "full",
				})
			end,
			"   open project",
		},

		-- copypasting with system clipboard:
		["<leader>y"] = { '"*y', "   yank to system clipboard", opts = { noremap = true } },
		["<leader>Y"] = { '"*yg_', "   yank to system clipboard", opts = { noremap = true } },
		["<leader>yy"] = { '"*yy', "   yank to system clipboard", opts = { noremap = true } },
		["<leader>p"] = { '"*p', "   paste from system clipboard", opts = { noremap = true } },
		["<leader>P"] = { '"*P', "   paste from system clipboard", opts = { noremap = true } },

		["<leader>of"] = { "<cmd> ProjectRoot <CR>", "   Cwd to project of buffer" },

        -- Toggle diagnostics:
		["<leader>dt"] = { "<cmd> ToggleDiag <CR>", "   Toggle diagnostics" },
	},

	i = {
		-- add some breakpoints to not always undo so much
		[","] = { ",<c-g>u", ",   , with breakpoint" },
		["."] = { ".<c-g>u", ".   . with breakpoint" },
		["!"] = { "!<c-g>u", "!   ! with breakpoint" },
		["?"] = { "?<c-g>u", "?   ? with breakpoint" },
	},

	v = {
		-- keep visual mode after indent
		["<"] = { "<gv", "<   visual detent" },
		[">"] = { ">gv", ">   visual indent" },

		-- pounce for visual mode
		["s"] = { "<cmd> Pounce <CR>", "s   pounce to word", opts = { noremap = true, silent = true } },
		["S"] = {
			"<cmd> PounceRepeat <CR>",
			"s   pounce previod to word",
			opts = { noremap = true, silent = true },
		},

		-- copypasting with system clipboard:
		["<leader>y"] = { '"*y', "   yank to system clipboard", opts = { noremap = true } },
		["<leader>p"] = { '"_d"*p', "   paste from system clipboard", opts = { noremap = true } },
		["<leader>P"] = { '"_d"*P', "   paste from system clipboard", opts = { noremap = true } },
	},
}

M.nvimtree = {
	n = {
		-- toggle tree
		["<leader>tt"] = { "<cmd> NvimTreeToggle <CR>", "   toggle nvimtree" },

		-- focus tree
		["<leader>tf"] = { "<cmd> NvimTreeFindFile <CR>", "   focus nvimtree" },
	},
}

M.bufferline = {

	n = {
		-- new buffer
		["<leader>bn"] = { "<cmd> enew <CR>", "烙 new buffer" },

		-- cycle through buffers
		["<C-n>"] = { "<cmd> Tbufnext <CR>", "  cycle next buffer" },
		["<C-p>"] = { "<cmd> Tbufprev <CR>", "  cycle prev buffer" },

		-- close buffer + hide terminal buffer
		["<leader>bd"] = {
			function()
				require("core.utils").close_buffer()
			end,
			"   close buffer",
		},
	},
}

return M
