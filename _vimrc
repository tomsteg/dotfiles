call plug#begin('~/.vim/bundle')

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-surround'
Plug 'neomake/neomake'
Plug 'scrooloose/nerdcommenter'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'mattn/emmet-vim'
Plug 'docunext/closetag.vim', {'for': ['html', 'xml']}
Plug 'szw/vim-tags'
Plug 'majutsushi/tagbar'
Plug 'tyru/open-browser.vim'
Plug 'will133/vim-dirdiff'
Plug 'editorconfig/editorconfig-vim'
Plug 'brooth/far.vim'
Plug 'jremmen/vim-ripgrep'
Plug 'vimwiki/vimwiki'

Plug 'Shougo/unite.vim'

Plug 'valloric/youcompleteme'
Plug 'ervandew/supertab'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'

Plug 'StanAngeloff/php.vim', {'for': 'php'}
Plug 'joonty/vdebug', {'for': 'php'}
Plug 'pangloss/vim-javascript', {'for': ['js', 'typescript']}
Plug 'jelera/vim-javascript-syntax', {'for': ['js', 'typescript']}
Plug 'othree/javascript-libraries-syntax.vim', {'for': ['js', 'typescript']}
Plug 'leshill/vim-json', {'for': 'json'}
Plug 'posva/vim-vue', {'for': ['js', 'typescript', 'html']}
Plug 'leafgarland/typescript-vim', {'for': 'typescript'}
Plug 'burnettk/vim-angular', {'for': ['js', 'typescript', 'html']}
Plug 'claco/jasmine.vim'
Plug 'hail2u/vim-css3-syntax', {'for': ['css', 'scss', 'less']}
Plug 'cakebaker/scss-syntax.vim', {'for': 'scss'}
Plug 'evidens/vim-twig', {'for': 'twig'}
Plug 'tpope/vim-markdown', {'for': 'markdown'}

Plug 'davidoc/taskpaper.vim', {'for': 'taskpaper'}

Plug 'ntpeters/vim-better-whitespace'
Plug 'yggdroot/indentline'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

filetype plugin indent on

" Theme
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

" guifont
set guifont=Fantasque\ Sans\ Mono:h12.00

set linebreak
set cursorline
set linespace=2
set autoread
set clipboard=unnamed
set laststatus=2
set backspace=indent,eol,start   " Fix backspace not deleting tabs, also make delimiteMate work
set showmatch
set showmode
set showcmd
set hlsearch
set ignorecase
set smartcase
set incsearch
set ruler
set wildmenu
set wildmode=list:longest
set foldmethod=indent
set foldlevel=99

" use 4 spaces for indentation
set tabstop=4
set softtabstop=0
set shiftwidth=4
set autoindent
set noexpandtab

:command! -range=% -nargs=0 Tab2Space execute '<line1>,<line2>s#^\t\+#\=repeat(" ", len(submatch(0))*' . &ts . ')'
:command! -range=% -nargs=0 Space2Tab execute '<line1>,<line2>s#^\( \{'.&ts.'\}\)\+#\=repeat("\t", len(submatch(0))/' . &ts . ')'

" let makros start with a ,
let maplocalleader = ','
let mapleader = ','

" a better esc
"inoremap jk <esc>

" <C-B> is needed for tmux
nmap <C-j> <C-f>
nmap <C-k> <C-b>

" Because I often accidentally :W when I mean to :w.
command! W w
command! Q q

" format html
command! Tidy !tidy -mi -xml -wrap 0 %

" format json
nmap <localleader>fj :%!python -m json.tool<cr>

" highlight search result
nmap <leader>hs :set hlsearch<CR>
nmap <leader>nhs :nohlsearch<CR>

" spelling
map <leader>sp :set spell spelllang=de<cr>
map <leader>nsp :set nospell<cr>

map <leader>iv :e ~/.vimrc<cr>
map <leader>is :source ~/.vimrc<cr>

" change working directory to the file being edited
nnoremap <localleader>cd :cd %:p:h<CR>

" insert datetimestamp when typing dts
iab <expr> dts strftime("%c")

"html
autocmd BufRead,BufNewFile *.phtml set filetype=html
autocmd BufRead,BufNewFile *.phtml set syntax=html
autocmd BufRead,BufNewFile *.tpl set filetype=html
autocmd BufRead,BufNewFile *.tpl set syntax=html
autocmd BufRead,BufNewFile *.twig set filetype=html
autocmd BufRead,BufNewFile *.twig set syntax=html

"Markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
" npm install -g markdown-preview
nnoremap <localleader>md :!markdown-preview % --output %.html<CR>
let g:markdown_syntax_conceal = 0
let g:markdown_fold_override_foldtext = 1

" Fugitive
" deleting fugitive buffers
autocmd BufReadPost fugitive://* set bufhidden=delete

"open browser
let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)

