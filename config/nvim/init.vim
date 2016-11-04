" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

" Required:
set runtimepath+=~/.config/nvim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.config/nvim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ }

NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Xuyuanp/nerdtree-git-plugin'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'tpope/vim-vinegar'
NeoBundle 'tpope/vim-surround'
"NeoBundle 'scrooloose/syntastic'
NeoBundle 'neomake/neomake'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'mileszs/ack.vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'docunext/closetag.vim'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'vim-airline/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'
NeoBundle 'valloric/youcompleteme'
NeoBundle 'will133/vim-dirdiff'
NeoBundle 'editorconfig/editorconfig-vim'

NeoBundle 'StanAngeloff/php.vim'
NeoBundle 'shawncplus/phpcomplete.vim'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'jelera/vim-javascript-syntax'
NeoBundle 'othree/javascript-libraries-syntax.vim'
NeoBundle 'leshill/vim-json'
NeoBundle 'leafgarland/typescript-vim'
NeoBundle 'burnettk/vim-angular'
NeoBundle 'claco/jasmine.vim'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'cakebaker/scss-syntax.vim'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'evidens/vim-twig'

NeoBundle 'rizzatti/dash.vim'
NeoBundle 'davidoc/taskpaper.vim'
NeoBundle 'Chiel92/vim-autoformat'

NeoBundle 'ntpeters/vim-better-whitespace'
NeoBundle 'yggdroot/indentline'
NeoBundle 'jwkicklighter/vim-schemes'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'zenorocha/dracula-theme', {'rtp': 'vim/'}
NeoBundle 'jordwalke/VimCleanColors'

call neobundle#end()

"Required
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

" let makros start with a ,
let maplocalleader = ','
let mapleader = ','

let g:python_host_prog = '/usr/bin/python2.7'

"nerdtree
map <leader>nt :NERDTreeToggle<CR>
let NERDTreeWinSize=40

" change working directory to the file being edited
nnoremap <localleader>cd :cd %:p:h<CR>

"Tagbar
nmap <F8> :TagbarToggle<CR>

" WhiteSpace
nmap <localleader>st :StripWhitespace<CR>

"html
autocmd BufRead,BufNewFile *.phtml set filetype=html
autocmd BufRead,BufNewFile *.phtml set syntax=html
autocmd BufRead,BufNewFile *.tpl set filetype=html
autocmd BufRead,BufNewFile *.tpl set syntax=html

"Markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
" npm install -g markdown-preview
nnoremap <localleader>md :!markdown-preview % --output %.html<CR>

" Fugitive
" deleting fugitive buffers
autocmd BufReadPost fugitive://* set bufhidden=delete

"open browser
let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)

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

set linebreak
set cursorline
set linespace=2
set nofoldenable
set autoread
set clipboard=unnamed
set laststatus=2
set backspace=indent,eol,start   " Fix backspace not deleting tabs, also make delimiteMate work

" Show current mode
set showmode
set showcmd

" highlight search result
set hlsearch
nmap <leader>hs :set hlsearch<CR>
nmap <leader>nhs :nohlsearch<CR>

nmap <leader>ä :cnext<CR>
nmap <leader>ö :cprev<CR>
nmap <leader>Ö :cfirst<CR>
nmap <leader>Ä :clast<CR>

nmap <leader>dt	:diffthis<CR>
nmap <leader>dg :diffget<CR>
nmap <leader>dp :diffput<CR>
nmap <leader>do :diffoff<CR>

vnoremap < <gv
vnoremap > >gv

" scroll the viewport faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" Show matching parentheses
set showmatch

" guifont
set guifont=Fira\ Code:h12.00

" set printer options
set printoptions=paper:A4,left:20mm,right:40mm,top:20mm,bottom:20mm,header:3,number:n

" use 4 spaces for indentation
set tabstop=4
set softtabstop=0
set shiftwidth=4
set autoindent
set noexpandtab

"use ag in ack.vim
let g:ackprg = 'ag --nogroup --nocolor --column'

" igoring while vimgrepping
set wildignore+=**/cache/**
set wildignore+=**/node_modules/**
set wildignore+=**/bower_components/**
set wildignore+=**/vendor/**

" for recursive searching
set path+=**

let g:ctrlp_custom_ignore = {
	\ 'dir':  '\v[\/](\.(git|svn))|node_modules|bower_components|vendor$'
	\}
" show the cursor line and column number
set ruler

"Rebuild tags with \b
nnoremap <localleader>b :!ctags -R

" to set working directory to the directory of the file being edited
nnoremap <localleader>cd :cd %:p:h<CR>

" Show line numbers
set number
highlight LineNr term=bold cterm=NONE ctermfg=Grey ctermbg=NONE gui=NONE guifg=Grey guibg=NONE

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

"Invisible character colors
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

" enable ftplugin for xml
"autocmd BufNewFile,BufRead *.xml source ~/.vim/ftplugin/xml.vim
"map <Leader>x :set filetype=xml<CR>

"syntastic
let g:syntastic_php_phpmd_post_args = $HOME . '/Websites/AgendaPhpMd/phpmd-rules.xml'
let g:syntastic_phpcs_conf='--standard=' . $HOME . '/Websites/AgendaPhpCs/ruleset.xml'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1
let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_typescript_checkers = ['tslint', 'tsc']
let g:syntastic_html_tidy_ignore_errors=[
	\" proprietary attribute ",
	\" attribute name \"ng-",
	\" attribute name \"[",
	\" attribute name \"(",
	\" attribute name \"*",
	\" attribute name \"#",
	\"trimming empty <",
	\"unescaped &",
	\"lacks \"action",
	\"is not recognized!",
	\"discarding unexpected",
\]
let g:syntastic_typescript_tsc_args = "--experimentalDecorators"
let g:syntastic_twig_twiglint_exec = 'php'
let g:syntastic_twig_twiglint_exe = 'php /Users/thomas_steglich/.composer/vendor/bin/twig-lint'

"neomake
autocmd! BufWritePost * Neomake
let g:neomake_verbose = 3
let g:neomake_php_enabled_makers = ['php', 'phpcs', 'phpmd']
let g:neomake_javascript_enabled_markers = findfile('.jshintrc', '.;') != '' ? ['jshint'] : ['eslint']
let g:neomake_typescript_tsc_maker = {
    \ 'args': [ '-m', 'commonjs', '--noEmit' ],
    \ 'append_file': 0,
    \ 'errorformat':
            \ '%E%f %#(%l\,%c): error %m,' .
            \ '%E%f %#(%l\,%c): %m,' .
            \ '%Eerror %m,' .
            \ '%C%\s%\+%m'
\ }

"airline
let g:airline#extensions#syntastic#enabled = 0
let g:airline#extensions#whitespace#show_message = 0
