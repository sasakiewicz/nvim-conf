
function! ShowHex()
    let digit = expand("<cword>")
    echo printf('hex: %x, decimal:%d', digit, digit)
endfunction

command! FixNewline  :%s/\r/\r/  |:nohlsearch
command! FixTrailing :%s/\s\+$//  |:nohlsearch
command! FixTabs     :%s/\t/    /|:nohlsearch
command! DeleteFile  :call delete(expand('%')) | bdelete!


set expandtab
set softtabstop=4
set tabstop=4
let c_space_errors=1
highlight RedundantSpaces ctermbg=red guibg=red
match RedundantSpaces /\s\+$\| \+\ze\t/


command! ShowHex :call ShowHex()
