"
"| |_ ___  _ __ ___  ___| |_ ___  __ _
"| __/ _ \| '_ ` _ \/ __| __/ _ \/ _` |
"| || (_) | | | | | \__ \ ||  __/ (_| |
" \__\___/|_| |_| |_|___/\__\___|\__, |
"                                |___/
"                       _                              __ _
" _ __   ___  _____   _(_)_ __ ___     ___ ___  _ __  / _(_) __ _
"| '_ \ / _ \/ _ \ \ / / | '_ ` _ \   / __/ _ \| '_ \| |_| |/ _` |
"| | | |  __/ (_) \ V /| | | | | | | | (_| (_) | | | |  _| | (_| |
"|_| |_|\___|\___/ \_/ |_|_| |_| |_|  \___\___/|_| |_|_| |_|\__, |
"                                                           |___/

call plug#begin('~/.config/nvim/plugged')

Plug 'IN3D/vim-raml'
Plug 'Shougo/denite.nvim'
Plug 'Shougo/echodoc.vim'
Plug 'Shougo/neoinclude.vim'
Plug 'Shougo/neomru.vim'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/vimproc', { 'do': 'make' }
Plug 'StanAngeloff/php.vim', {'for': 'php'}
Plug 'airblade/vim-gitgutter'
Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }
Plug 'bluz71/vim-moonfly-colors'
Plug 'bluz71/vim-moonfly-statusline'
Plug 'brooth/far.vim'
Plug 'cakebaker/scss-syntax.vim', {'for': 'scss'}
Plug 'claco/jasmine.vim'
Plug 'davidoc/taskpaper.vim', {'for': 'taskpaper'}
Plug 'docunext/closetag.vim', {'for': ['html', 'xml']}
Plug 'editorconfig/editorconfig-vim'
Plug 'ekalinin/Dockerfile.vim'
Plug 'elzr/vim-json', {'for': 'json'}
Plug 'ervandew/supertab'
Plug 'evidens/vim-twig', {'for': 'twig'}
Plug 'fadein/vim-FIGlet'
Plug 'godlygeek/tabular'
Plug 'hail2u/vim-css3-syntax', {'for': ['css', 'scss', 'less']}
Plug 'jbranchaud/vim-bdubs' " Wipe and delete buffers
Plug 'jelera/vim-javascript-syntax', {'for': ['js', 'typescript']}
Plug 'jiangmiao/auto-pairs'
Plug 'joonty/vim-phpunitqf'
Plug 'joonty/vdebug', {'for': 'php'}
Plug 'jremmen/vim-ripgrep'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'leafgarland/typescript-vim', {'for': 'typescript'}
Plug 'lervag/vimtex'
Plug 'majutsushi/tagbar'
Plug 'martinda/Jenkinsfile-vim-syntax'
Plug 'mattn/emmet-vim'
Plug 'merlinrebrovic/focus.vim'
Plug 'mhinz/vim-grepper'
Plug 'mileszs/ack.vim'
Plug 'milkypostman/vim-togglelist'
Plug 'mxw/vim-jsx'
Plug 'ntpeters/vim-better-whitespace'
Plug 'othree/javascript-libraries-syntax.vim', {'for': ['js', 'typescript']}
Plug 'pangloss/vim-javascript', {'for': ['js', 'typescript']}
Plug 'rhysd/clever-f.vim'
" Plug 'roxma/nvim-cm-php-language-server',  {'do': 'composer install && composer run-script parse-stubs'}
Plug 'roxma/nvim-completion-manager'
Plug 'rizzatti/dash.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'ternjs/tern_for_vim', {'do': 'npm install'}
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'tweekmonster/fzf-filemru'
Plug 'tyru/open-browser.vim'
Plug 'vimwiki/vimwiki'
Plug 'w0rp/ale'
Plug 'will133/vim-dirdiff'
Plug 'yggdroot/indentline'

call plug#end()

filetype plugin indent on

" Enable syntax highlighting
syntax on

colorscheme moonfly

" spell language German
set spelllang=de

" list; toggle via unimpaired.vim and <ol and >ol
set listchars=tab:→\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
set showbreak=↪

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
set number
set rnu
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
set conceallevel=0

set undodir=~/.config/nvim/undodir

" :Tab2Space converts tabs to spaces
:command! -range=% -nargs=0 Tab2Space execute '<line1>,<line2>s#^\t\+#\=repeat(" ", len(submatch(0))*' . &ts . ')'
" :Space2Tab converts spaces to tabs
:command! -range=% -nargs=0 Space2Tab execute '<line1>,<line2>s#^\( \{'.&ts.'\}\)\+#\=repeat("\t", len(submatch(0))/' . &ts . ')'

