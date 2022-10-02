"------------------------------------------------------------------------------
"  Description: Perform FX-602P and FX-603P specific completion & tagging.
"     Language: FX-602P and FX-603P calculator programs and printouts
"    Copyright: Copyright © 2007 … 2022 Martin Krischik
"   Maintainer: Martin Krischik <krischik@users.sourceforge.net>
"      Version: 1.0
"      History: 26.08.2022 MK A new FX-602P and FX-603P Filetype Bundle
"    Help Page: ft-fx602p-plugin
"------------------------------------------------------------------------------

" Only do this when not done yet for this buffer
if exists ("b:did_ftplugin") || version < 700
   finish
endif

" Don't load another plugin for this buffer
let b:did_ftplugin = 45

"
" Temporarily set cpoptions to ensure the script loads OK
"
let s:cpoptions = &cpoptions
set cpoptions-=C

" Section: Keywords  {{{1
"
"setlocal iskeyword="a-z,A-Z,48-57,/,<,>,^,#,(,),="

" Section: Comments  {{{1
"

" Section: case	     {{{1
"
setlocal nosmartcase
setlocal noignorecase

" Section: formatoptions {{{1
"
setlocal fileformats=mac,dos
setlocal wrap

" Section: Folding {{{1
"

" 1}}}
" Reset cpoptions
let &cpoptions = s:cpoptions
unlet s:cpoptions

finish " 1}}}

"------------------------------------------------------------------------------
"   Vim is Charityware - see ":help license" or uganda.txt for licence details.
"------------------------------------------------------------------------------
" vim: set nowrap tabstop=8 shiftwidth=3 softtabstop=3 noexpandtab :
" vim: set textwidth=78 fileformat=unix filetype=vim foldmethod=marker nospell :
