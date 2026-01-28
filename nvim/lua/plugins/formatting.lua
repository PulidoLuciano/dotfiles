return {
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				-- Python: Usa black (estándar de la industria)
				python = { "black" },
				-- JS, TS, CSS, HTML, JSON, YAML: Usa Prettier
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				-- C/C++: Usa clang-format
				c = { "clang-format" },
				cpp = { "clang-format" },
				-- Go: Usa gofmt (nativo y rápido)
				go = { "gofmt" },
				-- Java: Usa google-java-format
				java = { "google-java-format" },
			},
			-- Formatear automáticamente al guardar el archivo
			format_on_save = {
				timeout_ms = 500,
				lsp_fallback = true,
			},
		},
	},
}
