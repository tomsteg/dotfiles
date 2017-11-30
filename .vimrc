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
Plug 'IN3D/vim-raml'
Plug 'StanAngeloff/php.vim', {'for': 'php'}
Plug 'airblade/vim-gitgutter'
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
Plug 'godlygeek/tabular'
Plug 'hail2u/vim-css3-syntax', {'for': ['css', 'scss', 'less']}
Plug 'jelera/vim-javascript-syntax', {'for': ['js', 'typescript']}
Plug 'jiangmiao/auto-pairs'
Plug 'joonty/vdebug', {'for': 'php'}
Plug 'joonty/vim-phpunitqf'
Plug 'jremmen/vim-ripgrep'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'leafgarland/typescript-vim', {'for': 'typescript'}
Plug 'majutsushi/tagbar'
Plug 'martinda/Jenkinsfile-vim-syntax'
Plug 'mattn/emmet-vim'
Plug 'mhinz/vim-grepper'
Plug 'mileszs/ack.vim'
Plug 'milkypostman/vim-togglelist'
Plug 'mxw/vim-jsx'
Plug 'ntpeters/vim-better-whitespace'
Plug 'othree/javascript-libraries-syntax.vim', {'for': ['js', 'typescript']}
Plug 'pangloss/vim-javascript', {'for': ['js', 'typescript']}
Plug 'rhysd/clever-f.vim'
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

let g:vim_json_syntax_conceal = 0

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

" WhiteSpace
nmap <localleader>st :StripWhitespace<CR>

" ale
let g:ale_php_phpcs_standard = 'AgendaPhpCs'
let g:ale_php_phpmd_ruleset = '~/Websites/AgendaPhpMd/phpmd-rules.xml'
let g:ale_linters = {
\   'javascript': ['eslint'],
\}