" let makros start with a ,
let maplocalleader = ','
let mapleader = ','

"kind of a double cursor
nnoremap c* *Ncgn
" afterward n. is replacing again

" Because I often accidentally :W when I mean to :w.
command! W w
command! Q q

" execute a shell command on a line in buffer
noremap Q !!$SHELL<cr>

" format html
command! Tidy !tidy -mi -xml -wrap 0 %

" format json
nmap <localleader>jf :%!python -m json.tool<cr>
au FileType json setlocal equalprg=python\ -m\ json.tool
" do not hide \" in json files
let g:vim_json_syntax_conceal = 0

" easy editing neovim settings
map <leader>iv :e ~/dotfiles/config/nvim/init.vim<cr>
map <leader>iv! :e! ~/dotfiles/config/nvim/init.vim<cr>
map <leader>is :source ~/.config/nvim/init.vim<cr>

" exit from terminal mode
:tnoremap <Esc> <C-\><C-n>

" change working directory to the file being edited
nnoremap <localleader>cd :cd %:p:h<CR>

" insert datetimestamp when typing dts
iab <expr> dts strftime("%c")

" convert windows line endings
map <leader>le :%s/$//

"html
autocmd BufRead,BufNewFile *.phtml set filetype=html
autocmd BufRead,BufNewFile *.phtml set syntax=html
autocmd BufRead,BufNewFile *.tpl set filetype=html
autocmd BufRead,BufNewFile *.tpl set syntax=html
autocmd BufRead,BufNewFile *.twig set filetype=html
autocmd BufRead,BufNewFile *.twig set syntax=html

"Markdown
autocmd BufNewFile,BufFilePre,BufRead,BufWritePost *.md set filetype=markdown

"vimwiki
let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]
" tab in vimwiki for next links collides with supertab in markdown files
let g:vimwiki_table_mappings = 0
let g:vimwiki_conceallevel = 0
noremap <Leader>wn <Plug>VimwikiNextLink
" remaps C-Space , which is needed in tmux
map <Leader>wl <Plug>VimwikiToggleListItem
nmap wh <Plug>VimwikiRemoveHeaderLevel

" write locked files
cmap w!! w !sudo tee % >/dev/null

" Fugitive
" deleting fugitive buffers
autocmd BufReadPost fugitive://* set bufhidden=delete

"open browser
let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)
"let g:openbrowser_default_search = 'duckduckgo'
let g:openbrowser_default_search = 'google'

" show line numbers in netrw
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'

" Dash
nmap <silent> <leader>d <Plug>DashSearch

" clever-f
let g:clever_f_across_no_line = 1
let g:clever_f_timeout_ms = 3000

" easier split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

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

"use ag in ack.vim
if executable('ag')
"  let g:ackprg = 'ag --vimgrep --nogroup --nocolor --column'
endif
if executable('rg')
  let g:ackprg = 'rg --vimgrep'
endif
nnoremap <Leader>a :Ack!<Space>

