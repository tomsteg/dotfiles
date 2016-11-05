set runtimepath+=~/.config/nvim/dein/repos/github.com/Shougo/dein.vim/

call dein#begin('~/.config/nvim/dein/repos/')

call dein#add('scrooloose/nerdtree')
call dein#add('Xuyuanp/nerdtree-git-plugin')
call dein#add('kien/ctrlp.vim')
call dein#add('tpope/vim-vinegar')
call dein#add('tpope/vim-surround')
call dein#add('neomake/neomake')
call dein#add('scrooloose/nerdcommenter')
call dein#add('mileszs/ack.vim')
call dein#add('tpope/vim-fugitive')
call dein#add('airblade/vim-gitgutter')
call dein#add('mattn/emmet-vim')
call dein#add('docunext/closetag.vim')
call dein#add('majutsushi/tagbar')
call dein#add('tyru/open-browser.vim')
call dein#add('valloric/youcompleteme')
call dein#add('will133/vim-dirdiff')
call dein#add('editorconfig/editorconfig-vim')

call dein#add('StanAngeloff/php.vim', {'on_ft': 'php'})
call dein#add('shawncplus/phpcomplete.vim')
call dein#add('pangloss/vim-javascript')
call dein#add('jelera/vim-javascript-syntax')
call dein#add('othree/javascript-libraries-syntax.vim')
call dein#add('leshill/vim-json')
call dein#add('leafgarland/typescript-vim')
call dein#add('burnettk/vim-angular')
call dein#add('claco/jasmine.vim')
call dein#add('hail2u/vim-css3-syntax')
call dein#add('cakebaker/scss-syntax.vim')
call dein#add('tpope/vim-markdown')
call dein#add('evidens/vim-twig')

call dein#add('rizzatti/dash.vim')
call dein#add('davidoc/taskpaper.vim')
call dein#add('Chiel92/vim-autoformat')

call dein#add('ntpeters/vim-better-whitespace')
call dein#add('yggdroot/indentline')

call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')
call dein#add('mhartington/oceanic-next')

call dein#end()

if (dein#check_install())
	call dein#install()
endif
"if (dein#check_update())
"	call dein#update()
"endif

filetype plugin indent on

" let makros start with a ,
let maplocalleader = ','
let mapleader = ','

"let g:python_host_prog = '/usr/bin/python2.7'
"let g:python3_host_prog = '/usr/local/bin/python3'

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

if (has("termguicolors"))
 set termguicolors
endif

" Theme
syntax enable
colorscheme OceanicNext

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
"set incsubstitute=split
set showmatch

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

nmap <Leader><Space>o :lopen<CR>      " open location window
nmap <Leader><Space>c :lclose<CR>     " close location window
nmap <Leader><Space>, :ll<CR>         " go to current error/warning
nmap <Leader><Space>n :lnext<CR>      " next error/warning
nmap <Leader><Space>p :lprev<CR>      " previous error/warning

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

"neomake
autocmd! BufWritePost * Neomake
let g:neomake_verbose = 3
let g:neomake_php_enabled_makers = ['php', 'phpcs', 'phpmd']
let g:neomake_php_phpmd_maker = {
	\ 'args': $HOME .  '/Websites/AgendaPhpMd/phpmd-rules.xml'
\ }
let g:neomake_php_phpcs_maker = {
	\ 'args': '--standard=' . $HOME . '/Websites/AgendaPhpCs/ruleset.xml'
\ }
let g:neomake_twig_twiglint_maker = {
	\ 'exec': 'php',
	\ 'args':  'php /Users/thomas_steglich/.composer/vendor/bin/twig-lint'
\ }
let g:neomake_javascript_enabled_makers = findfile('.jshintrc', '.;') != '' ? ['jshint'] : ['eslint']
let g:neomake_typescript_tsc_maker = {
    \ 'args': [ '-m', 'commonjs', '--noEmit', '--experimentalDecorators'],
    \ 'append_file': 0,
    \ 'errorformat':
            \ '%E%f %#(%l\,%c): error %m,' .
            \ '%E%f %#(%l\,%c): %m,' .
            \ '%Eerror %m,' .
            \ '%C%\s%\+%m'
\ }

"airline
let g:airline_theme='luna'
let g:airline#extensions#whitespace#show_message = 0
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tab_nr = 1