" netrw
let g:netrw_preview   = 1
let g:netrw_liststyle = 3
let g:netrw_winsize   = 30
nmap - :Explore<cr>

" clist navigation
nmap <leader>ä :cnext<CR>
nmap <leader>ö :cprev<CR>
nmap <leader>Ö :cfirst<CR>
nmap <leader>Ä :clast<CR>

" diff helpers
nmap <leader>dt	:diffthis<CR>
nmap <leader>dg :diffget<CR>
nmap <leader>dp :diffput<CR>
nmap <leader>do :diffoff<CR>

" ignore white space in diff
let g:DirDiffAddArgs = "-w"
let g:DirDiffExcludes = ".DS_Store,.svn,node_modules,bower_components,.*.swp"

" after indenting in visual mode line(s) is(are) still selected
vnoremap < <gv
vnoremap > >gv

" scroll the viewport faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" llist
nmap <Leader><Space>o :lopen<CR>      " open location window
nmap <Leader><Space>c :lclose<CR>     " close location window
nmap <Leader><Space>, :ll<CR>         " go to current error/warning
nmap <Leader><Space>n :lnext<CR>      " next error/warning
nmap <Leader><Space>p :lprev<CR>      " previous error/warning

"use ag in ack.vim
let g:ackprg = 'ag --nogroup --nocolor --column'

" igoring while vimgrepping
set wildignore+=**/cache/**
set wildignore+=**/node_modules/**
set wildignore+=**/bower_components/**
set wildignore+=**/vendor/**

" for recursive searching
set path+=**

" ctrlp
let g:ctrlp_custom_ignore = {
	\ 'dir':  '\v[\/](\.(git|svn))|node_modules|bower_components|vendor$'
	\}

"fzf
nmap <C-p> :FZF<cr>
nmap <localleader>fp :Buffers<cr>
nmap <localleader>fc :Commands<cr>
nmap <localleader>fh :Helptags<cr>

" Rebuild tags
nnoremap <localleader>b :TagsGenerate<CR>

"xml format
nmap <localleader>x :silent %!xmllint --format -<cr>

" to set working directory to the directory of the file being edited
nnoremap <localleader>cd :cd %:p:h<CR>

" Show line numbers
set number
highlight LineNr term=bold cterm=NONE ctermfg=Grey ctermbg=NONE gui=NONE guifg=Grey guibg=NONE

" Shortcut to rapidly toggle `set list`
nmap <leader>ll :set list!<CR>

" highlight conflicts
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

"Tagbar
nmap <F8> :TagbarOpenAutoClose<CR>

" neosnippet
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
" custom snippet dir
let g:neosnippet#snippets_directory = '~/dotfiles/config/nvim/snippets/'

" WhiteSpace
nmap <localleader>st :StripWhitespace<CR>

"neomake
autocmd! BufWritePost * Neomake
map <leader>m :Neomake<CR>
let g:neomake_verbose = 3
let g:neomake_php_phpmd_maker = {
	\ 'args': ['%:p', 'text', $HOME . '/Websites/AgendaPhpMd/phpmd-rules.xml']
\ }
let g:neomake_php_phpcs_args_standard = $HOME . '/Websites/AgendaPhpCs/ruleset.xml'
let g:neomake_twig_twiglint_maker = {
	\ 'exec': 'php',
	\ 'args':  'php /Users/thomas_steglich/.composer/vendor/bin/twig-lint'
\ }
let b:neomake_javascript_enabled_makers = findfile('.jshintrc', '.;') != '' ? ['jshint'] : ['eslint']
let g:neomake_javascript_enabled_makers = executable('eslint') ? ['eslint'] : []
let g:neomake_typescript_tsc_maker = {
	\ 'args': [ '-m', 'commonjs', '--noEmit', '--experimentalDecorators'],
	\ 'append_file': 0,
	\ 'errorformat':
			\ '%E%f %#(%l\,%c): error %m,' .
			\ '%E%f %#(%l\,%c): %m,' .
			\ '%Eerror %m,' .
			\ '%C%\s%\+%m'
\ }
let g:neomake_html_enabled_makers = ['html5check']
let g:neomake_css_enabled_makers = ['csslint']
let g:neomake_css_csslint_maker = {
	\ 'args': ['--ignore=box-sizing', '--format=compact', '%:p'],
	\ 'errorformat':
		\ '%-G,' .
		\ '%-G%f: lint free!,' .
		\ '%f: line %l\, col %c\, %trror - %m,' .
		\ '%f: line %l\, col %c\, %tarning - %m,'.
		\ '%f: line %l\, col %c\, %m,'
\ }

"airline
let g:airline_theme='luna'
let g:airline#extensions#whitespace#show_message = 0
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tab_nr = 1
nmap <leader>l :bnext<CR>
nmap <leader>h :bprev<CR>

