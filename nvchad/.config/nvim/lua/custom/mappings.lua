local M = {}

M.disabled = {
	-- Disabled or overwritten:
	["<C-n>"] = "",
}

M.general = {

	n = {
		-- write buffer
		["<leader><leader>"] = { "<cmd> w <CR>", "   write buffer" },

		-- quit with saving
		["<leader>a"] = { "<cmd> wqa <CR>", "   quit without saving" },

		-- quit without saving
		["<leader>q"] = { "<cmd> qa! <CR>", "   quit without saving" },

		-- make Y behave like other capitals
		["Y"] = { "yg_", "Y   yank to end of line" },

		-- keeping the shit centered
		["n"] = { "nzzzv", "n   find next centered" },
		["N"] = { "Nzzzv", "N   find previous centered" },
		["J"] = { "mzJ`z", "J   bring up next line centerd" },

		-- pounce for normal mode
		["s"] = { "<cmd> Pounce <CR>", "s   pounce to word", opts = { noremap = true, silent = true } },
		["S"] = {
			"<cmd> PounceRepeat <CR>",
			"s   pounce previod to word",
			opts = { noremap = true, silent = true },
		},
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
	},
}

M.nvimtree = {
	n = {
		-- toggle tree
		["<leader>tt"] = { "<cmd> NvimTreeToggle <CR>", "   toggle nvimtree" },

		-- focus tree
		["<leader>tf"] = { "<cmd> NvimTreeFocus <CR>", "   focus nvimtree" },
	},
}

M.bufferline = {

	n = {
		-- new buffer
		["<leader>bn"] = { "<cmd> enew <CR>", "烙 new buffer" },

		-- cycle through buffers
		["<C-n>"] = { "<cmd> BufferLineCycleNext <CR>", "  cycle next buffer" },
		["<C-p>"] = { "<cmd> BufferLineCyclePrev <CR>", "  cycle prev buffer" },

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
