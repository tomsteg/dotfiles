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

" spell language German
set spelllang=de
set mouse=a

" list; toggle via unimpaired.vim and <ol and >ol
set listchars=tab:→\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
set showbreak=↪

set linebreak
set linespace=2
set autoread
set clipboard=unnamed
set laststatus=2
" Fix backspace not deleting tabs, also make delimiteMate work
set backspace=indent,eol,start
" show matching braces
set showmatch
set showmode
set showcmd
" highlight search results
set hlsearch
" case insensitive searching
set ignorecase
" case sensitive searching when pattern contains a capital letter
set smartcase
" incremental search like modern browsers
set incsearch
" show results of substition as they're happening
set inccommand=split
set ruler
" show line numbers
set number
" Show the line number relative to the line with the cursor in front of each line.
set relativenumber
" enhanced command line completion
set wildmenu
" complete files like a shell
set wildmode=list:longest
" lines of text around a cursor
set scrolloff=3

" code folging settings
set foldmethod=syntax
set foldlevelstart=99
set nofoldenable " don't fold by default
set conceallevel=0

" use 4 spaces for indentation
set tabstop=4
set softtabstop=0
set shiftwidth=4
" the same indent as the line you're currently on
set smartindent
set noexpandtab

" Load vim-plug
if empty(glob("~/.config/nvim/autoload/plug.vim"))
    execute '!curl -fLo ~/.config/nvim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif
call plug#begin('~/.config/nvim/plugged')

Plug 'HerringtonDarkholme/yats.vim'
Plug 'IN3D/vim-raml'
Plug 'Lokaltog/vim-distinguished'
Plug 'Raimondi/delimitMate'
Plug 'Rican7/php-doc-modded', {'for': 'php'}
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neoinclude.vim'
Plug 'Shougo/neopairs.vim'
Plug 'StanAngeloff/php.vim', {'for': 'php'}
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'aquach/vim-http-client'
Plug 'brooth/far.vim'
Plug 'cakebaker/scss-syntax.vim', {'for': 'scss'}
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'davidoc/taskpaper.vim', {'for': 'taskpaper'}
Plug 'docunext/closetag.vim', {'for': ['html', 'xml', 'vue']}
Plug 'editorconfig/editorconfig-vim'
Plug 'ekalinin/Dockerfile.vim'
Plug 'elzr/vim-json', {'for': 'json'}
Plug 'evidens/vim-twig', {'for': 'twig'}
Plug 'fadein/vim-FIGlet'
Plug 'godlygeek/tabular'
Plug 'hail2u/vim-css3-syntax', {'for': ['css', 'scss', 'less']}
Plug 'joonty/vdebug', {'for': 'php'}
Plug 'jremmen/vim-ripgrep'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'lervag/vimtex', {'for': 'tex'}
Plug 'majutsushi/tagbar'
Plug 'martinda/Jenkinsfile-vim-syntax'
Plug 'mattn/emmet-vim'
Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
Plug 'mhartington/oceanic-next'
Plug 'mhinz/vim-grepper'
Plug 'mhinz/vim-signify'
Plug 'milkypostman/vim-togglelist'
Plug 'ntpeters/vim-better-whitespace'
Plug 'othree/html5.vim', {'for': ['html']}
Plug 'othree/javascript-libraries-syntax.vim', {'for': ['js', 'typescript']}
Plug 'othree/yajs.vim', {'for': ['js', 'typescript']}
Plug 'posva/vim-vue'
Plug 'reedes/vim-pencil'
Plug 'rhysd/clever-f.vim'
Plug 'rizzatti/dash.vim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/LanguageServer-php-neovim',  {'do': 'composer install && composer run-script parse-stubs'}
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'stephpy/vim-yaml'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'tweekmonster/fzf-filemru'
Plug 'tyru/open-browser.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vimwiki/vimwiki'
Plug 'wavded/vim-stylus'
Plug 'will133/vim-dirdiff'
Plug 'w0rp/ale'

Plug 'ryanoasis/vim-devicons'

call plug#end()

filetype plugin indent on

" Enable syntax highlighting
syntax on
"colorscheme GRB256
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1
let g:airline_theme='oceanicnext'
colorscheme OceanicNext

set cursorline

if isdirectory('~/.config/nvim/undodir')
	:silent !mkdir -p ~/.config/nvim/undodir >/dev/null
endif
set undodir=~/.config/nvim/undodir
set undofile

