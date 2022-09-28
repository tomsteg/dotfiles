vim.opt.backspace = { 'start', 'eol', 'indent' } -- specifies what <BS>, CTRL-W, etc. can do in Insert mode
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'
vim.opt.cmdheight = 1 -- number of lines used for the command-line
vim.opt.hlsearch = true -- highlight searchresults
vim.opt.ignorecase = true -- case insensitive searching
vim.opt.inccommand = 'split'
vim.opt.iskeyword = { '$', '@', '48-57', '_' , '192-255' }
vim.opt.laststatus = 2
vim.opt.number = true -- automatically set the indent of a new line
vim.opt.relativenumber = true -- show the relative line number for each line
vim.opt.showcmd	= true -- show (partial) command keys in the status line
vim.opt.scrolloff = 5 -- number of screen lines to show around the cursor
vim.opt.wildignore:append { '*/node_modules/*', '*/vendor/*' }
vim.opt.wildignorecase = true
vim.opt.wildmenu = true -- command-line completion shows a list of matches

-- use 4 spaces as tab for indentation
vim.opt.tabstop = 4 -- number of spaces a <Tab> in the text stands for
vim.opt.softtabstop = 0 -- if non-zero, number of spaces to insert for a <Tab>
vim.opt.shiftwidth = 4 -- number of spaces used for each step of (auto)indent
-- the same indent as the line you're currently on
vim.opt.autoindent = true -- automatically set the indent of a new line
vim.opt.smartindent = true -- do clever autoindenting
vim.opt.expandtab = false -- expand <Tab> to spaces in Insert mode

