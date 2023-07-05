let &runtimepath .= ',' . escape(expand("<sfile>:p:h"), '\,')


set nocompatible
"set runtimepath+=$VIM/  for snipmate auto lookup

call plug#begin(stdpath("data") . '/plug')

" Core Plugins {{{
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-emoji'
"Plug 'junegunn/vim-peekaboo'

Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'preservim/vim-wheel'
Plug 'fidian/hexmode'
Plug 'neovim/nvim-lspconfig'
Plug 'mfussenegger/nvim-jdtls'
Plug 'kevinhwang91/nvim-bqf'
"Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Functional
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'    " each [x & ]x mappings
Plug 'junegunn/vim-easy-align'
Plug 'justinmk/vim-sneak'
Plug 'voldikss/vim-floaterm'

Plug 'nvim-lualine/lualine.nvim'

"Plug 'unblevable/quick-scope'  
Plug 'mcchrish/nnn.vim'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'sheerun/vim-polyglot'

" Build
Plug 'mh21/errormarker.vim'

" Git Integration
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
Plug 'junegunn/gv.vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'sindrets/diffview.nvim'
Plug 'rbong/vim-flog'

" Colors
Plug 'flazz/vim-colorschemes' "a enourmous pack of colorschemes
Plug 'EdenEast/nightfox.nvim'
Plug 'catppuccin/nvim'
Plug 'rebelot/kanagawa.nvim'
Plug 'folke/tokyonight.nvim'
" Plug 'altercation/vim-colors-solarized'    " Solarized - a Solid Color Scheme
" Plug '29decibel/codeschool-vim-theme'
" Plug 'vim-scripts/darktango.vim'
" Plug 'djjcast/mirodark'
" Plug 'sjl/badwolf'
" Plug 'ciaranm/inkpot'
" Plug 'NLKNguyen/papercolor-theme'
" Plug 'ajh17/spacegray.vim'

" Plug 'w0ng/vim-hybrid'


" Utility
Plug 'majutsushi/tagbar'
Plug 'justinmk/vim-dirvish'
"Plug 'ludovicchabant/vim-gutentags'
Plug 'will133/vim-dirdiff'
Plug 'voldikss/vim-translator'
Plug 'nvim-tree/nvim-tree.lua'
" Plug 'jaxbot/semantic-highlight.vim'
" Plug 'junegunn/vim-journal'
" Plug 'glidenote/memolist.vim'
" Plug 'sjl/gundo.vim'
" Plug 'Shougo/vinarise.vim'
" Plug 'osyo-manga/vim-brightest'
" Plug 'nathanaelkane/vim-indent-guides'
" Plug 'equalsraf/neovim-gui-shim'
" Plug 'chrisbra/vim-diff-enhanced'
" Plug 'easymotion/vim-easymotion'
" Plug 'kien/rainbow_parentheses.vim'
" Plug 'AndrewRadev/splitjoin.vim'
" Plug 'rking/ag.vim'
" Plug 'PProvost/vim-ps1'
"Plug 'SirVer/ultisnips'
"Plug 'sakhnik/nvim-gdb', { 'do': ':!./install.sh' }
"
" Plug 'mnishz/colorscheme-preview'
"
" Plug 'paulkass/jira-vim'

" Octo
Plug 'nvim-lua/plenary.nvim',
Plug 'nvim-telescope/telescope.nvim',
Plug 'nvim-telescope/telescope-project.nvim',
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'kyazdani42/nvim-web-devicons',
Plug 'pwntester/octo.nvim'

Plug 'simrat39/symbols-outline.nvim'
Plug 'mfussenegger/nvim-dap'
Plug 'mfussenegger/nvim-jdtls'

let g:translate_source_lang = 'zh'
let g:translate_target_lang = 'en'

call plug#end()  " Add plugins to &runtimepath



        let errormarker_errortext = "EE"
        let errormarker_warningtext = "WW"
        let errormarker_warningtypes = "wW"
        let errormarker_errorgroup = "ErrorMsg"
        let errormarker_warninggroup = "Todo"

let g:gutentags_cache_dir = stdpath("data") . '/tags'
let g:gutentags_project_root = ['.repo']
let g:gutentags_add_default_project_roots = 0
" set statusline+=%{gutentags#statusline()}

let g:cpp_no_function_highlight = 1



function! s:CloseGit()
	for l:winnr in range(1, winnr('$'))
		if !empty(getwinvar(l:winnr, 'fugitive_status'))
			execute l:winnr.'close'
        endif
	endfor
