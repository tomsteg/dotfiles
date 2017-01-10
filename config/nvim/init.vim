call plug#begin('~/.config/nvim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'tpope/vim-surround'
Plug 'neomake/neomake'
Plug 'scrooloose/nerdcommenter'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'mattn/emmet-vim'
Plug 'Raimondi/delimitMate'
Plug 'docunext/closetag.vim', {'for': ['html', 'xml']}
Plug 'szw/vim-tags'
Plug 'majutsushi/tagbar'
Plug 'tyru/open-browser.vim'
Plug 'will133/vim-dirdiff'
Plug 'editorconfig/editorconfig-vim'
Plug 'brooth/far.vim'
Plug 'vimwiki/vimwiki'

Plug 'Shougo/unite.vim'
Plug 'Shougo/vimfiler'

Plug 'Shougo/deoplete.nvim'
Plug 'ternjs/tern_for_vim', {'build': 'npm install'}
Plug 'carlitux/deoplete-ternjs', {'on_ft': 'javascript'}
Plug 'pbogut/deoplete-padawan', {'on_ft': 'php'}
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
Plug 'mhartington/oceanic-next'

call plug#end()

filetype plugin indent on

" Theme
syntax on
colorscheme OceanicNext
let g:oceanic_next_terminal_italic = 1
let g:oceanic_next_terminal_bold = 1

" change syntax coloring in spell mode
highlight clear SpellBad
highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
highlight clear SpellCap
highlight SpellCap term=underline cterm=underline
highlight clear SpellRare
highlight SpellRare term=underline cterm=underline
highlight clear SpellLocal
highlight SpellLocal term=underline cterm=underline

" switch cursor to line when in insert mode, and block when not
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

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

" easy editing neovim settings
map <leader>iv :e ~/.config/nvim/init.vim<cr>
map <leader>is :source ~/.config/nvim/init.vim<cr>

" exit from terminal mode
:tnoremap <Esc> <C-\><C-n>

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
"let g:ctrlp_custom_ignore = {
	\ 'dir':  '\v[\/](\.(git|svn))|node_modules|bower_components|vendor$'
	\}

"fzf
nmap <C-p> :FZF<cr>

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
set listchars=tab:→\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
set showbreak=↪

" highlight conflicts
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

"Tagbar
nmap <F8> :TagbarOpenAutoClose<CR>

" Use deoplete.
let g:deoplete#enable_at_startup = 1
let g:deoplete#delimiters = ['/', '.', '::', ':', '#', '->']
let g:deoplete#sources#tss#max_completion_detail = 65
let g:SuperTabDefaultCompletionType = "<c-n>"
" close the preview window when you're not using it
" let g:SuperTabClosePreviewOnPopupClose = 1

" tern
" Use deoplete.
let g:tern_request_timeout = 1
let g:tern_show_signature_in_pum = '0'  " This do disable full signature type on autocomplete
" Use tern_for_vim.
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]

" neosnippet
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
" custom snippet dir
let g:neosnippet#snippets_directory = '~/dotfiles/config/nvim/snippets/'

" WhiteSpace
nmap <localleader>st :StripWhitespace<CR>

"nerdtree
map <leader>nt :NERDTreeToggle<CR>
let NERDTreeWinSize=60

"vimfiler
let g:vimfiler_as_default_explorer = 1
nmap - :VimFiler -toggle<cr>
nmap <localleader>vf :VimFilerExplorer -toggle -winwidth=50<cr>
nmap <localleader>vt :VimFilerExplorer -toggle -winwidth=50 ~/Websites/Test.git<cr>

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
let g:airline_theme='oceanicnext'
let g:airline#extensions#whitespace#show_message = 0
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tab_nr = 1
nmap <leader>l :bnext<CR>
nmap <leader>h :bprev<CR>

