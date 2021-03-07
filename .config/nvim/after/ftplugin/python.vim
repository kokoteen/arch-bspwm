set tabstop=4 softtabstop=4
set shiftwidth=4
set smartindent
setlocal colorcolumn=80
highlight Normal ctermfg=grey ctermbg=black

setlocal wildignore=*.pyc

set include=^\\s*\\(from\\\|import\\)\\s*\\zs\\(\\S\\+\\s\\{-}\\)*\\ze\\($\\\|\ as\\)
function! PyInclude(fname)
    " import conv.metrics (1)
    " /conv.metrics/    > matched part
    " conv/metrics.py
    " from conv import conversion as conv (2)
    " /conv import conversion/      > matched part
    " conv/conversion.py OR conv.py
    let parts = split(a:fname, ' import ') " (1) [conv.metrics] (2) [conv, conversion]
    let l = parts[0] " (1) conv.metrics (2) conv
    if len(parts) > 1
        let r = parts[1] " conversion
        let joined = join([l, r], '.') " conv.conversion
        let fp = substitute(joined, '\.', '/', 'g') . '.py'
        let found = glob(fp, 1)
        if len(found)
            return found
        endif
    endif
    return substitute(l, '\.', '/', 'g') . '.py'
endfunction
setlocal includeexpr=PyInclude(v:fname)
setlocal define=^\\s*\\<(def\\\|class\\)\\>