endfunction

function! SwitchSource()
    let b:ext = expand('%:t:e') 
    let b:file = expand('%:t:r') 
    let b:head = expand('%:r') 
    let b:switch = ''

    if b:ext == 'h' || b:ext == 'hpp'
        if filereadable(b:head . '.c')
            let b:switch = b:head . '.c'
        elseif filereadable(b:head . '.cpp')
            let b:switch = b:head . '.cpp'
        endif

    elseif b:ext == 'c' || b:ext == 'cpp'
        if filereadable(b:head . '.h')
            let b:switch = b:head . '.h'
        elseif filereadable(b:head . '.hpp')
            let b:switch = b:head . '.hpp'
        endif
    endif
    if !empty(b:switch)
        :execute 'edit' b:switch
    endif
"    if l:ext =~ '^h$' || l:ext =~ '^hpp$'
"    :execute(':tselect /\v' . expand('%:t:r') . '\.(cpp\|c)')
"elseif l:ext =~ '^c$' || l:ext =~ '^cpp$'
"    :execute(':tselect /\v' . expand('%:t:r') . '\.(hpp\|h)')
"endif
endfunction

autocmd filetype c,cpp,h,hpp setlocal commentstring=//\ %s

""""""""""""""""""""""""""" from conf-plugins-fzf
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, {'options': ['--layout=reverse', '--info=inline', '--preview', 'bat --style=numbers --color=always --line-range :500 {}']}, <bang>0)

let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }

function! s:list_buffers()
  redir => list
  silent ls
  redir END
  return split(list, "\n")
endfunction

function! s:delete_buffers(lines)
  execute 'bwipeout' join(map(a:lines, {_, line -> split(line)[0]}))
endfunction

command! BDelete call fzf#run(fzf#wrap({
  \ 'source': s:list_buffers(),
  \ 'sink*': { lines -> s:delete_buffers(lines) },
  \ 'options': '--multi --reverse --bind ctrl-a:select-all+accept'
\ }))

"command! -bang -nargs=* Ag
"  \ call fzf#vim#grep(
"  \   'ag --column --numbers --noheading --color --smart-case -Q '.shellescape(<q-args>), 1,
"  \   fzf#vim#with_preview(), <bang>0)


"""""""""""""""""""""""""""""" from conf-plugins-easyalign

if !exists('g:easy_align_delimiters')
  let g:easy_align_delimiters = {}
endif
let g:easy_align_delimiters['#'] = { 'pattern': '#', 'ignore_groups': ['String'] }
let g:easy_align_delimiters['/'] = { 'pattern': '//', 'ignore_groups': ['String'] }
let g:easy_align_delimiters[']'] = { 'pattern': '[[\]]', 'left_margin': 1, 'right_margin': 0, 'stick_to_left': 0 }
let g:easy_align_delimiters[')'] = { 'pattern': '[()]', 'left_margin': 0, 'right_margin': 0, 'stick_to_left': 0 }
let g:easy_align_delimiters['\'] = { 'pattern': '\\' }
let g:easy_align_delimiters['%'] = { 'pattern': '%' }
let g:easy_align_delimiters['-'] = { 'pattern': '-' }
let g:easy_align_delimiters['['] = { 'pattern': '[' }
let g:easy_align_delimiters['('] = { 'pattern': '(' }
let g:easy_align_delimiters[':'] = { 'pattern': ':' }
let g:easy_align_delimiters['?'] = { 'pattern': '?' }
let g:easy_align_delimiters['|'] = { 'pattern': '|', 'ignore_groups': ['String'] }
let g:easy_align_delimiters['"'] = { 'pattern': '"', 'ignore_groups': ['String'] }


vnoremap <leader>ce :LiveEasyAlign<CR>
nnoremap <leader>ce :LiveEasyAlign<CR>
nnoremap <leader>c= :normal {v}<CR> :LiveEasyAlign<CR>
nnoremap <leader>= <esc>vi{==


runtime conf-plugins-sneak.vim
"""""""""""""""""""""""""""""" from conf-plugins-tagbar.vim

" let g:tagbar_autopreview=1
let g:tagbar_position='topleft vertical'
let g:tagbar_width= winwidth(0)/2

let g:tagbar_zoomwidth = 1
let g:tagbar_indent = 4

" nnoremap <leader>t :TagbarOpenAutoClose
" nnoremap <C-\> :TagbarOpenAutoClose


""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""" from conf-options.vim

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

