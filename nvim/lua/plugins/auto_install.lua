return {
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		opts = {
			ensure_installed = {
				-- Formatters
				"black", -- Python (Pandas/Investigación)
				"prettier", -- JS/TS/React Native/Web
				"clang-format", -- C/C++
				"google-java-format", -- Java
				"stylua", -- Para formatear tu propia config de Nvim
				-- Linters (Opcional, para detectar errores antes de guardar)
				"eslint_d", -- JS/TS
				"pylint", -- Python
			},
			auto_update = true,
			run_on_start = true,
		},
	},
}
