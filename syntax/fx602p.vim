"------------------------------------------------------------------------------
"  Description: Vim syntax file for FX-602P and FX-603P
"     Language: FX-602P and FX-603P calculator programs and printouts
"    Copyright: Copyright © 2007 … 2022 Martin Krischik
"   Maintainer: Martin Krischik <krischik@users.sourceforge.net>
"      Version: 0.0
"      History: 26.08.2022 MK A new FX-602P and FX-603P Filetype Bundle
"               02.10.2022 MK Move to deim compatbile github repository
"    Help Page: ft-fx602p-plugin
"------------------------------------------------------------------------------

if exists("b:current_syntax") || version < 700
    finish
endif

let b:current_syntax = "fx602p"

syntax case match

syntax match fx602pComment                /^All Program List$/
syntax match fx602pComment                /^Memory List$/
syntax match fx602pComment                /^END$/

syntax match fx602pNumber                 /\s[0-9.]\{-1,}\s/hs=s+1,he=e-1
syntax match fx602pNumber                 /^[0-9.]\{-1,}\s/he=e-1
syntax match fx602pNumber                 /\s[0-9.]\{-1,}$/hs=s+1
syntax match fx602pNumber                 /^[0-9.]\{-1,}$/

syntax match fx602pString		  /".\{-}"/

syntax match fx602pOperator               /\(\s\|\n\)[-+*\/=]\(\s\|\n\)/hs=s+1,he=e-1
syntax match fx602pOperator               /\<[-+*/=]\>/
syntax match fx602pOperator               /+\/-/

" Printout alternatives

syntax match fx602pOperator               /\<[×÷±]\>/


for b:Item in g:fx602p#Keywords
    if b:Item['menu'] == "conditional"
        execute "syntax keyword fx602pConditional "        . b:Item['word']
    elseif  b:Item['menu'] == "function"
        execute "syntax keyword fx602pFunction "           . b:Item['word']
    elseif  b:Item['menu'] == "program"
        execute "syntax keyword fx602pProgram "            . b:Item['word']
    elseif b:Item['menu'] == "operator"
        execute "syntax keyword fx602pOperator "           . b:Item['word']
    elseif b:Item['menu'] == "label"
        execute "syntax keyword fx602pLabel "              . b:Item['word']
    elseif b:Item['menu'] == "command"
        execute "syntax keyword fx602pCommand "            . b:Item['word']
    elseif b:Item['menu'] == "mode"
        execute "syntax keyword fx602pMode "               . b:Item['word']
    elseif b:Item['menu'] == "repeat"
        execute "syntax keyword fx602pRepeat "             . b:Item['word']
    elseif b:Item['menu'] == "constant"
        execute "syntax keyword fx602pConstant "           . b:Item['word']
    elseif b:Item['menu'] == "variable"
        execute "syntax keyword fx602pVariable "           . b:Item['word']
    endif
endfor

for b:Item in g:fx602p#Matches
    if b:Item['menu'] == "conditional"
        execute "syntax match fx602pConditional /"        . b:Item['pattern'] . "/"
    elseif  b:Item['menu'] == "function"
        execute "syntax match fx602pFunction /"           . b:Item['pattern'] . "/"
    elseif  b:Item['menu'] == "program"
        execute "syntax match fx602pProgram /"            . b:Item['pattern'] . "/"
    elseif b:Item['menu'] == "operator"
        execute "syntax match fx602pOperator /"           . b:Item['pattern'] . "/"
    elseif b:Item['menu'] == "label"
        execute "syntax match fx602pLabel /"              . b:Item['pattern'] . "/"
    elseif b:Item['menu'] == "command"
        execute "syntax match fx602pCommand /"            . b:Item['pattern'] . "/"
    elseif b:Item['menu'] == "mode"
        execute "syntax match fx602pMode /"               . b:Item['pattern'] . "/"
    elseif b:Item['menu'] == "repeat"
        execute "syntax match fx602pRepeat /"             . b:Item['pattern'] . "/"
    elseif b:Item['menu'] == "constant"
        execute "syntax match fx602pConstant /"           . b:Item['pattern'] . "/"
    elseif b:Item['menu'] == "variable"
        execute "syntax match fx602pVariable /"           . b:Item['pattern'] . "/"
    endif
endfor

highlight def link fx602pOperator          Operator
highlight def link fx602pLabel             Label
highlight def link fx602pLabelMark         Label
highlight def link fx602pCmdDivider        Special
highlight def link fx602pConditional       Conditional
highlight def link fx602pDotBoolOp         Boolean
highlight def link fx602pRepeat            Repeat
highlight def link fx602pStatement         Statement
highlight def link fx602pTodo              Todo
highlight def link fx602pString            String
highlight def link fx602pNumber            Number
highlight def link fx602pComment           Comment
highlight def link fx602pArgument          Structure
highlight def link fx602pVariable          Identifier
highlight def link fx602pEcho              String
highlight def link fx602pProgram           Type
highlight def link fx602pFunction          Function
highlight def link fx602pConstant          Constant
highlight def link fx602pSpecialVar        Special
highlight def link fx602pCommand           Keyword
highlight def link fx602pMode              PreProc

finish

"------------------------------------------------------------------------------
"   Vim is Charityware - see ":help license" or uganda.txt for licence details.
"------------------------------------------------------------------------------
" vim: set nowrap tabstop=8 shiftwidth=3 softtabstop=3 noexpandtab :
" vim: set textwidth=78 fileformat=unix filetype=vim foldmethod=marker nospell :