" set mouse=?

"set background=dark " will modify backgrounds, which may have different color for dark and light
"set nohidden " When I close a tab, remove the buffer
"set noswapfile "do not make swapfiles, this would be nice, except it is also used to warn users of opening a file up twice in different windows
"set shellslash "TODO

" Note: you can view currently mapped keys with :map, :nmap:, inoremap, and etc
" Note: vim lists all it's default keys and command in ":help index"
let mapleader = ' '

if 1
  set foldenable        " enable folding
  set foldmethod=syntax " fold based on syntax highlighting
  set foldlevelstart=99 " start editing with all folds open
  set fillchars=fold:\  " start editing with all folds open

  " toggle folds
  nnoremap <leader>f zA
  vnoremap <leader>f zA

  set foldtext=FoldText()
  function! FoldText()
      return '~'
  endfun
endif

augroup GitCommit
" Enable spell checking, which is not on by default for commit messages.
autocmd FileType gitcommit setlocal spell
" Reset textwidth if you've previously overridden it.
autocmd FileType gitcommit setlocal textwidth=72
augroup END


""""""""""""""""""""""""""""""

runtime conf-keys.vim
runtime conf-tools.vim
runtime conf-cmds.vim
runtime local.vim



cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <M-b> <S-Left>
cnoremap <M-f> <S-Right>

