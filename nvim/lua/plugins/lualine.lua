return {
	{
		"nvim-lualine/lualine.nvim",
		opts = function()
			-- Definición de la paleta exacta de tu Starship
			local colors = {
				naranja_dir = "#ef955c", -- Color del directorio
				marron_osc = "#241a24", -- Fondo oscuro de las cápsulas
				marron_med = "#3d2b3d", -- Marrón de las siluetas
				amarillo = "#f6d18a", -- Texto y detalles
			}

			local sunset_theme = {
				normal = {
					-- El modo normal ahora es naranja con letra oscura, como tu directorio
					a = { fg = colors.marron_osc, bg = colors.naranja_dir, gui = "bold" },
					b = { fg = colors.amarillo, bg = colors.marron_med },
					c = { fg = colors.amarillo, bg = colors.marron_osc },
				},
				insert = {
					a = { fg = colors.marron_osc, bg = colors.amarillo, gui = "bold" },
					b = { fg = colors.amarillo, bg = colors.marron_med },
				},
				visual = {
					a = { fg = colors.marron_osc, bg = "#bb7a5c", gui = "bold" }, -- Un naranja más profundo
					b = { fg = colors.amarillo, bg = colors.marron_med },
				},
				replace = {
					a = { fg = colors.marron_osc, bg = "#ff5555", gui = "bold" },
					b = { fg = colors.amarillo, bg = colors.marron_med },
				},
				inactive = {
					a = { fg = colors.marron_med, bg = colors.marron_osc },
					b = { fg = colors.marron_med, bg = colors.marron_osc },
					c = { fg = colors.marron_med, bg = colors.marron_osc },
				},
			}

			return {
				options = {
					theme = sunset_theme,
					component_separators = "",
					section_separators = { left = "", right = "" }, -- Usando las flechas sólidas de tu terminal
					globalstatus = true,
					disabled_filetypes = { statusline = { "dashboard", "lazy", "alpha" } },
				},
				sections = {
					lualine_a = { { "mode", right_padding = 2 } },
					lualine_b = { "branch", "diff" },
					lualine_c = {
						{ "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
						{ "filename", path = 1 },
					},
					lualine_x = { "diagnostics" },
					lualine_y = { "progress" },
					lualine_z = { { "location", left_padding = 2 } },
				},
			}
		end,
	},
}
