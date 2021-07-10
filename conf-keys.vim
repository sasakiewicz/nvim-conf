
"
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

"    Insert Mode Movement
inoremap <silent> <C-L> <Right>
inoremap <silent> <C-H> <Left>
inoremap <silent> <C-K> <Up>
inoremap <silent> <C-J> <Down>

nnoremap <silent> <C-J> :wincmd j<CR>
nnoremap <silent> <C-K> :wincmd k<CR>
nnoremap <silent> <C-L> :wincmd l<CR>
nnoremap <silent> <C-H> :wincmd h<CR>

"    Remove Inconvenient Keys
nnoremap <F1> <nop>

"
"    Up & Down Movements
"
nnoremap <silent> K <C-U>
nnoremap <silent> J <C-D>
nnoremap j gj
nnoremap k gk

"
" Buffer management
"
nnoremap <silent> <C-s> :bd<CR>
nnoremap <silent> <leader>s :BDelete<CR>
nnoremap <silent> <C-d> :q<CR>

nnoremap <silent> <leader>/ :nohlsearch<CR>


nnoremap <silent> <Enter> :w<CR>

" Yank / Cut / Paste
" use register 0 which contains the last yanked text
" does not include last yank, change, delete, overwrite...
noremap <Leader>p "0p
noremap <Leader>P "0P
vnoremap <Leader>p "0p

nnoremap <silent> <Enter> :w<CR>

nnoremap <silent> <leader>z :foldmethod=

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
nnoremap <leader>[ :call SwitchSource()<CR>

"nnoremap <silent>ZZ :windo q<CR>

"
" Info
"
" A-K   Lookup help for word under cursor
