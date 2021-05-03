"*****************************************************************************
"" Vim-Plug core
"*****************************************************************************

let vimplug_exists=expand('~/.config/nvim/autoload/plug.vim')
if has('win32')&&!has('win64')
  let curl_exists=expand('C:\Windows\Sysnative\curl.exe')
else
  let curl_exists=expand('curl')
endif

if !filereadable(vimplug_exists)
  if !executable(curl_exists)
    echoerr "You have to install curl or first install vim-plug yourself!"
    execute "q!"
  endif
  echo "Installing Vim-Plug..."
  echo ""
  silent exec "!"curl_exists" -fLo " . shellescape(vimplug_exists) . " --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  let g:not_finish_vimplug = "yes"

  autocmd VimEnter * PlugInstall
endif

"" Required:
call plug#begin(expand('~/.config/nvim/plugged'))

"*****************************************************************************
"" Plug install packages
"*****************************************************************************

"" Visual interface
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'majutsushi/tagbar'
Plug 'vim-scripts/CSApprox'

"" Visual Themes
Plug 'morhetz/gruvbox'

"" Start Page
Plug 'mhinz/vim-startify'

"" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb' " required by fugitive to :Gbrowse

"" Files
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-scripts/grep.vim'
if isdirectory('/usr/local/opt/fzf')
  Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
else
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
  Plug 'junegunn/fzf.vim'
endif
let g:make = 'gmake'
if exists('make')
        let g:make = 'make'
endif
Plug 'Shougo/vimproc.vim', {'do': g:make}

"" Vim-Session
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'

"" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

"" Write assistants
Plug 'Yggdroot/indentLine'
Plug 'Raimondi/delimitMate'
Plug 'RRethy/vim-illuminate'
Plug 'ntpeters/vim-better-whitespace'
Plug 'preservim/nerdcommenter'

"" Code completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"" Code Linter
Plug 'dense-analysis/ale'

"" Templates
Plug 'pgilad/vim-skeletons'

"" Terminal
Plug 'caenrique/nvim-toggle-terminal'

"" Graphical debugger
Plug 'puremourning/vimspector'

"*****************************************************************************
"" Custom bundles
"*****************************************************************************

"" C/C++
Plug 'ludwig/split-manpage.vim'
Plug 'jackguo380/vim-lsp-cxx-highlight'

"" HTML
Plug 'hail2u/vim-css3-syntax'
Plug 'gko/vim-coloresque'
Plug 'tpope/vim-haml'
Plug 'mattn/emmet-vim'

"" TypeScript
Plug 'leafgarland/typescript-vim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'peitalin/vim-jsx-typescript'

"" C#
Plug 'OmniSharp/omnisharp-vim'
Plug 'nickspoons/vim-sharpenup'

"" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

"*****************************************************************************
"*****************************************************************************

"" Include user's extra bundle
if filereadable(expand("~/.config/nvim/local_bundles.vim"))
  source ~/.config/nvim/local_bundles.vim
endif

call plug#end()

" Required:
filetype plugin indent on

"*****************************************************************************
"" Basic Setup
"*****************************************************************************"

set noswapfile " Disable swap files
set nobackup " Disable backups
set nowritebackup " Disable backups

"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

"" Fix backspace indent
set backspace=indent,eol,start

"" Tabs. May be overridden by autocmd rules
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab

"" Map leader to <spacebar>
let mapleader=' '

"" Enable hidden buffers
set hidden

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

set fileformats=unix,dos,mac

if exists('$SHELL')
    set shell=$SHELL
else
    set shell=/bin/sh
endif

"" Start Page
let g:startify_bookmarks = [
          \ { 'v': '~/.config/nvim/init.vim' },
          \ { 'z': '~/.zshrc' },
          \ { 'c': '~/.config/nvim/coc-settings.json' },
          \ { 'o': '~/.omnisharp/omnisharp.json' },
          \ ]

let g:startify_lists = [
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks'] },
          \ { 'type': 'files',     'header': ['   Most recently used files'] },
          \ { 'type': 'dir',       'header': ['   Most recently used files from '. getcwd()] },
          \ { 'type': 'sessions',  'header': ['   Sessions'] },
          \ { 'type': 'commands',  'header': ['   Commands'] },
          \ ]

