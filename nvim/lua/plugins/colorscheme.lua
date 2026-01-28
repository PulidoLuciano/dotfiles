return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		opts = {
			flavour = "mocha", -- Base oscura para máxima calidez
			transparent_background = true, -- Mantiene la transparencia para ver a Eevee
			term_colors = true,
			custom_highlights = function(colors)
				return {
					-- --- Estructura del Editor ---
					-- Fondo principal (Marrón silueta muy oscuro)
					Normal = { fg = "#f6d18a", bg = "#1a141a" },
					-- Línea actual (Marrón medio para que no brille de más)
					CursorLine = { bg = "#241a24" },
					-- Selección de texto (Naranja quemado)
					Visual = { bg = "#5a3d5a" },
					-- Números de línea (Amarillo y Naranja)
					LineNr = { fg = "#7a5c5a" },
					CursorLineNr = { fg = "#ef955c", bold = true },

					-- --- Resaltado de Sintaxis (Paleta Atardecer) ---
					-- Comentarios (Como las plantas en sombra, sutil)
					Comment = { fg = "#7a5c5a", italic = true },
					-- Palabras clave como 'return', 'if', 'import' (Naranja)
					["@keyword"] = { fg = "#ef955c", italic = true },
					-- Funciones (Naranja vibrante y negrita)
					["@function"] = { fg = "#ef955c", bold = true },
					-- Variables y parámetros (Amarillo crema)
					["@variable"] = { fg = "#f6d18a" },
					["@parameter"] = { fg = "#f6d18a", italic = true },
					-- Strings/Textos (Tono tierra/madera)
					["@string"] = { fg = "#d4a373" },
					-- Tipos y Clases (Naranja suave)
					["@type"] = { fg = "#ef955c" },
					-- Booleans y Números (Amarillo brillante)
					["@boolean"] = { fg = "#f6d18a", bold = true },
					["@number"] = { fg = "#f6d18a" },

					-- --- Paneles y Menús ---
					-- Bordes de ventanas divididas (Naranja del directorio)
					WinSeparator = { fg = "#ef955c" },
					-- Menú de autocompletado
					Pmenu = { bg = "#241a24", fg = "#f6d18a" },
					PmenuSel = { bg = "#ef955c", fg = "#241a24" },
					-- Buscador Telescope
					TelescopeNormal = { bg = "#1a141a" },
					TelescopeBorder = { fg = "#ef955c" },
					-- Estos son los grupos de resaltado específicos para Snacks Dashboard
					SnacksDashboardHeader = { fg = "#ef955c" }, -- Naranja del logo
					SnacksDashboardDesc = { fg = "#f6d18a" }, -- Amarillo de los textos
					SnacksDashboardKey = { fg = "#d4a373" }, -- Teclas en tono tierra
					SnacksDashboardFooter = { fg = "#7a5c5a", italic = true },

					-- --- Neo-tree (Explorador de archivos) ---
					-- Fondo del panel lateral (Marrón silueta oscuro)
					NeoTreeNormal = { bg = "#1a141a", fg = "#f6d18a" },
					NeoTreeNormalNC = { bg = "#1a141a", fg = "#f6d18a" },
					-- Archivos y carpetas seleccionadas (Naranja atardecer)
					NeoTreeCursorLine = { bg = "#3d2b3d", fg = "#ef955c", bold = true },
					-- Título del panel
					NeoTreeWinSeparator = { fg = "#ef955c", bg = "#1a141a" },
					NeoTreeSymbolicLinkTarget = { fg = "#d4a373" },

					-- --- Línea de Comandos y Flotantes (Telescope / Noice) ---
					-- Fondo de la línea de comandos flotante
					NormalFloat = { bg = "#241a24" },
					FloatBorder = { fg = "#ef955c", bg = "#241a24" },
					-- Mensajes de la línea de comandos (Cmdline)
					MsgArea = { fg = "#f6d18a", bg = "#1a141a" },

					-- Estilo para la barra de comandos flotante
					NoiceCmdline = { bg = "#241a24", fg = "#f6d18a" }, -- Marrón oscuro y texto amarillo
					NoiceCmdlineBorder = { fg = "#ef955c" }, -- Borde Naranja Atardecer
					-- Para que el ícono de la izquierda también sea naranja
					NoiceCmdlineIcon = { fg = "#ef955c" },
					NoiceCmdlineIconSearch = { fg = "#f6d18a" },
				}
			end,
			integrations = {
				telescope = { enabled = true, style = "nvchad" },
				treesitter = true,
				notify = true,
				mini = true,
				neotree = true,
				native_lsp = {
					enabled = true,
					underlines = {
						errors = { "undercurl" },
						hints = { "undercurl" },
						warnings = { "undercurl" },
						information = { "undercurl" },
					},
				},
			},
		},
	},
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "catppuccin",
		},
	},
}