" :Tab2Space converts tabs to spaces
:command! -range=% -nargs=0 Tab2Space execute '<line1>,<line2>s#^\t\+#\=repeat(" ", len(submatch(0))*' . &ts . ')'
" :Space2Tab converts spaces to tabs
:command! -range=% -nargs=0 Space2Tab execute '<line1>,<line2>s#^\( \{'.&ts.'\}\)\+#\=repeat("\t", len(submatch(0))/' . &ts . ')'

" let makros start with a ,
let maplocalleader = ','
let mapleader = ','

"Jump back to last edited buffer
nnoremap gz <C-^>
" the <C-^> is difficult, because on Vortex Pok3r ^ is Alt-Shift-6

"kind of a double cursor
nnoremap c* *Ncgn
" afterward n. is replacing again

" execute a shell command on a line in buffer
noremap Q !!$SHELL<cr>

" format html
command! Tidy !tidy -mi -xml -wrap 0 %

" format json
nmap <localleader>jf :%!python -m json.tool<cr>
au FileType json setlocal equalprg=python\ -m\ json.tool
" do not hide \" in json files
let g:vim_json_syntax_conceal=0

" format xml
nmap <localleader>x :silent %!xmllint --format -<cr>

" emmet specials
let g:user_emmet_mode = 'i'
let g:user_emmet_install_global = 0
autocmd FileType html,css,scss,js,vue EmmetInstall

" easy editing neovim settings
map <leader>iv :e ~/dotfiles/config/nvim/init.vim<cr>
map <leader>iv! :e! ~/dotfiles/config/nvim/init.vim<cr>
map <leader>is :source ~/.config/nvim/init.vim<cr>

if has('nvim')
	" exit from terminal mode
	tnoremap <Esc> <C-\><C-n>
	tnoremap <C-v><Esc> <Esc>
	" prevent nvim inside of terminal as a nested nvim
	if executable('nvr')
		let $VISUAL = "nvr -cc split --remote-wait +'set bufhidden=wipe'"
	endif
endif

" change working directory to the file being edited
nnoremap <localleader>cd :cd %:p:h<CR>

" insert datetimestamp when typing dts
iab <expr> dts strftime("%c")

" convert windows line endings
map <leader>le :%s/<C-v><C-m>$//<CR>

" editorconfig
let g:EditorConfig_exec_path = '/usr/local/bin/editorconfig'
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

"html
autocmd BufRead,BufNewFile *.phtml set filetype=html
autocmd BufRead,BufNewFile *.phtml set syntax=html
autocmd BufRead,BufNewFile *.tpl set filetype=html
autocmd BufRead,BufNewFile *.tpl set syntax=html
autocmd BufRead,BufNewFile *.twig set filetype=html
autocmd BufRead,BufNewFile *.twig set syntax=html

"Markdown
autocmd BufNewFile,BufFilePre,BufRead,BufWritePost *.md set filetype=markdown
autocmd BufNewFile,BufFilePre,BufRead,BufWritePost *.txt set filetype=markdown
nmap <localleader>md :%!md2html
let g:markdown_syntax_conceal = 0

"nerdtree
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowLineNumbers=1
let NERDTreeHijackNetrw=0
let NERDTreeWinSize=50

"vimwiki
let g:vimwiki_list = [{'path': '~/vimwiki/', 'diary_rel_path': '../Documents/Privat/diary', 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_table_mappings=0
let g:vimwiki_conceallevel=0
let s:vimwiki_autowriteall=1
" remaps C-Space , which is needed in tmux
map <leader>wl <Plug>VimwikiToggleListItem
map <leader>wh <Plug>VimwikiRemoveHeaderLevel

" write locked files
cmap w!! w !sudo tee % >/dev/null

" Fugitive
" deleting fugitive buffers
autocmd BufReadPost fugitive://* set bufhidden=delete
autocmd FileType gitcommit set foldmethod=syntax
command! Ggp Gpush

"open browser
let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)
let g:openbrowser_default_search = 'duckduckgo'
"let g:openbrowser_default_search = 'google'

" show line numbers in netrw
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'

" Dash
nmap <silent> <leader>dd <Plug>DashSearch

" clever-f
let g:clever_f_across_no_line = 1
let g:clever_f_timeout_ms = 3000

" easier split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" unimpaired-vim for german keyboard
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
nmap gs  <plug>(GrepperOperator)
xmap gs  <plug>(GrepperOperator)
runtime autoload/grepper.vim
let g:grepper = { 'next_tool': '<leader>g' }
let g:grepper.dir='repo,cwd,file'
let g:grepper.highlight = 1
let g:grepper.stop = 500
nnoremap <leader>g :Grepper<cr>
nnoremap <leader>gg :Grepper -tool git<cr>
nnoremap <leader>ga :Grepper -tool ag<cr>
nnoremap <leader>gs :Grepper -tool rg -side<cr>
nnoremap <leader>gr :Grepper -tool rg<cr>
nnoremap <leader>* :Grepper -tool rg -cword -noprompt<cr>
let g:grepper.tools = ['rg', 'git', 'ag', 'grep']

" deoplete
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option({
\ 'auto_complete_delay': 200,
\ 'smart_case': v:true,
\ })
inoremap <silent><expr> <TAB>
\ pumvisible() ? "\<C-n>" :
\ <SID>check_back_space() ? "\<TAB>" :
\ deoplete#mappings#manual_complete()
function! s:check_back_space() abort "{{{
let col = col('.') - 1
return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}

