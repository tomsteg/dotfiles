"  _                      _
" | |_ ___  _ __ ___  ___| |_ ___  __ _
" | __/ _ \| '_ ` _ \/ __| __/ _ \/ _` |
" | || (_) | | | | | \__ \ ||  __/ (_| |
"  \__\___/|_| |_| |_|___/\__\___|\__, |
"                                 |___/
"
"        _                              __ _
" __   _(_)_ __ ___     ___ ___  _ __  / _(_) __ _
" \ \ / / | '_ ` _ \   / __/ _ \| '_ \| |_| |/ _` |
"  \ V /| | | | | | | | (_| (_) | | | |  _| | (_| |
"   \_/ |_|_| |_| |_|  \___\___/|_| |_|_| |_|\__, |
"                                            |___/
"
call plug#begin('~/.vim/bundle')

Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-commentary'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'scrooloose/nerdcommenter'
Plug 'airblade/vim-gitgutter'
Plug 'mattn/emmet-vim'
Plug 'docunext/closetag.vim', {'for': ['html', 'xml']}
Plug 'jiangmiao/auto-pairs'
Plug 'majutsushi/tagbar'
Plug 'tyru/open-browser.vim'
Plug 'will133/vim-dirdiff'
Plug 'editorconfig/editorconfig-vim'
Plug 'brooth/far.vim'
Plug 'jremmen/vim-ripgrep'
" Wipe and delete buffers
Plug 'jbranchaud/vim-bdubs'

Plug 'w0rp/ale'
Plug 'Shougo/unite.vim'
Plug 'valloric/youcompleteme'
Plug 'ervandew/supertab'

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
Plug 'davidoc/taskpaper.vim', {'for': 'taskpaper'}

Plug 'ntpeters/vim-better-whitespace'
Plug 'yggdroot/indentline'

Plug 'bluz71/vim-moonfly-colors'
Plug 'bluz71/vim-moonfly-statusline'

call plug#end()

filetype plugin indent on

syntax on

" Theme
" moonfly
colorscheme moonfly

" spell language
set spelllang=de

" guifont
set guifont=Fira\ Code:h12.00
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

set enc=utf-8
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
" highlight search results
set hlsearch
set ignorecase
set smartcase
set incsearch
set ruler
set wildmenu
set wildmode=list:longest
set foldmethod=indent
set foldlevel=99
set conceallevel=0
set completeopt-=preview

" use 4 spaces for indentation
set tabstop=4
set softtabstop=0
set shiftwidth=4
" the same indent as the line you're currently on
set autoindent
set noexpandtab
" sets a marker at char position of line
set colorcolumn=121

:command! -range=% -nargs=0 Tab2Space execute '<line1>,<line2>s#^\t\+#\=repeat(" ", len(submatch(0))*' . &ts . ')'
:command! -range=% -nargs=0 Space2Tab execute '<line1>,<line2>s#^\( \{'.&ts.'\}\)\+#\=repeat("\t", len(submatch(0))/' . &ts . ')'

" let makros start with a ,
let maplocalleader = ','
let mapleader = ','

" Because I often accidentally :W when I mean to :w.
command! W w
command! Q q

" format html
command! Tidy !tidy -mi -xml -wrap 0 %

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
autocmd BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
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

" easier split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" netrw
let g:netrw_preview   = 1
let g:netrw_liststyle = 3
let g:netrw_list_hide = '\.padawan,\.DS_Store,\.tern-port,\.idea,tags'
let g:netrw_winsize   = 30
nmap - :Explore<cr>
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'

"unimpaired-vim for german keyboard
nmap < [
nmap > ]
omap < [
omap > ]
xmap < [
xmap > ]

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

" igoring while vimgrepping
set wildignore+=**/cache/**
set wildignore+=**/node_modules/**
set wildignore+=**/bower_components/**
set wildignore+=**/vendor/**
set wildignore+=**/Codeception/**
set wildignore+=**/coverage/**
set wildignore+=**/build/**

" for recursive searching
set path+=**

"fzf
nmap <localleader>ff :GFiles<cr>
nmap <localleader>fb :Buffers<cr>
nmap <localleader>fg :Commits<cr>
nmap <localleader>fc :Commands<cr>
nmap <localleader>fh :Helptags<cr>
nmap <localleader>fl :Lines<cr>
nmap <localleader>hc :helpclose<cr>

"xml format
nmap <localleader>x :silent %!xmllint --format -<cr>

" to set working directory to the directory of the file being edited
nnoremap <localleader>cd :cd %:p:h<CR>

" Show line numbers
set number
highlight LineNr term=bold cterm=NONE ctermfg=Grey ctermbg=NONE gui=NONE guifg=Grey guibg=NONE

" highlight conflicts
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

"Tagbar
nmap <F8> :TagbarOpenAutoClose<CR>


" WhiteSpace
nmap <localleader>st :StripWhitespace<CR>

" ale
let g:ale_php_phpcs_standard = 'AgendaPhpCs'