"" Session management
let g:session_directory = "~/.config/nvim/session"
let g:session_autoload = "no"
let g:session_autosave = "no"
let g:session_command_aliases = 1

"*****************************************************************************
"" Visual Settings
"*****************************************************************************

syntax on

set ruler
set number " Show row numbers
set rnu " Show relative numbers on rows
set numberwidth=1 " Size of row numbers

set signcolumn=yes "Show always the sign column used by Ale or Gitgutter

let no_buffers_menu=1

set mouse=a " Enables the mouse usage
set mousemodel=popup

set t_Co=256
set cursorline
set guioptions=egmrti
set gfn=Monospace\ 10

if (has("termguicolors"))
  set termguicolors
endif

if has("gui_running")
  if has("gui_mac") || has("gui_macvim")
    set guifont=Menlo:h12
    set transparency=7
  endif
else
  let g:CSApprox_loaded = 1

"" IndentLine
  let g:indentLine_enabled = 1
  let g:indentLine_concealcursor = 0
  let g:indentLine_char = '┆'
  let g:indentLine_faster = 1
endif

"" Disable the blinking cursor.
set gcr=a:blinkon0

au TermEnter * setlocal scrolloff=0
au TermLeave * setlocal scrolloff=3

"" Status bar
set laststatus=2

"" Use modeline overrides
set modeline
set modelines=10

set title
set titleold="Terminal"
set titlestring=%F

set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\

"" Search mappings: These will make it so that going to the next one in a
"" Search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