" LanguageClient
let g:LanguageClient_serverCommands = {
\ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
\ 'vue': ['vls'],
\ }
nnoremap <F5> :call LanguageClient_contextMenu()<CR>
nnoremap <leader>ld :call LanguageClient#textDocument_definition()<CR>
nnoremap <leader>lr :call LanguageClient#textDocument_rename()<CR>
nnoremap <leader>lf :call LanguageClient#textDocument_formatting()<CR>
nnoremap <leader>lt :call LanguageClient#textDocument_typeDefinition()<CR>
nnoremap <leader>lx :call LanguageClient#textDocument_references()<CR>
nnoremap <leader>la :call LanguageClient_workspace_applyEdit()<CR>
nnoremap <leader>lc :call LanguageClient#textDocument_completion()<CR>
nnoremap <leader>lh :call LanguageClient#textDocument_hover()<CR>
nnoremap <leader>ls :call LanguageClient_textDocument_documentSymbol()<CR>
nnoremap <leader>lm :call LanguageClient_contextMenu()<CR>

" highlight conflicts
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

"Tagbar
nmap <localleader>r :TagbarOpenAutoClose<CR>

"neopairs
let g:neopairs#enable = 1

"delimitMate
let g:delimitMate_expand_cr = 2

" ale linting
let g:ale_linters = {
	\ 'javascript': ['eslint'],
	\ 'php': ['php', 'phpcs', 'phpmd'],
	\}
let g:ale_php_phpcs_standard='~/Websites/AgendaPhpCs/'
let g:ale_php_phpmd_ruleset='~/Websites/AgendaPhpMd/phpmd-rules.xml'

autocmd BufRead,BufNewFile *.vue syntax sync fromstart

" format current php buffer with <C-s>
command! -nargs=1 Silent execute ':silent !'.<q-args> | execute ':redraw!'
map <c-s> <esc>:w<cr>:Silent php-cs-fixer fix %:p --level=symfony<cr>

" php-doc-modded
inoremap <leader>db <ESC>:call PhpDocSingle()<CR>i
nnoremap <leader>db :call PhpDocSingle()<CR>
vnoremap <leader>db :call PhpDocRange()<CR>
let g:pdv_cfg_autoEndFunction = 0
let g:pdv_cfg_autoEndClass = 0
let g:pdv_cfg_annotation_Package = 0
let g:pdv_cfg_annotation_Version = 0
let g:pdv_cfg_Author = 'Thomas Steglich'
let g:pdv_cfg_annotation_Copyright = 0
let g:pdv_cfg_annotation_License = 0
" @see http://kushellig.de/vim-automatic-phpdoc/#update-phpdoc-function
nnoremap <leader>du :call UpdatePhpDocIfExists()<CR>
function! UpdatePhpDocIfExists()
    normal! k
    if getline('.') =~ '/'
        normal! V%d
    else
        normal! j
    endif
    call PhpDocSingle()
    normal! k^%k$
    if getline('.') =~ ';'
        exe "normal! $svoid"
    endif
endfunction

" tern
let g:tern_show_argument_hints = 'on_move'

" http client
let g:http_client_verify_ssl=0

" WhiteSpace
nmap <localleader>st :StripWhitespace<CR>

" Plugins need to be added to runtimepath before helptags can be generated.
packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL
