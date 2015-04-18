filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'mattn/emmet-vim'
Plugin 'tpope/vim-surround'
Plugin 'StanAngeloff/php.vim'
"Plugin 'rking/ag.vim'
Plugin 'scrooloose/syntastic'
Plugin 'pangloss/vim-javascript'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'rizzatti/dash.vim' 

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

set linebreak

" let makros start with a ,
let maplocalleader = ","
let mapleader = ","

map <leader>nt :NERDTreeToggle<CR>

" change working directory to the file being edited
nnoremap <localleader>cd :cd %:p:h<CR>

au FocusLost,TabLeave * call feedkeys("\<C-\>\<C-n>")

"Markdown
au BufRead,BufNewFile *.md set filetype=markdown
nmap <leader>md :%!/usr/local/bin/Markdown.pl --html4tags <cr>

" Fugitive
" deleting fugitive buffers
autocmd BufReadPost fugitive://* set bufhidden=delete

" Syntax highlightning on
syntax on

" change syntax coloring in spell mode
highlight clear SpellBad
highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
highlight clear SpellCap
highlight SpellCap term=underline cterm=underline
highlight clear SpellRare
highlight SpellRare term=underline cterm=underline
highlight clear SpellLocal
highlight SpellLocal term=underline cterm=underline

" Show current mode
set showmode
set showcmd 

" highlight search result
set hlsearch
nmap <leader>hs :set hlsearch<CR>
nmap <leader>nhs :nohlsearch<CR>

" Show matching parentheses
set showmatch

" guifont
set guifont=Fira\ Mono:h12.00

" set printer options
set printoptions=paper:A4,left:20mm,right:40mm,top:20mm,bottom:20mm,header:3,number:n

" use 4 spaces for indentation
set tabstop=4 
set softtabstop=0
set shiftwidth=4
set autoindent
set noexpandtab

" show the cursor line and column number
set ruler

" to set working directory to the directory of the file being edited
nnoremap <localleader>cd :cd %:p:h<CR>

" Show line numbers
set nu
highlight LineNr term=bold cterm=NONE ctermfg=Grey ctermbg=NONE gui=NONE guifg=Grey guibg=NONE

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>
 
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

"Invisible character colors
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

" No menu und toolbar in GVim
set guioptions-=T

" enable ftplugin for xml
"autocmd BufNewFile,BufRead *.xml source ~/.vim/ftplugin/xml.vim
"map <Leader>x :set filetype=xml<CR>

" Statusbar
set laststatus=2
set statusline=
set statusline+=%-3.3n\                      " buffer number
set statusline+=%f\                          " file name
set statusline+=%h%m%r%w                     " flags
set statusline+=\[%{strlen(&ft)?&ft:'none'}, " filetype
set statusline+=%{&encoding},                " encoding
set statusline+=%{&fileformat}]              " file format
set statusline+=%=                           " right align
set statusline+=0x%-8B\                      " current char
set statusline+=%-10.(%l,%c%V%)\ %<%P        " offset

function! HandleURI()
  let s:uri = matchstr(getline("."), '[a-z]*:\/\/[^ >,;:]*')
  echo s:uri
  if s:uri != ""
	  exec "!open \"" . s:uri . "\""
  else
	  echo "No URI found in line."
  endif
endfunction
map <Leader>w :call HandleURI()<CR>

" These mappings and TagSelection function will allow you to place
" an XML tag around either the current word, or the current selected
" text.
" If the visual select is on a single line, the tag is wrapped
" around the text <this>way</this>. If the visual select
" extends over multiple lines, the tag is wrapped around the text
" <this>
" way
" </this>
"
" When you are prompted for the tag name, you can enter:
" Tag name? p class="classname" attri="bute"
" The select is wrapped with:
" <p class="classname" attri="bute">
" Your selection
" </p>
" Notice the attributes have been stripped from the closing tag.
"
" Use nmap, not nnoremap, since we do want to use an existing mapping.
map <Leader>t :call TagSelection()<CR>

function! TagSelection()
  let tag = input("Tag name (include attributes)? ")
  if strlen(tag) == 0

  " Save
  let saveB = @b
  " <C-R> seems to automatically reindent the line for some filetypes
  " this will disable it until we have applied our changes
  let saveIndent = &indentexpr
  let curl = line(".")
  let curc = col(".")
  let &indentexpr = ''

  " If the visual selection is over multiple lines, then place the
  " data between the tags on newlines:
  "   <tag>
  "   data
  "   </tag>
  let newline = ''
  if getline("'>") != getline("'<")
    let newline = "\n"
    let curl = line("'>")
  endif

  " Strip off all but the first word in the tag for the end tag
  let @b = newline . substitute(tag, '^[ \t"]*\(\<\S*\>\).*', '<\/\1>\e', "")
  let curc = curc + strlen(@b)
  exec "normal `>a\<C-R>b"
  let @b = substitute(tag, '^[ \t"]*\(\<.*\)', '<\1>\e', "") . newline
  let curc = curc + strlen(@b)
  exec "normal `<i\<C-R>b"

  " Now format the area
  exec "normal `<V'>j="

  " Restore
  let @b = saveB
  let &indentexpr = saveIndent
  call cursor(curl, curc)
endfunction
