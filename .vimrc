call plug#begin('~/.vim/bundle')

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-surround'
Plug 'scrooloose/syntastic'
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

Plug 'valloric/youcompleteme'
Plug 'shawncplus/phpcomplete.vim'

Plug 'StanAngeloff/php.vim', {'for': 'php'}
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
Plug 'godlygeek/tabular'
Plug 'tpope/vim-markdown'

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

" guifont
set guifont=Fira\ Code:h12.00

" set printer options
set printoptions=paper:A4,left:20mm,right:40mm,top:20mm,bottom:20mm,header:3,number:n

set linebreak
set cursorline
set linespace=2
set nofoldenable
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

inoremap jk <esc>

nmap <C-j> <C-f>
nmap <C-k> <C-b>

" highlight search result
nmap <leader>hs :set hlsearch<CR>
nmap <leader>nhs :nohlsearch<CR>

map <leader>sp :set spell spelllang=de<cr>
map <leader>nsp :set nospell<cr>

map <leader>iv :e ~/.vimrc<cr>
map <leader>is :source ~/.vimrc<cr>

" change working directory to the file being edited
nnoremap <localleader>cd :cd %:p:h<CR>

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
let g:ctrlp_custom_ignore = {
	\ 'dir':  '\v[\/](\.(git|svn))|node_modules|bower_components|vendor$'
	\}

" Rebuild tags
nnoremap <localleader>b :TagsGenerate<CR>

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
let NERDTreeWinSize=40

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

"airline
let g:airline#extensions#syntastic#enabled = 0
let g:airline#extensions#whitespace#show_message = 0
let g:airline_theme='oceanicnext'
let g:airline#extensions#whitespace#show_message = 0
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tab_nr = 1
nmap <leader>l :bnext<CR>
nmap <leader>h :bprev<CR>

