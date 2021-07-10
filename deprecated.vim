

" TODO: Please get rid of me
"if !exists('g:is_startup') " Determine if we just started up vim
"    let g:is_startup = 1
"else
"    let g:is_startup = 0
"endif
"
"if g:is_startup
"
"    if has('win32') || has('win64')
"        let g:is_win = 1
"        let g:is_nix = 0
"    elseif has('unix')
"        let g:is_win = 0
"        let g:is_nix = 1
"    endif
"
"    let g:is_gui = has("gui_running")
"    let g:is_terminal = !has("gui_running")
"    let g:hostname = substitute(system('hostname'), '\n', '', '')
"    let g:rootmarkers = ['hello', 'hi', 'README', '.workspace-artifacts'] " Markers used to find project directory
"endif
"

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Turn off default mappings
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_move_highlight = 1


" sneak s/S toggle
let g:sneak#s_next = 1
let g:sneak#use_ic_scs = 1

let g:brightest_enable=1

let g:DirDiffExcludes = "*.o,*.a,*.i,.svn,*.dep"
let g:DirDiffAddArgs = "-w" " Don't flag whitespace only as a file difference


nnoremap <space><space> a<space><esc>
nnoremap <s-space><s-space> i<space><esc>

nmap <silent> <leader>gC <esc>:call GtagsRefSearch()<CR>

nmap <silent> <leader>gn <esc>:cn<CR>
nmap <silent> <leader>gp <esc>:cp<CR>
nmap <silent> <leader>gl <esc>:cl<CR>

nmap <silent> <leader>gu <esc>:GundoToggle<CR>



------------

nnoremap <leader>r :ProjectSearchFile<CR>
nnoremap <leader>ac :ProjectSearchTextWord<CR>
nnoremap <expr> <leader>av ':vimgrep' . ' ' . expand('<cword>') . ' ' . '..\' 
nnoremap <leader>ai :ProjectSearchTextInput<CR>
nnoremap <leader>p :BuildBuild<CR>
nnoremap <leader>P :ProjectWindow<CR>
"nnoremap <leader>P :BuildGtags<CR>
nnoremap <leader>E :ProjectOpenFile<CR>
nnoremap <leader>l :BLines<CR>
nnoremap <leader>L :Lines<CR>
"nnoremap <leader>w :Windows<CR>
nnoremap <leader>m :History<CR>
nnoremap <leader>h :History:<CR>
nnoremap <leader>H :History/<CR>

nnoremap <leader>e :Files %:h<CR>
nnoremap <leader>k :Windows<CR>
nnoremap <leader>o :BTags<CR>
nnoremap <leader>j :Buffer<CR>

command! FixNewline  :%s/\r/\r/  |:nohlsearch
command! FixTrailing :%s/\s*$//  |:nohlsearch
command! FixTabs     :%s/\t/    /|:nohlsearch
command! DeleteFile  :call delete(expand('%')) | bdelete!

nmap <silent> <leader>vn <esc>:vnew<CR>
nmap <silent> <leader>vs <esc>:vsplit<CR>
nmap <silent> <leader>hn <esc>:new<CR>
nmap <silent> <leader>hs <esc>:split<CR>

compiler gcc "use gcc for building and quickfixing errors
hi CursorLine term=none cterm=none ctermbg=3
filetype plugin indent on " Turn on filetype specific indenting
syntax enable " Turn on syntax coloring

call matchadd('ColorColumn', '\%81v', 100)
nnoremap <leader>s :Snippets<cr>
nnoremap <leader>S :SemanticHighlightToggle<cr>


"    Close tabs

nnoremap <leader>cw :normal!viw"py<ESC>:%s/\<<c-r>p\>/<c-r>p/<left>
nnoremap <leader>c- :normal!viw"py<ESC>:%s/\<<c-r>p\>\./<c-r>p->/c<CR>
nnoremap <leader>c. :normal!viw"py<ESC>:%s/\<<c-r>p\>->/<c-r>p./c<CR>


function! RenameCpp()
    :normal!viwy<ESC>:%s/\<<c-r>"\>/<c-r>"/<left>
    :call SwitchSource()
    :
endfunction

" Tab Mappings {{{
" use gt & gT "nnoremap <silent> <A-h> :tabprevious<CR>
"nnoremap <silent> <A-l> :tabnext<CR>
nnoremap <silent> <A-H> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <A-L> :execute 'silent! tabmove ' . tabpagenr()<CR>
" Tab Mappings }}}

map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
"C-\ will open the definition in a new tab
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
"C-] will open the definition in a new split
" }}}

" Leader Key Mappings {{{


"function! BuildGtags(dir)
"    :ProjectRootExe :silent !gtags
"endfunction

