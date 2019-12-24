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

" disable modelines in any files
set modelines=0

" list; toggle via unimpaired.vim and <ol and >ol
set listchars=tab:→\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
set list
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

" coc specific settings
" if hidden is not set, TextEdit might fail.
set hidden
" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes
set iskeyword=$,@,48-57,_,192-255

" Load vim-plug
if empty(glob("~/.config/nvim/autoload/plug.vim"))
    execute '!curl -fLo ~/.config/nvim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif
call plug#begin('~/.config/nvim/plugged')

Plug 'HerringtonDarkholme/yats.vim'
Plug 'IN3D/vim-raml'
Plug 'Lokaltog/vim-distinguished'
Plug 'StanAngeloff/php.vim', {'for': 'php'}
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'aquach/vim-http-client'
Plug 'brooth/far.vim'
Plug 'cakebaker/scss-syntax.vim', {'for': 'scss'}
Plug 'davidoc/taskpaper.vim', {'for': 'taskpaper'}
Plug 'editorconfig/editorconfig-vim'
Plug 'ekalinin/Dockerfile.vim'
Plug 'elzr/vim-json', {'for': 'json'}
Plug 'evidens/vim-twig', {'for': 'twig'}
Plug 'fadein/vim-FIGlet'
Plug 'godlygeek/tabular'
Plug 'hail2u/vim-css3-syntax', {'for': ['css', 'scss', 'less']}
Plug 'joonty/vdebug', {'for': 'php'}
Plug 'joshdick/onedark.vim'
Plug 'jremmen/vim-ripgrep'
Plug 'junegunn/goyo.vim'
Plug 'kkoomen/vim-doge'
Plug 'lervag/vimtex', {'for': 'tex'}
Plug 'martinda/Jenkinsfile-vim-syntax'
Plug 'mattn/emmet-vim'
Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
Plug 'mhinz/vim-grepper'
Plug 'mhinz/vim-signify'
Plug 'milkypostman/vim-togglelist'
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
Plug 'ntpeters/vim-better-whitespace'
Plug 'posva/vim-vue'
Plug 'reedes/vim-pencil'
Plug 'rhysd/clever-f.vim'
Plug 'rizzatti/dash.vim'
Plug 'roxma/nvim-yarp'
Plug 'scrooloose/nerdcommenter'
Plug 'stephpy/vim-yaml'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'tyru/open-browser.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vimwiki/vimwiki'
Plug 'wavded/vim-stylus'
Plug 'will133/vim-dirdiff'

Plug 'ryanoasis/vim-devicons'

call plug#end()

filetype plugin indent on

" Enable syntax highlighting
syntax on
colorscheme onedark

set cursorline
hi CursorLine cterm=underline ctermbg=none

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
autocmd FileType html,phtml,twig,tpl,css,scss,js,vue EmmetInstall

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
let g:markdown_syntax_conceal = 0

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

" LeaderF
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_ShortcutF = "<leader>ff"
noremap <leader>fb :Leaderf buffer<CR>
noremap <leader>fm :Leaderf mru<CR>
noremap <leader>fh :Leaderf help<CR>
noremap <leader>fo :Leaderf function<CR>

nmap <localleader>hc :helpclose<cr>

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

" editorconfig
let g:EditorConfig_exclude_patterns = ['fugitive://.\*']

"coc

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <cr> for confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap ge :CocCommand explorer<CR>

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" documentation generator
let g:doge_mapping_comment_jump_forward='<C-Tab>'
let g:doge_mapping_comment_jump_backward='<C-S-Tab>'

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" list of extensions
" :CocInstall coc-css coc-json coc-pairs coc-tag coc-tsserver coc-html

" highlight conflicts
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

"Tagbar
"nmap <localleader>r :TagbarOpenAutoClose<CR>

autocmd BufRead,BufNewFile *.vue syntax sync fromstart

" tern
let g:tern_show_argument_hints = 'on_move'

" http client
let g:http_client_verify_ssl=0

" WhiteSpace
nmap <localleader>st :StripWhitespace<CR>

" airline
let g:airline_theme='onedark'
let g:airline#extensions#whitespace#enabled = 0
let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'

" Plugins need to be added to runtimepath before helptags can be generated.
packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL
