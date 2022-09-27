local status, telescope = pcall(require, 'telescope')
if (not status) then return end
local actions = require('telescope.actions')
local builtin = require('telescope.builtin')

-- file keymaps
vim.keymap.set('n', '<leader>ff', function()
	builtin.find_files({
		no_ignore = true,
		hidden = true
	})
end)
vim.keymap.set('n', '<leader>fg', function()
	builtin.live_grep()
end)
vim.keymap.set('n', '<leader>fb', function()
	builtin.buffers()
end)
vim.keymap.set('n', '<leader>fh', function()
	builtin.help_tags()
end)

-- git keymaps
vim.keymap.set('n', '<leader>gf', function()
	builtin.git_files()
end)
vim.keymap.set('n', '<leader>gb', function()
	builtin.git_branches()
end)
vim.keymap.set('n', '<leader>gc', function()
	builtin.git_commits()
end)
vim.keymap.set('n', '<leader>gs', function()
	builtin.git_status()
end)

-- language server keymaps
vim.keymap.set('n', '<leader>lr', function()
	builtin.lsp_references()
end)
vim.keymap.set('n', '<leader>ls', function()
	builtin.lsp_document_symbols()
end)
vim.keymap.set('n', '<leader>ld', function()
	builtin.lsp_definitions()
end)
vim.keymap.set('n', '<leader>le', function()
	builtin.diagnostics()
end)

require('telescope').setup{
	defaults = {
		mappings = {
			i = {
				['<esc>'] = actions.close
			}
		}
	}
}
