local status, nvim_lsp = pcall(require, 'lspconfig')
if (not status) then return end

nvim_lsp.intelephense.setup {
	on_attach = on_attach,
	filetypes = {'php'}
}

nvim_lsp.tsserver.setup {
	on_attach = on_attach,
}

nvim_lsp.vuels.setup {
	on_attach = on_attach,
}

nvim_lsp.sumneko_lua.setup {
	on_attach = on_attach,
	settings = {
		Lua = {
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { 'vim' },
			},

			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false
			},
		},
	},
}
