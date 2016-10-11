# my nvim tips

## ctags

generate a ctags file with the commandline in the root folder

	ctags -R .

`^]` goto definition of tag

`g^]` list all definitions of tag

`^T` jump back from the definition

`^W ^]` open the definition in a horizontal split

`F8` show tagbar

`:tn` jump to next matching tag

`:tp` jump to previous matching tag

## surround

NeoBundle 'scrooloose/syntastic'

selection in visual mode and `S` with an argument e.g. ' surrounds the selection with the argument

  Old text                 | Command     | New text
  ---					   | ---		 | ---
  "Hello *world!"           | ds"         | Hello world!
  "Hello *world!"           | cs"'        | 'Hello world!'
  Hello w*orld!             | ysiw)       | Hello (world)!

## find

`:b xxx` finds and opens the xxx file in the open buffers

## autocomplete

`^x ^n` for JUST this file

`^x ^f` for filenames (works with our path trick!)

`^x ^]` for tags only

`^n` for anything specified by the 'complete' option

`^n` and `^p` to go back and forth in the suggestion list

## snippets

Read an empty HTML template and move cursor to title

	nnoremap ,html :-1read $HOME/.vim/.skeleton.html<CR>3jwf>a

