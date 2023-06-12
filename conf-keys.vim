
"
" Terminal
" LUA " tnoremap <Esc> <C-\><C-n>
" LUA " tnoremap <C-h> <C-\><C-n>:wincmd h<CR>
" LUA " tnoremap <C-j> <C-\><C-n>:wincmd j<CR>
" LUA " tnoremap <C-k> <C-\><C-n>:wincmd k<CR>
" LUA " tnoremap <C-l> <C-\><C-n>:wincmd l<CR>

" nnoremap  <F8>  :make! \| :copen \| :cbot \| wincmd p<CR>
" LUA " nnoremap  <F8>  :make! \| :bot copen 25<CR>
" LUA " nnoremap  <S-F8>  :cclose<CR>
" LUA " 
" LUA " nnoremap  <F11>  :DiffviewOpen<CR>
" LUA " nnoremap  <S-F11>  :DiffviewClose<CR>
" LUA " nnoremap  <F12>  :Flogsplit<CR>
" LUA " nnoremap  <F5>  :FloatermToggle<CR>
" LUA " tnoremap  <F5> <C-\><C-n>:FloatermToggle<CR>


" LUA: function! s:CloseGit()
" LUA: 	for l:winnr in range(1, winnr('$'))
" LUA: 		if !empty(getwinvar(l:winnr, 'fugitive_status'))
" LUA: 			execute l:winnr.'close'
" LUA:         endif
" LUA: 	endfor
" LUA: endfunction
" LUA: 
" LUA: nnoremap <F10>   :G<CR>
" LUA: nnoremap <S-F10> :call <SID>CloseGit()<CR>
" LUA: 
" LUA: nnoremap  <F7>  :make! flash<CR>
" LUA: nnoremap  <S-F7>  :make! debug<CR>
" LUA: 
" LUA: " Text Yank & Insert
" LUA: nnoremap <leader>v :let @+ = expand("%:t") . ':' . line(".")<CR>
" LUA: nnoremap <leader>vc :let @+ = ''<CR>
" LUA: nnoremap <leader>vt :let @+ = @+ . line(".") . ':' . getline(".")<CR>
" LUA: 
" LUA: nnoremap <leader>it a<c-r>=expand("%:t")<CR><ESC>
" LUA: nnoremap <leader>yt :let @+ = expand("%:t")<CR>
" LUA: 
" LUA: nnoremap <leader>ip a<c-r>=expand("%:f")<CR><ESC>
" LUA: nnoremap <leader>yp :let @+ = expand("%:f")<CR>
" LUA: 
" LUA: 
" LUA: nnoremap <leader>if a<c-r>=expand("%:t") . ':' . line(".")<CR><ESC>
" LUA: nnoremap <leader>yf :let @+ = expand("%:t") . ':' . line(".")<CR>
" LUA: nnoremap <leader>yF :let @+ = @+ . expand("%:t") . ':' . line(".")<CR>
" LUA: 
" LUA: 
" LUA: "inoremap <leader>if <c-r>=expand("%:t")<cr>
" LUA: vnoremap <leader>it da<c-r>=expand("%:t")<CR><ESC>
" LUA: 
" LUA: nnoremap <leader>id a<C-R>=strftime("%m/%d/%y")<CR><ESC>
" LUA: ""inoremap <leader>id <C-R>=strftime("%m/%d/%y")<CR>
" LUA: vnoremap <leader>id da<C-R>=strftime("%m/%d/%y")<CR><ESC>
" LUA: 
" LUA: nnoremap <leader>il a<C-R>=line('.')1<CR><ESC>
" LUA: nnoremap <leader>ib a--------------------------------------------------------------------------------<CR><ESC>
" LUA: 
" LUA: "    Insert Mode Movement
" LUA: inoremap <silent> <C-L> <Right>
" LUA: inoremap <silent> <C-H> <Left>
" LUA: inoremap <silent> <C-K> <Up>
" LUA: inoremap <silent> <C-J> <Down>
" LUA: 
" LUA: nnoremap <silent> <C-J> :wincmd j<CR>
" LUA: nnoremap <silent> <C-K> :wincmd k<CR>
" LUA: nnoremap <silent> <C-L> :wincmd l<CR>
" LUA: nnoremap <silent> <C-H> :wincmd h<CR>
" LUA: 
" LUA: 
" LUA: "    Remove Inconvenient Keys
" LUA: nnoremap <F1> <nop>
" LUA: 
" LUA: "
" LUA: "    Up & Down Movements
" LUA: "
" LUA: nnoremap <silent> K <C-U>
" LUA: nnoremap <silent> J <C-D>
" LUA: nnoremap j gj
" LUA: nnoremap k gk
" LUA: 
" LUA: "
" LUA: " Buffer management
" LUA: "
" LUA: nnoremap <silent> <C-s> :bd<CR>
" LUA: nnoremap <silent> <leader>s :BDelete<CR>
" LUA: nnoremap <silent> <C-d> :q<CR>
" LUA: 
" LUA: nnoremap <silent> zz ZZ
" LUA: nnoremap <silent> <leader>/ :nohlsearch<CR>
" LUA: 
" LUA: 
" LUA: 
" LUA: noremap <Leader>p viw"0p
" LUA: noremap <Leader>P viw"0P
" LUA: vnoremap <Leader>p "0p
" LUA: vnoremap <Leader>P "0P
" LUA: 
" LUA: " Change Word under cursor
" LUA: nnoremap <leader>cw :normal!viw"py<ESC>:%s/\<<c-r>p\>/<c-r>p/<left>
" LUA: 
" LUA: " Change Text Under cursor
" LUA: nnoremap <leader>ct :normal!viw"py<ESC>:%s/<c-r>p/<c-r>p/<left>
" LUA: vnoremap <leader>ct :normal!"py<ESC>:%s/<c-r>p/<c-r>p/<left>
" LUA: 
" LUA: nnoremap <silent> <leader>nv :vnew <CR>
" LUA: nnoremap <silent> <leader>nh :new <CR>
" LUA: nnoremap <silent> <leader>nt :tabnew <CR>
" LUA: 
" LUA: nnoremap <silent> <leader>z :foldmethod=
" LUA: 
" LUA: 
" LUA: function! SwitchSource()
" LUA:     let b:ext = expand('%:t:e') 
" LUA:     let b:file = expand('%:t:r') 
" LUA:     let b:head = expand('%:r') 
" LUA:     let b:switch = ''
" LUA: 
" LUA:     if b:ext == 'h' || b:ext == 'hpp'
" LUA:         if filereadable(b:head . '.c')
" LUA:             let b:switch = b:head . '.c'
" LUA:         elseif filereadable(b:head . '.cpp')
" LUA:             let b:switch = b:head . '.cpp'
" LUA:         endif
" LUA: 
" LUA:     elseif b:ext == 'c' || b:ext == 'cpp'
" LUA:         if filereadable(b:head . '.h')
" LUA:             let b:switch = b:head . '.h'
" LUA:         elseif filereadable(b:head . '.hpp')
" LUA:             let b:switch = b:head . '.hpp'
" LUA:         endif
" LUA:     endif
" LUA:     if !empty(b:switch)
" LUA:         :execute 'edit' b:switch
" LUA:     endif
" LUA: "    if l:ext =~ '^h$' || l:ext =~ '^hpp$'
" LUA: "    :execute(':tselect /\v' . expand('%:t:r') . '\.(cpp\|c)')
" LUA: "elseif l:ext =~ '^c$' || l:ext =~ '^cpp$'
" LUA: "    :execute(':tselect /\v' . expand('%:t:r') . '\.(hpp\|h)')
" LUA: "endif
" LUA: endfunction
" LUA: nnoremap <leader>[ :ClangdSwitchSourceHeader<CR>
" LUA: 
" LUA: 
" LUA: nnoremap <leader>wo :execute ':edit' system('lua ~/Log/tasks.lua filename')<CR>
" LUA: nnoremap <leader>wm :normal! I <esc>
" LUA: nnoremap <leader>wd :normal! 0r <esc>
" LUA: nnoremap <leader>wa :normal! I <esc>
" LUA: 
" LUA: 
" LUA: vnoremap <Leader>at :LiveEasyAlign<CR>
" LUA: 
" LUA: nnoremap <F1> :silent Telescope help_tags<CR>
" LUA: nnoremap <F3> :silent q<CR>
" LUA: nnoremap <F4> :silent tabclose<CR>
" LUA: nnoremap <S-F4> :silent %bd<CR>
" LUA: 
" LUA: nnoremap <leader>yb :Telescope git_branches<CR>
" LUA: nnoremap <leader>ys :Telescope git_status<CR>
" LUA: nnoremap <leader>yc :Telescope git_commits<CR>
" LUA: 

"nnoremap <silent>ZZ :windo q<CR>

"
" Info
"
" A-K   Lookup help for word under cursor