"function! RunAgOnWordUnderCursor(dir)
"    let wordUnderCursor = expand("<cword>")
"    call RunAg(wordUnderCursor, a:dir)
"endfunction

"function! RunAgOnInput(dir)
"    let searchString = input("Ag Search For: ")
"    call RunAg(searchString, a:dir)
"endfunction

"function! RunAg(text, dir)
"    if !empty(a:text)
"        echo ""
"        echo "RunAg - Searching for: " . a:text
"        echo "RunAg - Searching in: " . a:dir
""TODO change based on filetype for python and etc
"	if g:is_win
"        	let g:AgIgnoreString =' --file-search-regex .^(^(c^)^|^(cpp^)^|^(h^)^|^(hpp^)^|^(C^)^|^(CPP^)^|^(H^)^)$ '
"	endif
"	if g:is_nix
"        	let g:AgIgnoreString =' --file-search-regex .\[\(c\)\(cpp\)\(h\)\(hpp\)\(C\)\(CPP\)\(H\)\]$ '
"	endif

"        let searchString =  "Ag! -S --stats " . g:AgIgnoreString . a:text . " " . a:dir
"        execute searchString
"    else
"        echo "RunAg: no input string"
"    endif
" endfunction

function! BuildHelpTags(doclocations)
for docloc in a:doclocations
    :execute "helptag " . docloc
endfor
endfunction

"given a file called build.log, parse build errors and open in a quickfix
function! ParseGccBuildLog(logfile)
    cd c:\
    "find redirects
    compiler gcc
    "find normal error outputs
    execute 'cgetfile ' . g:project_root_sys . '\' . 'gcc.log'
    "open up the quickfix
    :cwindow
    :normal <c-w>j
endfunction

"given a file called build.log, parse build errors and open in a quickfix
function! ParseIarBuildLog(logfile)
    "find redirects
    set efm=%.%#text\=\'%f(%l)\ :\ %m\]
    "find normal error outputs
    set efm+=%f(%l)\ :\ %m
    "skip all other messages
    set efm+=%-G%.%#
    "run the build error parse over the log
    execute 'cgetfile' 'c:\build.log'
    "open up the quickfix
    :cwindow
    ":silent /[Ee]rror
    :normal <c-w>j
endfunction

function! SetUTF8Compatible()
    set enc=utf-8
    set fileencoding=utf-8
    set fileencodings=utf-8
    set guifont=Monaco:h10:cANSI
    :e! ++enc=utf8
endfunction

"}}}

" Utility Functions {{{

function! ToggleVerbose()
    if !&verbose
        set verbosefile=~/.vim/verbose.log
        set verbose=15
    else
        set verbose=0
        set verbosefile=
    endif
endfunction


nnoremap <Esc> <C-\><C-n>

function! OpenWindows()
        execute ':Windows'
endfunction
nnoremap <leader>J :call OpenWindows<CR>

function! GetFileName()
    let @+ = expand('%:p')
endfunction
nnoremap <leader>f :call GetFileName()<CR>

"
" Text Formatting
"
nnoremap <leader>ts :set invlist

