local status, packer = pcall(require, 'packer')
if (not status) then
	print('Packer is not installed')
	return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
	use 'wbthomason/packer.nvim'
	use 'nvim-lualine/lualine.nvim'
	use 'nvim-lua/plenary.nvim'
	use 'nvim-telescope/telescope.nvim'
	use 'nvim-telescope/telescope-file-browser.nvim'
	use 'windwp/nvim-autopairs'
	use 'williamboman/nvim-lsp-installer'
	use	'neovim/nvim-lspconfig'
	use 'lewis6991/gitsigns.nvim'
	use 'dinhhuy258/git.nvim'
	use 'onsails/lspkind-nvim'
	use 'hrsh7th/cmp-buffer' -- nvim-cmp source for buffer words
	use 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp source for neovim's built-in LSP
	use 'hrsh7th/nvim-cmp' -- Completionuse 'lewis6991/gitsigns.nvim'
end)