lua <<EOF
require"octo".setup({
  default_remote = {"upstream", "origin"}; -- order to try remotes
  ssh_aliases = {},                        -- SSH aliases. e.g. `ssh_aliases = {["github.com-work"] = "github.com"}`
  reaction_viewer_hint_icon = "";         -- marker for user reactions
  user_icon = " ";                        -- user icon
  timeline_marker = "";                   -- timeline marker
  timeline_indent = "2";                   -- timeline indentation
  right_bubble_delimiter = "";            -- bubble delimiter
  left_bubble_delimiter = "";             -- bubble delimiter
  github_hostname = "";                    -- GitHub Enterprise host
  snippet_context_lines = 4;               -- number or lines around commented lines
  issues = {
    order_by = {                           -- criteria to sort results of `Octo issue list`
      field = "CREATED_AT",                -- either COMMENTS, CREATED_AT or UPDATED_AT (https://docs.github.com/en/graphql/reference/enums#issueorderfield)
      direction = "DESC"                   -- either DESC or ASC (https://docs.github.com/en/graphql/reference/enums#orderdirection)
    }
  },
  pull_requests = {
    order_by = {                           -- criteria to sort the results of `Octo pr list`
      field = "CREATED_AT",                -- either COMMENTS, CREATED_AT or UPDATED_AT (https://docs.github.com/en/graphql/reference/enums#issueorderfield)
      direction = "DESC"                   -- either DESC or ASC (https://docs.github.com/en/graphql/reference/enums#orderdirection)
    },
    always_select_remote_on_create = "false" -- always give prompt to select base remote repo when creating PRs
  },
  file_panel = {
    size = 10,                             -- changed files panel rows
    use_icons = true                       -- use web-devicons in file panel (if false, nvim-web-devicons does not need to be installed)
  },
  mappings = {
    issue = {
      close_issue = { lhs = "<space>ic", desc = "close issue" },
      reopen_issue = { lhs = "<space>io", desc = "reopen issue" },
      list_issues = { lhs = "<space>il", desc = "list open issues on same repo" },
      reload = { lhs = "<C-r>", desc = "reload issue" },
      open_in_browser = { lhs = "<C-b>", desc = "open issue in browser" },
      copy_url = { lhs = "<C-y>", desc = "copy url to system clipboard" },
      add_assignee = { lhs = "<space>aa", desc = "add assignee" },
      remove_assignee = { lhs = "<space>ad", desc = "remove assignee" },
      create_label = { lhs = "<space>lc", desc = "create label" },
      add_label = { lhs = "<space>la", desc = "add label" },
      remove_label = { lhs = "<space>ld", desc = "remove label" },
      goto_issue = { lhs = "<space>gi", desc = "navigate to a local repo issue" },
      add_comment = { lhs = "<space>ca", desc = "add comment" },
      delete_comment = { lhs = "<space>cd", desc = "delete comment" },
      next_comment = { lhs = "]c", desc = "go to next comment" },
      prev_comment = { lhs = "[c", desc = "go to previous comment" },
      react_hooray = { lhs = "<space>rp", desc = "add/remove 🎉 reaction" },
      react_heart = { lhs = "<space>rh", desc = "add/remove ❤️ reaction" },
      react_eyes = { lhs = "<space>re", desc = "add/remove 👀 reaction" },
      react_thumbs_up = { lhs = "<space>r+", desc = "add/remove 👍 reaction" },
      react_thumbs_down = { lhs = "<space>r-", desc = "add/remove 👎 reaction" },
      react_rocket = { lhs = "<space>rr", desc = "add/remove 🚀 reaction" },
      react_laugh = { lhs = "<space>rl", desc = "add/remove 😄 reaction" },
      react_confused = { lhs = "<space>rc", desc = "add/remove 😕 reaction" },
    },
    pull_request = {
      checkout_pr = { lhs = "<space>po", desc = "checkout PR" },
      merge_pr = { lhs = "<space>pm", desc = "merge commit PR" },
      squash_and_merge_pr = { lhs = "<space>psm", desc = "squash and merge PR" },
      list_commits = { lhs = "<space>pc", desc = "list PR commits" },
      list_changed_files = { lhs = "<space>pf", desc = "list PR changed files" },
      show_pr_diff = { lhs = "<space>pd", desc = "show PR diff" },
      add_reviewer = { lhs = "<space>va", desc = "add reviewer" },
      remove_reviewer = { lhs = "<space>vd", desc = "remove reviewer request" },
      close_issue = { lhs = "<space>ic", desc = "close PR" },
      reopen_issue = { lhs = "<space>io", desc = "reopen PR" },
      list_issues = { lhs = "<space>il", desc = "list open issues on same repo" },
      reload = { lhs = "<C-r>", desc = "reload PR" },
      open_in_browser = { lhs = "<C-b>", desc = "open PR in browser" },
      copy_url = { lhs = "<C-y>", desc = "copy url to system clipboard" },
      goto_file = { lhs = "gf", desc = "go to file" },
      add_assignee = { lhs = "<space>aa", desc = "add assignee" },
      remove_assignee = { lhs = "<space>ad", desc = "remove assignee" },
      create_label = { lhs = "<space>lc", desc = "create label" },
      add_label = { lhs = "<space>la", desc = "add label" },
      remove_label = { lhs = "<space>ld", desc = "remove label" },
      goto_issue = { lhs = "<space>gi", desc = "navigate to a local repo issue" },
      add_comment = { lhs = "<space>ca", desc = "add comment" },
      delete_comment = { lhs = "<space>cd", desc = "delete comment" },
      next_comment = { lhs = "]c", desc = "go to next comment" },
      prev_comment = { lhs = "[c", desc = "go to previous comment" },
      react_hooray = { lhs = "<space>rp", desc = "add/remove 🎉 reaction" },
      react_heart = { lhs = "<space>rh", desc = "add/remove ❤️ reaction" },
      react_eyes = { lhs = "<space>re", desc = "add/remove 👀 reaction" },
      react_thumbs_up = { lhs = "<space>r+", desc = "add/remove 👍 reaction" },
      react_thumbs_down = { lhs = "<space>r-", desc = "add/remove 👎 reaction" },
      react_rocket = { lhs = "<space>rr", desc = "add/remove 🚀 reaction" },
      react_laugh = { lhs = "<space>rl", desc = "add/remove 😄 reaction" },
      react_confused = { lhs = "<space>rc", desc = "add/remove 😕 reaction" },
    },
    review_thread = {
      goto_issue = { lhs = "<space>gi", desc = "navigate to a local repo issue" },
      add_comment = { lhs = "<space>ca", desc = "add comment" },
      add_suggestion = { lhs = "<space>sa", desc = "add suggestion" },
      delete_comment = { lhs = "<space>cd", desc = "delete comment" },
      next_comment = { lhs = "]c", desc = "go to next comment" },
      prev_comment = { lhs = "[c", desc = "go to previous comment" },
      select_next_entry = { lhs = "]q", desc = "move to previous changed file" },
      select_prev_entry = { lhs = "[q", desc = "move to next changed file" },
      close_review_tab = { lhs = "<C-c>", desc = "close review tab" },
      react_hooray = { lhs = "<space>rp", desc = "add/remove 🎉 reaction" },
      react_heart = { lhs = "<space>rh", desc = "add/remove ❤️ reaction" },
      react_eyes = { lhs = "<space>re", desc = "add/remove 👀 reaction" },
      react_thumbs_up = { lhs = "<space>r+", desc = "add/remove 👍 reaction" },
      react_thumbs_down = { lhs = "<space>r-", desc = "add/remove 👎 reaction" },
      react_rocket = { lhs = "<space>rr", desc = "add/remove 🚀 reaction" },
      react_laugh = { lhs = "<space>rl", desc = "add/remove 😄 reaction" },
      react_confused = { lhs = "<space>rc", desc = "add/remove 😕 reaction" },
    },
    submit_win = {
      approve_review = { lhs = "<C-a>", desc = "approve review" },
      comment_review = { lhs = "<C-m>", desc = "comment review" },
      request_changes = { lhs = "<C-r>", desc = "request changes review" },
      close_review_tab = { lhs = "<C-c>", desc = "close review tab" },
    },
    review_diff = {
      add_review_comment = { lhs = "<space>ca", desc = "add a new review comment" },
      add_review_suggestion = { lhs = "<space>sa", desc = "add a new review suggestion" },
      focus_files = { lhs = "<leader>e", desc = "move focus to changed file panel" },
      toggle_files = { lhs = "<leader>b", desc = "hide/show changed files panel" },
      next_thread = { lhs = "]t", desc = "move to next thread" },
      prev_thread = { lhs = "[t", desc = "move to previous thread" },
      select_next_entry = { lhs = "]q", desc = "move to previous changed file" },
      select_prev_entry = { lhs = "[q", desc = "move to next changed file" },
      close_review_tab = { lhs = "<C-c>", desc = "close review tab" },
      toggle_viewed = { lhs = "<leader><space>", desc = "toggle viewer viewed state" },
    },
    file_panel = {
      next_entry = { lhs = "j", desc = "move to next changed file" },
      prev_entry = { lhs = "k", desc = "move to previous changed file" },
      select_entry = { lhs = "<cr>", desc = "show selected changed file diffs" },
      refresh_files = { lhs = "R", desc = "refresh changed files panel" },
      focus_files = { lhs = "<leader>e", desc = "move focus to changed file panel" },
      toggle_files = { lhs = "<leader>b", desc = "hide/show changed files panel" },
      select_next_entry = { lhs = "]q", desc = "move to previous changed file" },
      select_prev_entry = { lhs = "[q", desc = "move to next changed file" },
      close_review_tab = { lhs = "<C-c>", desc = "close review tab" },
      toggle_viewed = { lhs = "<leader><space>", desc = "toggle viewer viewed state" },
    }
  }
})

require('telescope').setup {
  extensions = {
    project = {
      hidden_files = true,
      theme = "dropdown",
      order_by = "asc",
      search_by = "title",
      display_type = 'full'
    },
    file_browser = {
        -- use the "ivy" theme if you want
        theme = "ivy",
    },
    buffers = {
        theme = "ivy",
        sort_lastused = true,
        --ignore_current_buffer = false,
        sorter = require('telescope.sorters').get_substr_matcher(),
        shorten_path = true,
        --height = 10,
        --layout_strategy = 'horizontal',
        --layout_config = {preview_width = 0.65},
        --show_all_buffers = true,
        only_cwd = true,
        color_devicons = true
    }
  }
}
require("telescope").load_extension "file_browser"

vim.api.nvim_set_keymap(
        'n',
        '<leader>p',
        ":lua require'telescope'.extensions.project.project{}<CR>",
        {noremap = true, silent = true}
)

vim.api.nvim_set_keymap(
   "n",
   "<space>f",
   "<cmd>lua require 'telescope'.extensions.file_browser.file_browser()<CR>",
   {noremap = true}
)


-- DONT WORK?
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1
-- require("nvim-tree").setup()

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'gk', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true
  } end, bufopts) end

local lsp_flags = { -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}

root_dir = function(fname)
return require'lspconfig'.util.find_git_ancestor(fname)
end

require'lspconfig'.clangd.setup{
    on_attach = on_attach,
    root_dir=root_dir,
    flags = lsp_flags,
}



require'lspconfig'.jdtls.setup{
    on_attach = on_attach,
    root_dir=root_dir,
    flags = lsp_flags,
}


require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '|', right = '|'},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'filename', 'branch', 'diagnostics', "t:buildstatus"},
    lualine_c = {},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}



