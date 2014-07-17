" Many change colors from index 0 to 15.
" Use only colors from index 16 to 255.
let s:black="16"
let s:background="233"
let s:foreground="254"
let s:lighterThanBackground="234"
let s:lessSignificant="238"
let s:significant="243"
let s:moreSignificant="231"
let s:standoutLight="228"
let s:standoutDark="202"

let s:syntaxRed="203"
let s:syntaxOrange="166"
let s:syntaxYellow="229"
let s:syntaxGreen="35"
let s:syntaxBlue="117"
let s:syntaxViolet="135"
let s:syntaxGray=s:significant
let s:syntaxPinkGray="189"
let s:syntaxWhite=s:moreSignificant

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let colors_name = "nbd"

" Highlighting function
fun <sid>hi(group, ctermfg, ctermbg, attr)
  if a:ctermfg != ""
    exec "hi " . a:group . " ctermfg=" . a:ctermfg
  endif
  if a:ctermbg != ""
    exec "hi " . a:group . " ctermbg=" . a:ctermbg
  endif
  if a:attr != ""
    exec "hi " . a:group . " cterm=" . a:attr
  else
    exec "hi " . a:group . " cterm=NONE"
  endif
endfun

" Vim Editor Colors
call <sid>hi("Bold", "", "", "bold")
call <sid>hi("ColorColumn", "", s:lighterThanBackground, "")
call <sid>hi("CursorLine", "", s:lighterThanBackground, "")
call <sid>hi("CursorLineNr", s:lessSignificant, s:lighterThanBackground, "bold")
call <sid>hi("IncSearch", "", s:standoutLight, "")
call <sid>hi("Search", "", s:moreSignificant, "")
call <sid>hi("Italic", "", "", "italic")
call <sid>hi("LineNr", s:lessSignificant, s:background, "")
call <sid>hi("Normal", s:foreground, s:background, "")
call <sid>hi("NonText", s:moreSignificant, s:background ,"")
call <sid>hi("PMenu", s:significant, s:black, "none")
call <sid>hi("PMenuSel", s:black, s:standoutLight, "")
call <sid>hi("StatusLine", s:black, s:moreSignificant, "none")
call <sid>hi("StatusLineNC", s:black, s:lessSignificant, "none")
call <sid>hi("VertSplit", s:black, s:lessSignificant, "none")
call <sid>hi("Visual", "", s:lessSignificant, "")
call <sid>hi("VisualNOS", "", s:moreSignificant, "")
call <sid>hi("WildMenu", "", s:standoutDark, "")

" Syntax Highlighting
call <sid>hi("Boolean", s:syntaxBlue, "", "")
call <sid>hi("Comment", s:syntaxGray, "", "")
call <sid>hi("Constant", s:syntaxViolet, "", "")
call <sid>hi("Function", s:syntaxYellow, "", "")
call <sid>hi("Identifier", s:syntaxPinkGray, "", "")
call <sid>hi("Keyword", s:syntaxBlue, "", "")
call <sid>hi("Number", s:syntaxRed, "", "")
call <sid>hi("PreProc", s:syntaxBlue, "", "")
call <sid>hi("Statement", s:syntaxBlue, "", "")
call <sid>hi("String", s:syntaxYellow, "", "")
call <sid>hi("Todo", s:black, s:standoutLight, "bold")

" Remove functions
delf <sid>hi

" Remove Color Variables
unlet s:black s:background s:foreground s:lighterThanBackground s:lessSignificant s:significant s:moreSignificant s:standoutLight s:standoutDark s:syntaxRed s:syntaxOrange s:syntaxYellow s:syntaxGreen s:syntaxBlue s:syntaxViolet s:syntaxGray s:syntaxPinkGray s:syntaxWhite