if exists("*fugitive#statusline")
  set statusline+=%{fugitive#statusline()}
endif

"" Visual theme
let g:light_theme = 1

if (g:light_theme)
  set background=light
  let g:gruvbox_contrast_light='hard'
  colorscheme gruvbox
  let g:lsp_cxx_hl_light_bg = 1
else
  set background=dark
  let g:gruvbox_contrast_dark='hard'
  colorscheme gruvbox
  let g:lsp_cxx_hl_light_bg = 0
endif

"" Vim-Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_skip_empty_sections = 1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

if !exists('g:airline_powerline_fonts')
  " no powerline symbols
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = '|'
  let g:airline_left_sep          = '▶'
  let g:airline_left_alt_sep      = '»'
  let g:airline_right_sep         = '◀'
  let g:airline_right_alt_sep     = '«'
  let g:airline#extensions#branch#prefix     = '⤴' "➔, ➥, ⎇
  let g:airline#extensions#readonly#symbol   = '⊘'
  let g:airline#extensions#linecolumn#prefix = '¶'
  let g:airline#extensions#paste#symbol      = 'ρ'
  let g:airline_symbols.linenr    = '␊'
  let g:airline_symbols.branch    = '⎇'
  let g:airline_symbols.paste     = 'ρ'
  let g:airline_symbols.paste     = 'Þ'
  let g:airline_symbols.paste     = '∥'
  let g:airline_symbols.whitespace = 'Ξ'
  let airline#extensions#ale#error_symbol = 'X:'
  let airline#extensions#ale#warning_symbol = '!:'
else
  " powerline symbols
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = '☰'
  let g:airline_symbols.dirty='⚡'
  let g:airline#extensions#tabline#left_sep = ''
  let g:airline#extensions#tabline#left_alt_sep = ''
  let airline#extensions#ale#error_symbol = '❌:'
  let airline#extensions#ale#warning_symbol = '⚠:'
  endif

"call airline#parts#define_accent('ale_error_count', 'yellow') "Disabled due Vim-Airline bug
"call airline#parts#define_accent('ale_warning_count', 'yellow') "Disabled due Vim-Airline bug

"*****************************************************************************
"" Abbreviations
"*****************************************************************************

"" No one is really happy until you have this shortcuts
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

"" NERDTree configuration
let g:NERDTreeChDirMode=2
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 50
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite

let g:NERDTreeIgnore = [
  \'\.rbc$',
  \'\~$',
  \'\.pyc$',
  \'\.db$',
  \'\.sqlite$',
  \'__pycache__',
  \'^node_modules$',
  \'^bin$',
  \'^obj$',
  \'^release$',
  \'^debug$',
  \]

let g:NERDTreeSortOrder = [
  \'^__\.py$',
  \'\/$',
  \'*',
  \'\.swp$',
  \'\.bak$',
  \'\~$',
  \]

"" Grep.vim
nnoremap <silent> <Leader>f :Rgrep<CR>
let Grep_Default_Options = '-IR'
let Grep_Skip_Files = '*.log *.db'
let Grep_Skip_Dirs = '.git node_modules'

"" Fzf.vim
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
let $FZF_DEFAULT_COMMAND =  "find * -path '*/\.*' -prune -o -path 'node_modules/**' -prune -o -path 'target/**' -prune -o -path 'dist/**' -prune -o  -type f -print -o -type l -print 2> /dev/null"

"" The Silver Searcher
if executable('ag')
  let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
  set grepprg=ag\ --nogroup\ --nocolor
endif

"" Ripgrep
if executable('rg')
  let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
  set grepprg=rg\ --vimgrep
  command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
endif

"" Coc.nvim extensions
let g:coc_global_extensions = [
  \'coc-vimlsp',
  \'coc-json',
  \'coc-git',
  \'coc-html',
  \'coc-tsserver',
  \'coc-prettier',
  \'coc-omnisharp',
  \'coc-sql',
  \'coc-markdownlint',
  \]

"" Vimspector
let g:vimspector_install_gadgets = [
  \'vscode-cpptools',
  \'vscode-node-debug2',
  \'netcoredbg',
  \]

"" Ale
let g:ale_disable_lsp = 1 "" Disable Ale LSP features already provided by coc.nvim such as auto-completion
let g:ale_sign_column_always = 1

"" Emmet
let g:user_emmet_install_global = 0

"*****************************************************************************
"" Commands
"*****************************************************************************

"" Remove trailing whitespaces
command! FixWhitespace :%s/\s\+$//e

"" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

"" Setup Prettier format code command
command! -nargs=0 Prettier :CocCommand prettier.formatFile

"*****************************************************************************
"" Functions
"*****************************************************************************

if !exists('*s:setupWrapping')
  function s:setupWrapping()
    set wrap
    set wm=2
    set textwidth=79
  endfunction
endif

function CreateFolder(folder_name)
  echo "Creating folder"
  exec "!mkdir -p " . a:folder_name
endfunction

function DeleteFileIfExist(file_path)
  echo "Deleting file if exist"
  exec "!rm -f " . a:file_path
endfunction

function BuildDebugCppProject()
  let l:working_directory_fullpath = expand('%:p:h')
  let l:debug_directory = l:working_directory_fullpath . '/debug'
  let l:debug_file = l:debug_directory . '/main.out'

  call CreateFolder(l:debug_directory)
  call DeleteFileIfExist(l:debug_file)

  echo "Building project in debug mode"
  exec "!g++ -g main.cpp -o " . l:debug_file
  echo "Building finished"
endfunction

function BuildReleaseCppProjectForLinux()
  let l:working_directory_fullpath = expand('%:p:h')
  let l:release_directory = l:working_directory_fullpath . '/release'
  let l:release_file = l:release_directory . '/main'

  call CreateFolder(l:release_directory)
  call DeleteFileIfExist(l:release_file)

  echo "Building project in release mode for Linux"
  exec "!g++ main.cpp -o " . l:release_file
  echo "Building finished"
endfunction

function BuildReleaseCppProjectForWindows()
  let l:working_directory_fullpath = expand('%:p:h')
  let l:release_directory = l:working_directory_fullpath . '/release'
  let l:release_file = l:release_directory . '/main.exe'

  call CreateFolder(l:release_directory)
  call DeleteFileIfExist(l:release_file)

  echo "Building project in release mode for Windows"
  exec "!x86_64-w64-mingw32-g++ -static-libgcc -static-libstdc++ main.cpp -o " . l:release_file
  echo "Building finished"
endfunction

"*****************************************************************************
"" Autocmd Rules
"*****************************************************************************

"" The PC is fast enough, do syntax highlight syncing from start unless 200 lines
augroup vimrc-sync-fromstart
  autocmd!
  autocmd BufEnter * :syntax sync maxlines=200
augroup END

"" Remember cursor position
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

"" Txt
augroup vimrc-wrapping
  autocmd!
  autocmd BufRead,BufNewFile *.txt call s:setupWrapping()
augroup END

"" Make/CMake
augroup vimrc-make-cmake
  autocmd!
  autocmd FileType make setlocal noexpandtab
  autocmd BufNewFile,BufRead CMakeLists.txt setlocal filetype=cmake
augroup END

set autoread

"*****************************************************************************
"" Mappings
"*****************************************************************************

"" Open start page
noremap <silent> <Leader><Home> :Startify<CR>

"" Undo
nmap <C-z> :undo<CR>
imap <C-z> <Esc>:undo<CR>a

"" Redo
nmap <C-y> :redo<CR>
imap <C-y> <Esc>:redo<CR>a

"" Disable vim's default undo and redo
map u <nop>
map <C-r> <nop>

"" Disable process suspension on Visual mode
vmap <C-z> <nop>

"" Save current buffer
nnoremap <C-s> :w<CR>
imap <C-s> <Esc>:w<CR>a

"" Save all open buffers
nnoremap <Leader>s :wa<CR>

"" Select all the buffer content
noremap <C-a> ggVG<CR>

"" Navigate between code errors with Ale
nmap <silent> <Leader>en :ALENext<CR>
nmap <silent> <Leader>ep :ALEPrevious<CR>

"" Open split windows
noremap <silent> <Leader>sh :<C-u>split<CR>
noremap <silent> <Leader>sv :<C-u>vsplit<CR>

"" Switch splitted windows
noremap <up> <C-w>k
noremap <down> <C-w>j
noremap <left> <C-w>h
noremap <right> <C-w>l

"" Resize split buffers
nnoremap <silent> <Leader>+ :vertical resize +3<CR>
nnoremap <silent> <Leader>- :vertical resize -3<CR>
nnoremap <silent> + :resize +3<CR>
nnoremap <silent> - :resize -3<CR>

"" Git
noremap <Leader>gl :Git log<CR>
noremap <Leader>gs :Git status<CR>
noremap <Leader>gd :Git diff<CR>
noremap <Leader>gw :Gwrite<CR>
noremap <Leader>ga :Git add .<CR>
noremap <Leader>gr :Git reset<CR>
noremap <Leader>gc :Git commit<CR>
noremap <Leader>gp :Git pull<CR>
noremap <Leader>go :Git push origin 
noremap <Leader>gb :Git branch 
noremap <Leader>gk :Git checkout 
noremap <Leader>gu :Git reset --soft HEAD^1<CR>

"" Session management
nnoremap <Leader>so :OpenSession<Space>
nnoremap <Leader>ss :SaveSession<Space>
nnoremap <Leader>sd :DeleteSession<CR>
nnoremap <Leader>sc :CloseSession<CR>

"" Open new buffer
noremap <silent> <Leader>t :enew<CR>

"" Close current buffer
noremap <silent> <Leader>w :bd<CR>

"" Buffer navigation
noremap <silent> <Leader><left> :bp<CR>
noremap <silent> <Leader><right> :bn<CR>
nnoremap <silent> <Leader>b :Buffers<CR>

"" Set working directory
nnoremap <Leader>. :lcd %:p:h<CR>

"" Recovery commands from history through FZF
nmap <Leader>y :History:<CR>

"" Nerdcommenter
let g:NERDCreateDefaultMappings = 0
map <Leader>cc <Plug>NERDCommenterToggle

"" NERDTree
nnoremap <silent> <F2> :NERDTreeFind<CR>
nnoremap <silent> <F3> :NERDTreeToggle<CR>

"" FZF
nnoremap <silent> <Leader>fz :FZF -m<CR>

"" Snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
let g:UltiSnipsEditSplit="vertical"

"" Tagbar
nmap <silent> <F4> :TagbarToggle<CR>
let g:tagbar_autofocus = 1

"" Disable visualbell
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

"" Copy/Cut/Paste
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif

if has('macunix')
  " pbcopy for OSX copy/paste
  vmap <C-x> :!pbcopy<CR>
  vmap <C-c> :w !pbcopy<CR><CR>
endif

"" Clean search (highlight)
nnoremap <silent> <Leader><space> :noh<cr>

"" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

"" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

"" Open current line on GitHub
nnoremap <Leader>o :.Gbrowse<CR>

"" Format code with CoC.Vim
xmap <silent> <Leader>f <Plug>(coc-format)
nmap <silent> <Leader>f <Plug>(coc-format)

"" Code navigation with Coc.Vim
nmap <silent> <Leader>cd <Plug>(coc-definition)
nmap <silent> <Leader>ct <Plug>(coc-type-definition)
nmap <silent> <Leader>ci <Plug>(coc-implementation)
nmap <silent> <Leader>cr <Plug>(coc-references)

"" Symbol renaming with coc.nvim
nmap <Leader>rn <Plug>(coc-rename)

"" Terminal emulation
nnoremap <silent> <Leader>te :ToggleTerminal<CR>
tnoremap <silent> <Leader>te <C-\><C-n>:ToggleTerminal<CR>

"" ESC to close the terminal mode
tnoremap <expr> <Esc> (&filetype == "fzf") ? "<Esc>" : "<c-\><c-n>"

"" Vimspector
nmap <silent> <Leader>dd :call vimspector#Launch()<CR>
nmap <silent> <Leader>dc :call vimspector#Continue()<CR>
nmap <silent> <Leader>dx :call vimspector#Reset()<CR>

nmap <silent> <Leader>db :call vimspector#ToggleBreakpoint()<CR>
nmap <silent> <Leader>dv :call vimspector#ClearBreakpoints()<CR>

nmap <silent> <Leader>dn :call vimspector#StepOver()<CR>
nmap <silent> <Leader>di :call vimspector#StepInto()<CR>
nmap <silent> <Leader>do :call vimspector#StepOut()<CR>

"*****************************************************************************
"" Custom configs
"*****************************************************************************

"" C/C++
autocmd FileType c setlocal tabstop=4 shiftwidth=4 expandtab
autocmd FileType cpp setlocal tabstop=4 shiftwidth=4 expandtab
autocmd FileType h setlocal tabstop=4 shiftwidth=4 expandtab

autocmd FileType cpp nnoremap <silent> <Leader>bd :call BuildDebugCppProject()<CR>
autocmd FileType cpp nnoremap <silent> <Leader>bb :call BuildReleaseCppProjectForLinux()<CR>
autocmd FileType cpp nnoremap <silent> <Leader>bw :call BuildReleaseCppProjectForWindows()<CR>

"" HTML
"" for html files, 2 spaces
autocmd Filetype html setlocal ts=2 sw=2 expandtab
autocmd FileType html,css EmmetInstall

"" TypeScript
let g:yats_host_keyword = 1
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact
hi tsxComponentName guifg=#56B6C2
hi tsxCloseComponentName guifg=#56B6C2

"" C#
let g:OmniSharp_selector_ui = 'fzf'
autocmd FileType cs xmap <silent> <Leader>f :OmniSharpCodeFormat<CR> <bar> :OmniSharpFixUsings<CR>
autocmd FileType cs nmap <silent> <Leader>f :OmniSharpCodeFormat<CR> <bar> :OmniSharpFixUsings<CR>

autocmd FileType cs nmap <silent> <buffer> <Leader>cd :OmniSharpGotoDefinition<CR>
autocmd FileType cs nmap <silent> <buffer> <Leader>ct :OmniSharpFindType<CR>
autocmd FileType cs nmap <silent> <buffer> <Leader>ci :OmniSharpFindImplementations<CR>
autocmd FileType cs nmap <silent> <buffer> <Leader>cr :OmniSharpFindUsages<CR>

"" Markdown
nmap <silent> <Leader>p :MarkdownPreviewToggle<CR>

"*****************************************************************************
"*****************************************************************************

"" Include user's local vim config
if filereadable(expand("~/.config/nvim/local_init.vim"))
  source ~/.config/nvim/local_init.vim
endif

"*****************************************************************************
"" Convenience variables
"*****************************************************************************

"" Templates with vim-skeletons
let skeletons#autoRegister = 1
let skeletons#skeletonsDir = "~/.config/nvim/templates"
