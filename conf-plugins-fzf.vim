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
