" Vim indent file
" Language: RISC-V Assembly
"

" Only load this indent file when no other was loaded.
if exists("b:did_indent")
  finish
endif
let b:did_indent = 1

setlocal indentexpr=GetRiscvIndent()
setlocal indentkeys=<:>,0#,!^F,o,O
setlocal indentkeys+==include,=pragma,=error,=warning,=line,=define,=undef
setlocal indentkeys+==if,=else,=elif,=endif

if exists("*GetRiscvIndent")
  finish
endif

let s:cpo_save = &cpo
set cpo&vim

function! s:buffer_shiftwidth()
  return &shiftwidth
endfunction

function! s:InsideBlockComment(lnum)
  return synIDattr(synID(a:lnum, 1, 0), "name") == "riscvComment"
endfunction

function! s:GetPrevIndentLineNum( line_num )

  let SKIP_LINES = '^\s*\(\/\*\|\/\/\|#\|\*\/\|[0-9a-zA-Z_$.]\+:\)'

  let nline = a:line_num
  while nline > 0
    let nline = prevnonblank(nline-1)
    if getline(nline) !~? SKIP_LINES
      if !s:InsideBlockComment(nline)
        break
      endif
    endif
  endwhile

  return nline
endfunction

function! GetRiscvIndent()
  let line = getline(v:lnum)
  let ind = 0

  " If the line is first line, then don't indent
  if v:lnum == 1
    return ind
  endif

  " If the line is a label (starts with ':' terminated keyword), then don't indent
  if line =~ '^\s*[0-9a-zA-Z_$.]\+:'
    return ind
  endif

  " If the line is a pre-processor, then don't indent
  if line =~ '^\s*#\s*\(include\|pragma\|error\|warning\|line\|define\|undef\|if\|else\|elif\|endif\|ifdef\|ifndef\)\>'
    return ind
  endif

  if s:InsideBlockComment(v:lnum)
    if line !~ '^\s*\/\*'
      if getline(prevnonblank(v:lnum-1)) =~ '^\s*\/\*' && line =~ '^\s*\*'
        let ind = indent(prevnonblank(v:lnum-1)) + 1
      else
        let ind = indent(prevnonblank(v:lnum-1))
      endif
    else
      let ind = indent(s:GetPrevIndentLineNum(v:lnum))
    endif
  else
    let ind = indent(s:GetPrevIndentLineNum(v:lnum))
  endif

  return ind
endfunction

let &cpo = s:cpo_save
unlet s:cpo_save
