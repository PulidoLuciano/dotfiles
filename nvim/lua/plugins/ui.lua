return {
	{
		"folke/snacks.nvim",
		opts = {
			dashboard = {
				enabled = true,
				sections = {
					{ section = "header" },
					{ section = "keys", gap = 1, padding = 1 },
					{ section = "startup" },
				},
				preset = {
					header = [[
      ███╗   ██╗██╗   ██╗██╗███╗   ███╗
      ████╗  ██║██║   ██║██║████╗ ████║
      ██╔██╗ ██║██║   ██║██║██╔████╔██║
      ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║
      ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║
      ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝
          
          ʟ ᴜ ᴄ ɪ ᴀ ɴ ᴏ   ᴘ ᴜ ʟ ɪ ᴅ ᴏ
      Systems engineer and data specialist]],
				},
			},
		},
	},
	{
		"folke/noice.nvim",
		opts = {
			cmdline = {
				view = "cmdline_popup", -- La barra flotante central
				format = {
					cmdline = { pattern = "^:", icon = " ", lang = "vim" },
					search_down = { kind = "search", pattern = "^/", icon = "  ", lang = "regex" },
				},
			},
			views = {
				cmdline_popup = {
					position = { row = 5, col = "50%" },
					size = { width = 60, height = "auto" },
					border = {
						style = "rounded", -- Bordes redondeados como tus cápsulas
						padding = { 0, 1 },
					},
					win_options = {
						winhighlight = {
							Normal = "NoiceCmdline", -- Fondo del popup
							FloatBorder = "NoiceCmdlineBorder", -- Borde del popup
						},
					},
				},
			},
		},
	},
}