" igoring while vimgrepping
set wildignore+=*/cache/*
set wildignore+=*/node_modules/*
set wildignore+=*/bower_components/*
set wildignore+=*/vendor/*
set wildignore+=*/Codeception/*
set wildignore+=*/coverage/*
set wildignore+=*/build/*
set wildignore+=*.sql

" for recursive searching
set path+=**

"fzf
nmap <localleader>fi :Files<cr>
nmap <localleader>fm :FilesMru<cr>
nmap <localleader>ff :GFiles<cr>
nmap <localleader>ft :Tags<cr>
nmap <localleader>fb :Buffers<cr>
nmap <localleader>fg :Commits<cr>
nmap <localleader>fc :Commands<cr>
nmap <localleader>fh :Helptags<cr>
nmap <localleader>fl :Lines<cr>
nmap <localleader>hc :helpclose<cr>
" Files command with preview window
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview('right:50%:hidden', '?'), <bang>0)

" vim-grepper
runtime autoload/grepper.vim
let g:grepper = { 'next_tool': '<leader>g' }
let g:grepper.jump = 1
let g:grepper.stop = 500
nnoremap <leader>g :Grepper<cr>
nnoremap <leader>gg :Grepper -tool git<cr>
nnoremap <leader>ga :Grepper -tool ag<cr>
nnoremap <leader>gs :Grepper -tool rg -side<cr>
noremap <leader>gr :Grepper -tool rg<cr>
nnoremap <leader>* :Grepper -tool rg -cword -noprompt<cr>
let g:grepper.next_tool = '<leader>g'
let g:grepper.tools = ['rg', 'git', 'ag', 'grep']

"xml format
nmap <localleader>x :silent %!xmllint --format -<cr>

" highlight conflicts
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

"Tagbar
nmap <localleader>r :TagbarOpenAutoClose<CR>

" SuperTab
let g:SuperTabDefaultCompletionType = "<c-n>"
" close the preview window when you're not using it
let g:SuperTabClosePreviewOnPopupClose = 1

" Allow JSX in normal JS files
let g:jsx_ext_required = 0 

" tern
let g:tern_show_argument_hints = 'on_move'
let g:tern_request_timeout = 1
let g:tern_show_signature_in_pum = '1'  " This do disable full signature type on autocomplete
" Use tern_for_vim.
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]
let tern#is_schow_argument_hints_enabled = 1

" neosnippet
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
" custom snippet dir
let g:neosnippet#snippets_directory = '~/dotfiles/config/nvim/snippets/'

if !exists('g:deoplete#omni_patterns')
    let g:deoplete#omni_patterns = {}
endif
let g:deoplete#omni_patterns.tex =
            \ '\v\\%('
            \ . '\a*cite\a*%(\s*\[[^]]*\]){0,2}\s*\{[^}]*'
            \ . '|\a*ref%(\s*\{[^}]*|range\s*\{[^,}]*%(}\{)?)'
            \ . '|hyperref\s*\[[^]]*'
            \ . '|includegraphics\*?%(\s*\[[^]]*\]){0,2}\s*\{[^}]*'
            \ . '|%(include%(only)?|input)\s*\{[^}]*'
            \ . ')\m'

" WhiteSpace
nmap <localleader>st :StripWhitespace<CR>

" ale
let g:ale_php_phpcs_standard = 'AgendaPhpCs'
let g:ale_php_phpmd_ruleset = '~/Websites/AgendaPhpMd/phpmd-rules.xml'
let g:ale_linters = {
\   'javascript': ['eslint'],
\}

" LanguageClient-neovim {{{
" Don't need to automake in supported languages
augroup automake
  autocmd!
  " lint via language servers
  autocmd BufWritePost *.sh,*.scss,*.css make!
augroup END

" Automatically start language servers.
let g:LanguageClient_autoStart = 1

" Use location list instead of quickfix
let g:LanguageClient_diagnosticsList = 'location'

augroup LanguageClientConfig
  autocmd!

  " <leader>ld to go to definition
  autocmd FileType javascript,python,php,typescript,json,css,scss,html nnoremap <buffer> <leader>ld :call LanguageClient_textDocument_definition()<cr>
  " <leader>lf to autoformat document
  autocmd FileType javascript,python,php,typescript,json,css,scss,html nnoremap <buffer> <leader>lf :call LanguageClient_textDocument_formatting()<cr>
  " <leader>lh for type info under cursor
  autocmd FileType javascript,python,php,typescript,json,css,scss,html nnoremap <buffer> <leader>lh :call LanguageClient_textDocument_hover()<cr>
  " <leader>lr to rename variable under cursor
  autocmd FileType javascript,python,php,typescript,json,css,scss,html nnoremap <buffer> <leader>lr :call LanguageClient_textDocument_rename()<cr>
  " <leader>lc to switch omnifunc to LanguageClient
  autocmd FileType javascript,python,php,typescript,json,css,scss,html nnoremap <buffer> <leader>lc :setlocal omnifunc=LanguageClient#complete<cr>
  " <leader>ls to fuzzy find the symbols in the current document
  autocmd FileType javascript,python,php,typescript,json,css,scss,html nnoremap <buffer> <leader>ls :call LanguageClient_textDocument_documentSymbol()<cr>

  " Use as omnifunc by default
  autocmd FileType javascript,python,php,typescript,json,css,scss,html setlocal omnifunc=LanguageClient#complete
augroup END

let g:LanguageClient_serverCommands = {}

if executable('pyls')
  let g:LanguageClient_serverCommands.python = ['pyls']
endif

if executable('javascript-typescript-stdio')
  let g:LanguageClient_serverCommands.javascript = ['javascript-typescript-stdio']
  let g:LanguageClient_serverCommands.typescript = ['javascript-typescript-stdio']
  let g:LanguageClient_serverCommands.html = ['html-languageserver', '--stdio']
  let g:LanguageClient_serverCommands.css = ['css-languageserver', '--stdio']
  let g:LanguageClient_serverCommands.less = ['css-languageserver', '--stdio']
  let g:LanguageClient_serverCommands.json = ['json-languageserver', '--stdio']
endif
" }}}

" nvim-completion-manager {{{
" Use fuzzy matching
let g:cm_matcher = {'case': 'smartcase', 'module': 'cm_matchers.fuzzy_matcher'}
" }}}