require("nnn").setup({
})




function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

function nmap(shortcut, command)
  map('n', shortcut, command)
end

function imap(shortcut, command)
  map('i', shortcut, command)
end
function vmap(shortcut, command)
  map('v', shortcut, command)
end

function tmap(shortcut, command)
  map('t', shortcut, command)
end

-- convert viml to lua with %s/tnoremap\s*\([<>-a-zA-Z0-9]*\)\s*\(.*\)/tmap("\1", "\2")

tmap("<C-Esc>",   [[<C-\><C-n>]])
tmap("<C-h>",   [[<C-\><C-n>:wincmd h<CR>]])
tmap("<C-j>",   [[<C-\><C-n>:wincmd j<CR>]])
tmap("<C-k>",   [[<C-\><C-n>:wincmd k<CR>]])
tmap("<C-l>",   [[<C-\><C-n>:wincmd l<CR>]])
tmap("<F5>",    [[<C-\><C-n>:FloatermToggle<CR>]])
--:FloatermToggle --height=0.85 --width=0.85 --wintype=float --name=floaterm1 --autoclose=2 

vim.g.floaterm_width = 0.90
vim.g.floaterm_height = 0.90

-- nmap("<F8>",    [[:make! \| :copen \| :cbot \| wincmd p<CR>]])
-- nmap("<F8>",    [[:make! \| :bot copen 25<CR>]])
nmap("<F8>",    [[:make!<CR>]])
nmap("<S-F8>",  [[:cclose<CR>]])

