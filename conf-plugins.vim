
set nocompatible
"set runtimepath+=$VIM/  for snipmate auto lookup

call plug#begin($LOCALAPPDATA . '\nvim-data\plugged')

" Core Plugins {{{
Plug 'jaxbot/semantic-highlight.vim'
Plug 'junegunn/vim-journal'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'glidenote/memolist.vim'
Plug 'flazz/vim-colorschemes' "a enourmous pack of colorschemes
Plug 'justinmk/vim-dirvish'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'sjl/gundo.vim'
Plug 'vim-scripts/DirDiff.vim'
Plug 'Shougo/vinarise.vim'
Plug 'osyo-manga/vim-brightest'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'tpope/vim-commentary'
Plug 'equalsraf/neovim-gui-shim'
Plug 'chrisbra/vim-diff-enhanced'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-unimpaired'    " each [x & ]x mappings
Plug 'justinmk/vim-sneak'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'
Plug 'kien/rainbow_parentheses.vim'
Plug 'mh21/errormarker.vim'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'rking/ag.vim'    " AG.vim - interface to ag.exe,  grep/ack replacement
Plug 'PProvost/vim-ps1'
Plug 'SirVer/ultisnips'
Plug 'sakhnik/nvim-gdb', { 'do': ':!./install.sh' }
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

call plug#end()  " Add plugins to &runtimepath
