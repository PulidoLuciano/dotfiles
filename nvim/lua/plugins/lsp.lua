return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			-- Aseguramos la instalación de los servidores que pediste
			servers = {
				-- C/C++
				clangd = {},
				-- Python (Pandas/Data Science)
				pyright = {},
				-- JS/TS (React Native)
				tsserver = {},
				-- Golang
				gopls = {},
				-- Java
				jdtls = {},
				-- Web & Marcado
				html = {},
				cssls = {},
				jsonls = {},
				yamlls = {},
			},
		},
	},
}