nmap("<F11>",   [[:DiffviewOpen<CR>]])
nmap("<S-F11>", [[:DiffviewClose<CR>]])
-- nmap("<F12>",   [[:Flogsplit<CR>]])
nmap("<F12>",    [[:FloatermNew cd %:h && lazygit<CR>]])

nmap("<Del>",  [[:normal zz<CR>]])
vmap("<Del>", [[<ESC>:normal zz<CR>]])
-- seems like i use delete in insert mode....  imap("<Del>", [[<ESC>:normal zz<CR>]])
nmap("<C-Del>",  [[:tabclose<CR>]])




















nmap("<F10>", [[:G<CR>]])
-- nmap("<S-F10>", [[:call <SID>CloseGit()<CR>]])

nmap("<F7>", [[:make! flash<CR>]])
nmap("<S-F7>", [[:make! debug<CR>]])

-- Text Yank & Insert
nmap("<leader>v", [[:let @+ = expand("%:t") . ':' . line(".")<CR>]])
nmap("<leader>vc", [[:let @+ = ''<CR>]])
nmap("<leader>vt", [[:let @+ = @+ . line(".") . ':' . getline(".")<CR>]])

nmap("<leader>it", [[a<c-r>=expand("%:t")<CR><ESC>]])
nmap("<leader>yt", [[:let @+ = expand("%:t")<CR>]])

nmap("<leader>ip", [[a<c-r>=expand("%:f")<CR><ESC>]])
nmap("<leader>yp", [[:let @+ = expand("%:f")<CR>]])


nmap("<leader>if", [[a<c-r>=expand("%:t") . ':' . line(".")<CR><ESC>]])
nmap("<leader>yf", [[:let @+ = expand("%:t") . ':' . line(".")<CR>]])
nmap("<leader>yF", [[:let @+ = @+ . expand("%:t") . ':' . line(".")<CR>]])


--imap("<leader>if", [[<c-r>=expand("%:t")<cr>]])
vmap("<leader>it", [[da<c-r>=expand("%:t")<CR><ESC>]])

nmap("<leader>id", [[a<C-R>=strftime("%m/%d/%y")<CR><ESC>]])
--imap("<leader>id", [[<C-R>=strftime("%m/%d/%y")<CR>]])
vmap("<leader>id", [[da<C-R>=strftime("%m/%d/%y")<CR><ESC>]])

nmap("<leader>il", [[a<C-R>=line('.')1<CR><ESC>]])
nmap("<leader>ib", [[a--------------------------------------------------------------------------------<CR><ESC>]])

--    Insert Mode Movement
-- imap("<C-L>" [[<Right>]])
-- imap("<C-H>" [[<Left>]])
-- imap("<C-K>" [[<Up>]])
-- imap("<C-J>" [[<Down>]])

nmap("<C-J>", [[:wincmd j<CR>]])
nmap("<C-K>", [[:wincmd k<CR>]])
nmap("<C-L>", [[:wincmd l<CR>]])
nmap("<C-H>", [[:wincmd h<CR>]])




