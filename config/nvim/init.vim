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

" Load vim-plug
if empty(glob("~/.config/nvim/autoload/plug.vim"))
    execute '!curl -fLo ~/.config/nvim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif
call plug#begin('~/.config/nvim/plugged')

Plug 'IN3D/vim-raml'
Plug 'Lokaltog/vim-distinguished'
Plug 'Raimondi/delimitMate'
Plug 'Rican7/php-doc-modded', {'for': 'php'}
Plug 'Shougo/neopairs.vim'
Plug 'StanAngeloff/php.vim', {'for': 'php'}
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'adoy/vim-php-refactoring-toolbox', {'for': 'php'}
Plug 'airblade/vim-gitgutter'
Plug 'aquach/vim-http-client'
Plug 'brooth/far.vim'
Plug 'cakebaker/scss-syntax.vim', {'for': 'scss'}
Plug 'davidoc/taskpaper.vim', {'for': 'taskpaper'}
Plug 'docunext/closetag.vim', {'for': ['html', 'xml', 'vue']}
Plug 'editorconfig/editorconfig-vim'
Plug 'ekalinin/Dockerfile.vim'
Plug 'elzr/vim-json', {'for': 'json'}
Plug 'evidens/vim-twig', {'for': 'twig'}
Plug 'fadein/vim-FIGlet'
Plug 'flazz/vim-colorschemes'
Plug 'godlygeek/tabular'
Plug 'hail2u/vim-css3-syntax', {'for': ['css', 'scss', 'less']}
Plug 'itchyny/lightline.vim'
Plug 'othree/yajs.vim', {'for': ['js', 'typescript']}
Plug 'joonty/vdebug', {'for': 'php'}
Plug 'jremmen/vim-ripgrep'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'lervag/vimtex', {'for': 'tex'}
Plug 'majutsushi/tagbar'
Plug 'martinda/Jenkinsfile-vim-syntax'
Plug 'mattn/emmet-vim'
Plug 'mhinz/vim-grepper'
Plug 'milkypostman/vim-togglelist'
Plug 'ncm2/ncm2'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-tern',  {'do': 'npm install'}
Plug 'ntpeters/vim-better-whitespace'
Plug 'othree/html5.vim', {'for': ['html']}
Plug 'othree/javascript-libraries-syntax.vim', {'for': ['js', 'typescript']}
Plug 'phpactor/ncm2-phpactor'
Plug 'phpactor/phpactor', {'do': 'composer install', 'for': 'php'}
Plug 'posva/vim-vue'
Plug 'reedes/vim-pencil'
Plug 'rhysd/clever-f.vim'
Plug 'rizzatti/dash.vim'
Plug 'roxma/nvim-yarp'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'ternjs/tern_for_vim', {'do': 'npm install'}
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'tweekmonster/fzf-filemru'
Plug 'tyru/open-browser.vim'
Plug 'vim-python/python-syntax', {'for': ['python', 'python3']}
Plug 'vimwiki/vimwiki'
Plug 'wavded/vim-stylus'
Plug 'will133/vim-dirdiff'
Plug 'w0rp/ale'

call plug#end()

filetype plugin indent on

" Enable syntax highlighting
syntax on
colorscheme GRB256

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
" sets a marker at char position of line
"set colorcolumn=121
set cursorline
hi CursorLine guibg=DarkBlue ctermbg=DarkBlue

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

" nvim completion manager
" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()
" IMPORTANTE: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect
" provide feedback, when something fails to complete
let g:phpactorOmniError = v:true
" Use <TAB> to select the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" highlight conflicts
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

"Tagbar
nmap <localleader>r :TagbarOpenAutoClose<CR>

"neopairs
let g:neopairs#enable = 1

"delimitMate
let g:delimitMate_expand_cr = 2

" phpactor
" Include use statement
nmap <Leader>u :call phpactor#UseAdd()<CR>
" Invoke the context menu
nmap <Leader>mm :call phpactor#ContextMenu()<CR>
" Goto definition of class or class member under the cursor
nmap <Leader>o :call phpactor#GotoDefinition()<CR>
" Transform the classes in the current file
nmap <Leader>pt :call phpactor#Transform()<CR>
" Generate a new class (replacing the current file)
nmap <Leader>nc :call phpactor#ClassNew()<CR>
" Extract method from selection
vmap <silent><Leader>em :<C-U>call phpactor#ExtractMethod()<CR>

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

" php-refactoring-toolbox
let g:vim_php_refactoring_default_property_visibility = 'private'
let g:vim_php_refactoring_default_method_visibility = 'private'
let g:vim_php_refactoring_auto_validate_visibility = 1
let g:vim_php_refactoring_phpdoc = "pdv#DocumentCurrentLine"
let g:vim_php_refactoring_use_default_mapping = 0
nnoremap <leader>rlv :call PhpRenameLocalVariable()<CR>
nnoremap <leader>rcv :call PhpRenameClassVariable()<CR>
nnoremap <leader>rrm :call PhpRenameMethod()<CR>
nnoremap <leader>reu :call PhpExtractUse()<CR>
vnoremap <leader>rec :call PhpExtractConst()<CR>
nnoremap <leader>rep :call PhpExtractClassProperty()<CR>
vnoremap <leader>rem :call PhpExtractMethod()<CR>
nnoremap <leader>rnp :call PhpCreateProperty()<CR>
nnoremap <leader>rdu :call PhpDetectUnusedUseStatements()<CR>

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
" let g:tern_request_timeout = 1
" let g:tern#arguments = ["--persistent"]

" http client
let g:http_client_verify_ssl=0

" WhiteSpace
nmap <localleader>st :StripWhitespace<CR>

" Lightline
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'relativepath', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

" Plugins need to be added to runtimepath before helptags can be generated.
packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL
