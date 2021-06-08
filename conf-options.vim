" Set Options Here
" ----------------
"
"

"behave mswin

set autoread                         " Automatically reload a file when you select the buffer, if something else has modified it
set whichwrap+=<,>,[,]               " Allow curser to wrap around to the next or previous line
set backspace=indent,eol,start       " Allow backspacing over autoindent, line breaks, and past beggining of insert action
set cmdheight=2                      " Less 'press <Enter> to continue'
set confirm                          " Bring up a dialog asking if you want to save changes when actions which leave the buffer
set cursorline                       " Highlight cursor line
set expandtab                        " Spaces instead of tabs
set foldlevelstart=99                " Start all the way folded
set history=10000                    " number of commands to keep in history
set ignorecase                       " Ignore make lowercase seaches case-insensitive
set incsearch                        " Automatically jump to any results whil typing in search
set lazyredraw                       " Don't showmacro actions, just update at the end for speed
set more                             " Enable scrolling of long command output
"set showmatch
"set matchtime=5
set hlsearch                         " Highlight search matches
set laststatus=2                     " Always display the status line
"set nobackup                         " Do not make a backup when overwriting a file
set hidden                           " Let the buffer remain in memory when not visible
"set nowritebackup                    " Do not write a backup when overwriting a file
set number                           " Display line numbers
set omnifunc=syntaxcomplete#Complete " Turn completion on
set ruler                            " Display cursor position in the bottom right
set scrolloff=10                     " Dislay 10 line above and below the cursor
set shiftwidth=4                     " A tab is 4 spaces
set sidescrolloff=10                 " Dislay 10 line to the left and right of the cursor
"set smartcase                        " Make searches with any uppercase letters be case-sensitive
set smarttab                         " Treat 4 spaces as if it was a tab
set textwidth=0                      " Disable Forceful text line wrap
set softtabstop=4                    " 4 spaces when i hit tab
set tabstop=4                        " Interpret a tab as 4 spaces
"set tags=/tags;./tags;/,tags;        " Is this optimal? maybe direct project root first, than tag back relay
set tags=/tags;./tags;/,tags;        " Is this optimal? maybe direct project root first, than tag back relay
set visualbell                       " Instead of beeping, induce seizures by screen flashing
set undofile                         " Persistent undo, across sessions
let &directory = stdpath("data") . '/swap'            " keep swap files in a special directory
let &backupdir = stdpath("data") . '/backup'            " keep backup files in a special directory
let &undodir   = stdpath("data") . '/undo'           " keep undo files in a special directory
set linebreak                        " Visually wrap characters at the word boundary (the wrap that happens when you size a window to small)
set gdefault                         " switch %s/{pattern}/{pattern} with %s/{pattern/{pattern}/g, since i never want to replace just the first match on each line. hopefully this won't mess with plugins
set undolevels=50000                 " Save a lot of file changes for undo
set undoreload=50000                " Save a lot of file reloads for undo
set wrapscan
set splitright                       " make vsplits happen to the right instead of left
set splitbelow                       " make split happen below instead of above
set wildmode=list:longest            " shell style completion
set tw=0                             " don't chop lines at 78 characters
set nomore                           "don't pause and display 'More'
" this option is inserting an new line at the end of each paste... set clipboard^=unnamed               "use system clipboard
set clipboard+=unnamedplus
set virtualedit=""

"set background=dark " will modify backgrounds, which may have different color for dark and light
"set nohidden " When I close a tab, remove the buffer
"set noswapfile "do not make swapfiles, this would be nice, except it is also used to warn users of opening a file up twice in different windows
"set shellslash "TODO

" Note: you can view currently mapped keys with :map, :nmap:, inoremap, and etc
" Note: vim lists all it's default keys and command in ":help index"
let mapleader = ' '