--    Up & Down Movements
nmap("K", [[<C-U>]])
nmap("J", [[<C-D>]])
nmap("j", [[gj]])
nmap("k", [[gk]])


-- Buffer management

nmap("<C-s>", [[:bd<CR>]])
nmap("<leader>s", [[:BDelete<CR>]])
nmap("<C-d>", [[:q<CR>]])

nmap("zz",  [[ZZ]])
nmap("<leader>/", [[:nohlsearch<CR>]])



--noremap <Leader>p viw"0p
--noremap <Leader>P viw"0P
--vmap("<Leader>p", [["0p]])
--vmap("<Leader>P", [["0P]])

-- Change alignment
vmap("<Leader>ca", [[:LiveEasyAlign<CR>]])

-- Change Word under cursor
nmap("<leader>cw", [[:normal!viw"py<ESC>:%s/\<<c-r>p\>/<c-r>p/<left>]])

-- Change Text Under cursor
nmap("<leader>ct", [[:normal!viw"py<ESC>:%s/<c-r>p/<c-r>p/<left>]])
vmap("<leader>ct", [[:normal!"py<ESC>:%s/<c-r>p/<c-r>p/<left>]])

nmap("<leader>nv", [[:vnew <CR>]])
nmap("<leader>nh", [[:new <CR>]])
nmap("<leader>nt", [[:tabnew <CR>]])
--nmap("<leader>z", [[:foldmethod=]])


nmap("<leader>[", [[:ClangdSwitchSourceHeader<CR>]])


nmap("<leader>wo", [[:execute ':edit' system('lua ~/Log/tasks.lua filename')<CR>]])
nmap("<leader>wm", [[:normal! I <esc>]])
nmap("<leader>wd", [[:normal! 0r <esc>]])
nmap("<leader>wa", [[:normal! I <esc>]])



nmap("<F1>", [[:silent Telescope help_tags<CR>]])
nmap("<F3>", [[:silent q<CR>]])
nmap("<F4>", [[:silent tabclose<CR>]])
nmap("<S-F4>", [[:silent %bd<CR>]])

nmap("<leader>yb", [[:Telescope git_branches<CR>]])
nmap("<leader>ys", [[:Telescope git_status<CR>]])
nmap("<leader>yc", [[:Telescope git_commits<CR>]])

nmap("<leader>ts", [[:Telescope lsp_document_symbols<CR>]])
nmap("<leader>th", [[:Telescope lsp_document_symbols<CR>]])
nmap("<leader>th", [[:Telescope help_tags<CR>]])
nmap("<leader>m", [[:Telescope old_files<CR>]])
nmap("<leader>o", [[:Telescope lsp_document_symbols<CR>]])

nmap("<leader>e",  [[:Files file_browser<CR>]])

nmap("<Leader>k", [[:copen<CR>]])
nmap("<leader>z", [[:quit<CR>]])
nmap("<leader>x", [[:tabclose<CR>]])




------ Options ------
vim.opt.autoread = true                         -- Automatically reload a file when you select the buffer, if something else has modified it
vim.opt.cmdheight=2                             -- Less 'press <Enter> to continue'
vim.opt.confirm = true                          -- Bring up a dialog asking if you want to save changes when actions which leave the buffer
vim.opt.cursorline = true                       -- Highlight cursor line
vim.opt.expandtab= true                         -- Spaces instead of tabs
vim.opt.foldlevelstart=99                       -- Start all the way folded
vim.opt.history=10000                           -- number of commands to keep in history
vim.opt.ignorecase= true                        -- Ignore make lowercase seaches case-insensitive
vim.opt.incsearch= true                         -- Automatically jump to any results whil typing in search
vim.opt.lazyredraw= true                        -- Don't showmacro actions, just update at the end for speed
vim.opt.more= true                              -- Enable scrolling of long command output
vim.opt.hlsearch = true                         -- Highlight search matches
vim.opt.laststatus=2                            -- Always display the status line
vim.opt.hidden = true                           -- Let the buffer remain in memory when not visible
vim.opt.number = true                           -- Display line numbers

vim.opt.wrapscan = true
vim.opt.splitright= true                       -- Make vsplits happen to the right instead of left
vim.opt.splitbelow= true                       -- Make split happen below instead of above
vim.opt.ruler= true                            -- Display cursor position in the bottom right
vim.opt.scrolloff=10                           -- Dislay 10 line above and below the cursor
vim.opt.shiftwidth=4                           -- A tab is 4 spaces
vim.opt.sidescrolloff=10                       -- Dislay 10 line to the left and right of the cursor
vim.opt.smarttab= true                         -- Treat 4 spaces as if it was a tab
vim.opt.textwidth=0                            -- Disable Forceful text line wrap
vim.opt.softtabstop=4                          -- 4 spaces when i hit tab
vim.opt.tabstop=4                              -- Interpret a tab as 4 spaces
vim.opt.tw=0                                   -- Don't chop lines at 78 characters
vim.opt.visualbell= true                       -- Instead of beeping, induce seizures by screen flashing
vim.opt.undofile= true                         -- Persistent undo, across sessions
vim.opt.linebreak =  true                              -- Visually wrap characters at the word boundary
vim.opt.gdefault  =  true                              -- %s will replace all matches rather than just the first on each line

--set omnifunc=syntaxcomplete#Complete " Turn completion on
--"set tags=/tags;./tags;/,tags;        " Is this optimal? maybe direct project root first, than tag back relay
--set tags=/tags;./tags;/,tags;        " Is this optimal? maybe direct project root first, than tag back relay
--set whichwrap+=<,>,[,]               -- Allow curser to wrap around to the next or previous line
--set backspace=indent,eol,start       -- Allow backspacing over autoindent, line breaks, and past beggining of insert action
--let &directory = stdpath("data") . '/swap'            " keep swap files in a special directory
--let &backupdir = stdpath("data") . '/backup'            " keep backup files in a special directory
--let &undodir   = stdpath("data") . '/undo'           " keep undo files in a special directory
--set undolevels=50000                 " Save a lot of file changes for undo
--set undoreload=50000                " Save a lot of file reloads for undo
--set wildmode=list:longest            " shell style completion
--set nomore                           "don't pause and display 'More'
--" this option is inserting an new line at the end of each paste... set clipboard^=unnamed               "use system clipboard
--set clipboard+=unnamedplus
--set virtualedit=""








































------
--"vim.opt.showmatch = true
--"vim.opt.matchtime=5
--"vim.opt.backup = false                         " Do not make a backup when overwriting a file
--"vim.opt.writebackup = false                    " Do not write a backup when overwriting a file
--"set smartcase                        " Make searches with any uppercase letters be case-sensitive

require("symbols-outline").setup({})
local jdtls = require('jdtls')

-- File types that signify a Java project's root directory. This will be
-- used by eclipse to determine what constitutes a workspace
local root_markers = {'gradlew', 'mvnw', '.git'}
local root_dir = require('jdtls.setup').find_root(root_markers)




------ disable netrw at the very start of your init.lua
----vim.g.loaded_netrw = 1
----vim.g.loaded_netrwPlugin = 1
------ set termguicolors to enable highlight groups
----vim.opt.termguicolors = true
----
------ empty setup using defaults
----require("nvim-tree").setup()

EOF

"""""""""""""""""""""""""""""" from tools.vim
"nnoremap <leader>r :Files<CR>
nnoremap <leader>r :Telescope find_files<CR>

nnoremap <leader>ac :exec 'Ag ' . expand('<cword>')<CR>
nnoremap <expr> <leader>av ':vimgrep' . ' ' . expand('<cword>') . ' ' . '..\' 
nnoremap <leader>ai :Ag 
" nnoremap <leader>p :BuildBuild<CR>
" nnoremap <leader>P :ProjectWindow<CR>
"nnoremap <leader>P :BuildGtags<CR>
" nnoremap <leader>E :ProjectOpenFile<CR>
nnoremap <leader>l :BLines<CR>
nnoremap <leader>L :Lines<CR>
" nnoremap <leader>w :Windows<CR>
" nnoremap <leader>m :History<CR>
nnoremap <leader>h :History:<CR>
nnoremap <leader>H :History/<CR>

" nnoremap <leader>e :Files %:h<CR>
"nnoremap <leader>k :Windows<CR>
" nnoremap <leader>o :BTags<CR>
" nnoremap <leader>j :Buffer<CR>
nnoremap <leader>j :Telescope buffers<CR>

""""""""""""""""""""""""""""""



























augroup Build
    au!
    autocmd TabNew       * let t:buildstatus = "-"
    autocmd ShellCmdPost * let t:buildstatus = filereadable("build.status")	? join(readfile("build.status"), "\n") : "-"
augroup END

set mouse=

" Open Socket for Terminal NVR to use
call serverstart('/tmp/nvimsocket')
