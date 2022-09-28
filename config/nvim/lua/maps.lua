vim.g.mapleader = ' '

local keymap = vim.keymap

keymap.set('', '<', '[')
keymap.set('', '>', ']')

-- split window
keymap.set('n', 'sv', ':vsplit<Return><C-w>w')
keymap.set('n', 'sh', ':split<Return><C-w>w')

-- move window
keymap.set('n', '<Space>', '<C-w>w')
keymap.set('n', '<C-h>', '<C-w>h')
keymap.set('n', '<C-j>', '<C-w>j')
keymap.set('n', '<C-k>', '<C-w>k')
keymap.set('n', '<C-l>', '<C-w>l')

-- resize window
keymap.set('n', '<C-w><left>', '<C-w><')

