" statusline

function! FileSize(bytes)
    let l:bytes = a:bytes | let l:sizes = ['B', 'KB', 'MB', 'GB'] | let l:i = 0
    while l:bytes >= 1024 | let l:bytes = l:bytes / 1024.0 | let l:i += 1 | endwhile
    return l:bytes > 0 ? printf(' %.1f%s ', l:bytes, l:sizes[l:i]) : ''
endfunction

function! ActiveStatus()
    let statusline=""
    let statusline.="%1*"
    let statusline.="%(%{'help'!=&filetype?'\ \ '.bufnr('%'):''}\ %)"
    let statusline.="%2*"
    let statusline.="\ %<"
    let statusline.="%f"
    let statusline.="\ %3*"
    let statusline.="%{&readonly?'\ ':''}"
    let statusline.="%{&modified?'\ *':''}"
    " right side
    let statusline.="%="
    let statusline.="\ %2*"
    let statusline.="\ %{''!=#&filetype?&filetype:'none'}"
    let statusline.="\ %1*"
    let statusline.="\ Ln %l,Col %c:Tot %L\ "
    let statusline.="\ %2*"
    let statusline.="%{FileSize(line2byte('$')+len(getline('$')))}"
    return statusline
endfunction

function! InactiveStatus()
    let statusline=""
    let statusline.="%(%{'help'!=&filetype?'\ \ '.bufnr('%'):''}\ %)"
    let statusline.="|\ %<"
    let statusline.="%f"
    let statusline.="%{&readonly?'\ ':''}"
    let statusline.="%{&modified?'\ *':''}"
    " right side
    let statusline.="%="
    let statusline.="\ %{''!=#&filetype?&filetype:'none'}"
    let statusline.="\ | Ln %l,Col %c:Tot %L\ "
    let statusline.="|%{FileSize(line2byte('$')+len(getline('$')))}"
    return statusline
endfunction

set laststatus=2
set statusline=%!ActiveStatus()
hi User1 guibg=#A6A8AA guifg=#282c34
hi User2 guibg=#444648 guifg=#FFFFFF
hi User3 guibg=#323436 guifg=#e06c75

augroup status
    autocmd!
    autocmd FocusGained,VimEnter,WinEnter,BufWinEnter * setlocal statusline=%!ActiveStatus()
    autocmd FocusLost,VimLeave,WinLeave,BufWinLeave * setlocal statusline=%!InactiveStatus()
augroup END


