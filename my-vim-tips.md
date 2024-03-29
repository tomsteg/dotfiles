# my nvim tips

## my personal keymaps

`C-j` skip foreward

`C-k` skip backward `C-b` is needed in tmux

`,cd` change working directory to the file being edited

`gx` open link or smart search in browser

### settings

`,iv` open nvim settings

`,is` apply nvim settings

### markdown

`,md` create markdown file

### clist

`,ä` next in clist

`,ö` prev in clist

`,Ö` first in clist

`,Ä` last in clist

### diff

`,dt` diffthis

`,do` diffoff

`,dg` diffget

`,dp` diffput

### errors

`,l` do linting with Neomake

`,<space>o` open location window

`,<space>c` close location window

`,<space>,` go to current error/warning

`,<space>n` next error/warning

`,<space>p` previous error/warning

## ctags

generate a ctags file with the commandline in the root folder

	ctags -R .

generate a ctags file inside of neovim

	:TagsGenerate

	,b

`C-]` goto definition of tag

`g C-]` list all definitions of tag

`C-T` jump back from the definition

`C-W C-]` open the definition in a horizontal split

`C-W C-}` open the definition in a preview window

`F8` show tagbar

`:tn` jump to next matching tag

`:tp` jump to previous matching tag

## deoplete

`C-n` go down in completion list

`C-p` go up in completion list

`C-w z` close preview window

`C-k` apply snippet

## surround

NeoBundle 'scrooloose/syntastic'

selection in visual mode and `S` with an argument e.g. ' surrounds the selection with the argument

  Old text                 | Command     | New text
  ---					   | ---		 | ---
  "Hello \*world!"           | ds"         | Hello world!
  "Hello \*world!"           | cs"'        | 'Hello world!'
  Hello w\*orld!             | ysiw)       | Hello (world)!

## find

`:b xxx` finds and opens the xxx file in the open buffers

## autocomplete

`C-x C-n` for JUST this file

`C-x C-f` for filenames (works with our path trick!)

`C-x C-]` for tags only

`C-n` for anything specified by the 'complete' option

`C-n` and `C-p` to go back and forth in the suggestion list

## neomake

`:ll #` go to error number # of the quickfixlist

`:lopen` open quickfixlist

`:lclose` close quickfixlist

## snippets

Read an empty HTML template and move cursor to title

	nnoremap ,html :-1read $HOME/.vim/.skeleton.html<CR>3jwf>a

# tmux

## my personal tmux keymaps

all bindings have a preceeding `C-b`

`|` split-window vertical

`-` split-window horizontal

### pane movement shortcuts

h select-pane left

j select-pane down

k select-pane above

l select-pane right

### Resize pane shortcuts

H resize-pane left by 10 chars

J resize-pane downwards by 10 rows

K resize-pane upwards by 10 rows

L resize-pane right by 10 chars
