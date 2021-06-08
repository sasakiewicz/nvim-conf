
function! ShowHex()
    let digit = expand("<cword>")
    echo printf('hex: %x, decimal:%d', digit, digit)
endfunction

command! FixNewline  :%s/\r/\r/  |:nohlsearch
command! FixTrailing :%s/\s*$//  |:nohlsearch
command! FixTabs     :%s/\t/    /|:nohlsearch
command! DeleteFile  :call delete(expand('%')) | bdelete!


command! ShowHex :call ShowHex()
