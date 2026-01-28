return {
	{
		"hkupty/iron.nvim",
		config = function()
			local iron = require("iron.core")

			iron.setup({
				config = {
					-- Whether a repl should be discarded or not
					scratch_repl = true,
					-- Your repl definitions come here
					repl_definition = {
						sh = {
							-- Can be a table or a function that
							-- returns a table (see below)
							command = { "zsh" },
						},
						python = {
							command = { "python3" }, -- or { "ipython", "--no-autoindent" }
							block_dividers = { "# %%", "#%%" },
							env = { PYTHON_BASIC_REPL = "1" }, --this is needed for python3.13 and up.
						},
					},
					-- How the repl window will be displayed
					-- See below for more information
					repl_open_cmd = "vertical botright 60 split",
				},
				-- Iron doesn't set keymaps by default anymore.
				-- You can set them here or manually add keymaps to the functions in iron.core
				keymaps = {
					visual_send = "<space>is",
					send_file = "<space>if",
					send_line = "<space>il",
					send_mark = "<space>im",
					send_code_block = "<space>ib",
					send_code_block_and_move = "<space>in",
					mark_motion = "<space>mc",
					mark_visual = "<space>mc",
					remove_mark = "<space>md",
					cr = "<space>s<cr>",
					interrupt = "<space>s<space>",
					exit = "<space>iq",
					clear = "<space>ic",
				},
				-- If the highlight is on, you can change how it looks
				-- For the available options, check nvim_set_hl
				highlight = {
					italic = true,
				},
				ignore_blank_lines = true, -- ignore blank lines when sending visual select lines
			})

			-- iron also has a list of commands, see :h iron-commands for all available commands
			vim.keymap.set("n", "<space>io", "<cmd>IronRepl<cr>")
			vim.keymap.set("n", "<space>ir", "<cmd>IronRestart<cr>")
			vim.keymap.set("n", "<space>ih", "<cmd>IronHide<cr>")
		end,
	},
}
