
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


let g:nnn#set_default_mappings = 0

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