vnoremap <leader>at :LiveEasyAlign<CR>
nnoremap <leader>at :LiveEasyAlign<CR>
nnoremap <leader>af <esc>vi{==


" Leader Key Mappings }}}

" Paste/Replace Mappings {{{
vmap <C-Space> "0p
nmap <C-Space> "0p
imap <C-Space> <C-r>0

nnoremap <C-x> viw"0p
nnoremap <C-;> $a;<Esc>
  
" }}}

"
" Add Ending Semicolon {{{
"
command! -range FixSemi :<line1>,<line2>s/\(\s\)*$/;/    |:nohlsearch

"
" Tab
"
nnoremap <silent> <leader>tn <esc>:tabnew<CR>
nnoremap <silent> <leader>tc <esc>:tabclose<CR>
nnoremap <silent> <leader>td <esc>:windo bd<CR>
"nnoremap <silent> <leader>th :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
"nnoremap <silent> <leader>tl :execute 'silent! tabmove ' . tabpagenr()<CR>
"}}}

nmap <leader> <nop>

"
" Split Open and Navigation
"
nmap <silent> <leader>vn <esc>:vnew<CR>
nmap <silent> <leader>vs <esc>:vsplit<CR>
nmap <silent> <leader>hn <esc>:new<CR>
nmap <silent> <leader>hs <esc>:split<CR>
nnoremap <silent> <c-j> :wincmd j<CR>
nnoremap <silent> <c-k> :wincmd k<CR>
nnoremap <silent> <c-l> :wincmd l<CR>
nnoremap <silent> <c-h> :wincmd h<CR>
"nnoremap <silent> <c-K> :wincmd K<CR>
"nnoremap <silent> <c-J> :wincmd J<CR>
"nnoremap <silent> <c-H> :wincmd H<CR>
"nnoremap <silent> <c-L> :wincmd L<CR>
"}}}

"
" Personal TODO

" Terminal
tnoremap <Esc> <C-\><C-n>

" Text Yank & Insert
nnoremap <leader>v :let @+ = expand("%:t") . ':' . line(".")<CR>
nnoremap <leader>vc :let @+ = ''<CR>
nnoremap <leader>vt :let @+ = @+ . line(".") . ':' . getline(".")<CR>

nnoremap <leader>it a<c-r>=expand("%:t")<CR><ESC>
nnoremap <leader>yt :let @+ = expand("%:t")<CR>

nnoremap <leader>ip a<c-r>=expand("%:f")<CR><ESC>
nnoremap <leader>yp :let @+ = expand("%:f")<CR>


nnoremap <leader>if a<c-r>=expand("%:t") . ':' . line(".")<CR><ESC>
nnoremap <leader>yf :let @+ = expand("%:t") . ':' . line(".")<CR>
nnoremap <leader>yF :let @+ = @+ . expand("%:t") . ':' . line(".")<CR>


"inoremap <leader>if <c-r>=expand("%:t")<cr>
vnoremap <leader>it da<c-r>=expand("%:t")<CR><ESC>

nnoremap <leader>id a<C-R>=strftime("%m/%d/%y")<CR><ESC>
""inoremap <leader>id <C-R>=strftime("%m/%d/%y")<CR>
vnoremap <leader>id da<C-R>=strftime("%m/%d/%y")<CR><ESC>

nnoremap <leader>il a<C-R>=line('.')1<CR><ESC>
nnoremap <leader>ib a--------------------------------------------------------------------------------<CR><ESC>


" Explore

" function! OpenExplore()
"         execute ':Files %:h'
" endfunction
" nnoremap <leader>e :call OpenExplore()<CR>

" function! OpenTags()
"         execute ':Tags'
" endfunction
" nnoremap <leader>e :call OpenExplore()<CR>

" function! OpenBuffers()
"         execute ':Buffers'
" endfunction
" nnoremap <leader>j :call OpenBuffers()<CR>

" function! OpenWindows()
"         execute ':Windows'
" endfunction
" nnoremap <leader>J :call OpenWindows<CR>


" function! GetFileName()
"     let @+ = expand('%:p')
" endfunction
" nnoremap <leader>f :call GetFileName()<CR>






map <silent> <A-f> <Plug>(easymotion-f)
map <silent> <A-F> <Plug>(easymotion-F)
map <silent> <A-t> <Plug>(easymotion-t)
map <silent> <A-T> <Plug>(easymotion-T)
map <silent> <A-w> <Plug>(easymotion-w)
map <silent> <A-W> <Plug>(easymotion-W)
map <silent> <A-b> <Plug>(easymotion-b)
map <silent> <A-B> <Plug>(easymotion-B)
map <silent> <A-e> <Plug>(easymotion-e)
map <silent> <A-E> <Plug>(easymotion-E)
map <silent> <A-ge> <Plug>(easymotion-ge)
map <silent> <A-gE> <Plug>(easymotion-gE)
map <silent> <A-j> <Plug>(easymotion-j)
map <silent> <A-k> <Plug>(easymotion-k)
map <silent> <A-a> <Plug>(easymotion-jumptoanywhere)


"  Machine Specific {{{


if g:is_win " Windows Configuration

    set fileformat=dos " Will set the carriage returns to windows/style when saving/editing a file
    set fileformats=dos,unix " WIll try unix and windows style EOL when opening a file
    nnoremap <leader>tl :silent !C:\Progra~1\TortoiseSVN\bin\\TortoiseProc.exe /command:log /path:"%" /closeonend:4 /notempfile<CR>
    nnoremap <leader>td :silent !C:\Progra~1\TortoiseSVN\bin\\TortoiseProc.exe /command:diff /path:"%" /closeonend /notempfile<CR>
    nnoremap <leader>tm :execute "silent !C:\\Progra~1\\TortoiseSVN\\bin\\TortoiseProc.exe /command:repostatus /path:\"" . g:project_root_sys . "\" /closeforlocal"<CR>
    nnoremap <leader>tu :execute "silent !C:\\Progra~1\\TortoiseSVN\\bin\\TortoiseProc.exe /command:update /path:\"" . g:project_root_sys . "\" /closeforlocal"<CR>

    " Disable pythong loading
" let g:loaded_python_provider = 1
" let g:loaded_python3_provider = 1
"let g:python_host_prog = 'C:\Python27\python.exe'
let g:python3_host_prog = 'C:\Users\sasakiewicz\AppData\Local\Programs\Python\Python38-32\python.exe'
elseif g:is_nix " Linux Configuration

    set fileformat=unix " Will set the carriage returns to windows/style when saving/editing a file
    set fileformats=dos,unix " WIll try unix and windows style EOL when opening a file

endif

if g:is_gui

    set guioptions-=T  " Remove toolbar(icon bar)
    set guioptions-=m  " Remove menu
    set guioptions-=r  " Remove right-hand scroll bar
    set guioptions-=L  " Remove left-hand scroll bar

    if g:is_nix " Linux Configuration

        set guifont="ProggyCleanTT 12"
        set lines=61 columns=244 " Maximize window
        "nmap <leader>w :w ++ff=unix<CR>
        nmap <leader>w :w<CR>

    elseif g:is_win " Windows Configuration
        " add nvim qt gui plugin to runtimepath
        set runtimepath+='C:\Program Files\Neovim\share\nvim-qt\runtime'

        "TODO try true fullscreen, like a vn
        set lines=71 columns=260 " For a 1080p screen
        nmap <leader>w :w<CR>

    endif

endif
"}}}
fu! s:isdir(dir) abort
    return !empty(a:dir) && (isdirectory(a:dir) || (!empty($SYSTEMDRIVE) && isdirectory('/'.tolower($SYSTEMDRIVE[0]).a:dir)))
endfu

" AutoCmds {{{
"
augroup vimrc
    au!
    " autocmd BufEnter *.c,*.cpp,*.h,*.hpp,*.txt,*.vim :call SetRoot()
    " autocmd BufEnter * if s:isdir(expand('%')) | :call SetRoot | endif
    autocmd FileType vim setlocal foldmethod=marker
    autocmd FileType text setlocal foldmethod=indent
    autocmd FocusLost * stopinsert
    autocmd FocusLost *.c,*.cpp,*.h,*.hpp silent! wa
    autocmd FocusLost let @+=@0 " set system clipboard to whatever we last copied, since to and from clipboard is broken for me
    autocmd bufwritepost vimrc source % " Re-Source vimrc wach time it is edited

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event handler
    " (happens when dropping a file on gvim).
    " Also don't do it when the mark is in the first line, that is the default
    " position when opening a file.
    autocmd BufReadPost *
                \ if line("'\"") > 1 && line("'\"") <= line("$") |
                \   exe "normal! g`\"" |
                \ endif
" au FilterWritePre * if &diff | colorscheme codeschool | endif

augroup END

augroup Binary
    au!
    autocmd BufReadPre   *.bin let &bin=1
    autocmd BufReadPost  *.bin if &bin | %!xxd -c 32
    autocmd BufReadPost  *.bin set ft=xxd | endif
    autocmd BufWritePre  *.bin if &bin | %!xxd -r
    autocmd BufWritePre  *.bin endif
    autocmd BufWritePost *.bin if &bin | %!xxd
    autocmd BufWritePost *.bin set nomod | endif
augroup END

"function! SetLocalTagsLocation
"    if projectroot#get()
"        if projectroot#get()
"            echo 'Setting tag location to .workspace-artifacts'
"            execute 'setlocal tags=' . projectroot#get() . '/.workspace-artifacts/tags'
"            return
"        endif
"    endif
"        execute 'setlocal tags='
"endfunction

augroup Artifacts
  autocmd FileType c,cpp set commentstring=//\ %s
" autocmd FileType c,cpp execute 'setlocal tags=' . projectroot#get() . '/.workspace-artifacts/tags'
augroup END



" Sources {{{
runtime local.vim
"}}}





"set statusline=%F







"""""""""""""""""""""""""""""""""""""""""""""""""
" Start of the multi-line error message (%A),
" %p^ means a string of spaces and then a ^ to
" get the column number
"let &efm  = '%A%p^' . ','
" Next is the main bit: continuation of the error line (%C)
" followed by the filename in quotes, a comma (\,)
" then the rest of the details
"let &efm .= '%C"%f"\, line %l: error(%n): %m' . ','
"let &efm = ''
"let &efm .=  '%DEntering %f' . ','
"let &efm .= '%f:%l:%c: warning: %m' . ','
"let &efm .= '%f:%l:%c: error: %m' . ','
" Next is the last line of the error message, any number
" of spaces (' %#': equivalent to ' *') followed by a bit
" more error message
"let &efm .= '%Z %#%m' . ','

" This will push and pop directory paths of --print-directory
"let &efm .=  '%XExiting %f' . ','

" This just ignores any other lines (must be last!)
"let &efm .= '%-G%.%#' . ','

":let &makeprg="cat R:/Base-2B/dm-nvx-3x7x/app/build.log"
":make
