# important keymaps

## normal mode

sv			split vertical
sh			split horizontal
<space>		cycle windows
C-h			goto left window
C-j			goto right window
C-k			goto top window
C-l 		goto bottom window
C-Up		horizontal increase window
C-Down		horizontal decrease window
C-Left		vertical decrease window
C-Right		vertical increase window

## visual mode

<			decrease indent
> 			increase indent

## git

<leader>ga	open blame window
q			close blame window
<CR> 		open bleme commit
<leader>go	open file/folder in git repository
<leader>gd	opens a new diff that compares against the current index	
<leader>gD	close git diff
<leader>gr	revert to the specific commit
<leader>gR	revert the current file to the specific commit

## telescope

<leader>ff	find files
<leader>fg	live grep
<leader>fh	help tags
<leader>gf	git files
<leader>gb	git branches
<leader>gc	git commits
<leader>gs	git status

<leader>lr	lsp references
<leader>ls	lsp symbols
<leader>ld	lsp definitions
<leader>le	lsp diagnostics

## Completion

<C-d>		Scroll docs -4
<C-f>		Scroll docs 4
<C-Space>	Complete
<C-e>		Close
<CR>		Confirm

## Packer

-- You must run this or `PackerSync` whenever you make changes to your plugin configuration
-- Regenerate compiled loader file
:PackerCompile

-- Remove any disabled or unused plugins
:PackerClean

-- Clean, then install missing plugins
:PackerInstall

-- Clean, then update and install plugins
-- supports the `--preview` flag as an optional first argument to preview updates
:PackerUpdate

-- Perform `PackerUpdate` and then `PackerCompile`
-- supports the `--preview` flag as an optional first argument to preview updates
:PackerSync

-- Loads opt plugin immediately
:PackerLoad completion-nvim ale
