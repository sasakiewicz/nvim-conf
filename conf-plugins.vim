
set nocompatible
"set runtimepath+=$VIM/  for snipmate auto lookup

call plug#begin(stdpath("data") . '/plug')

" Core Plugins {{{
" Plug 'jaxbot/semantic-highlight.vim'
" Plug 'junegunn/vim-journal'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Plug 'glidenote/memolist.vim'
Plug 'flazz/vim-colorschemes' "a enourmous pack of colorschemes
Plug 'justinmk/vim-dirvish'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
" Plug 'sjl/gundo.vim'
" Plug 'vim-scripts/DirDiff.vim'
" Plug 'Shougo/vinarise.vim'
" Plug 'osyo-manga/vim-brightest'
" Plug 'nathanaelkane/vim-indent-guides'
Plug 'tpope/vim-commentary'
" Plug 'equalsraf/neovim-gui-shim'
" Plug 'chrisbra/vim-diff-enhanced'
" Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-unimpaired'    " each [x & ]x mappings
Plug 'justinmk/vim-sneak'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'
" Plug 'kien/rainbow_parentheses.vim'
" Plug 'mh21/errormarker.vim'
" Plug 'AndrewRadev/splitjoin.vim'
" Plug 'rking/ag.vim'    " AG.vim - interface to ag.exe,  grep/ack replacement
" Plug 'PProvost/vim-ps1'
"Plug 'SirVer/ultisnips'
"Plug 'sakhnik/nvim-gdb', { 'do': ':!./install.sh' }
" Plug 'paulkass/jira-vim'
" Plug 'altercation/vim-colors-solarized'    " Solarized - a Solid Color Scheme
" Plug '29decibel/codeschool-vim-theme'
" Plug 'vim-scripts/darktango.vim'
" Plug 'djjcast/mirodark'
" Plug 'sjl/badwolf'
" Plug 'ciaranm/inkpot'
" Plug 'w0ng/vim-hybrid'
" Plug 'NLKNguyen/papercolor-theme'
" Plug 'ajh17/spacegray.vim'
Plug 'preservim/vim-wheel'
Plug 'mnishz/colorscheme-preview'
Plug 'ludovicchabant/vim-gutentags'
Plug 'tpope/vim-fugitive'
Plug 'majutsushi/tagbar'

Plug 'unblevable/quick-scope'  

call plug#end()  " Add plugins to &runtimepath


let g:gutentags_cache_dir = stdpath("data") . '/tags'
let g:gutentags_project_root = ['.repo']
let g:gutentags_add_default_project_roots = 0
" set statusline+=%{gutentags#statusline()}

