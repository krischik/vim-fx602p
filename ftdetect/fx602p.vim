"------------------------------------------------------------------------------
"  Description: Vim FX-602P and FX-603P detection file
"     Language: FX-602P and FX-603P calculator programs and printouts
"    Copyright: Copyright © 2007 … 2022 Martin Krischik
"   Maintainer: Martin Krischik <krischik@users.sourceforge.net>
"      Version: 0.0
"      History: 26.08.2022 MK A new FX-602P and FX-603P Filetype Bundle
"               02.10.2022 MK Move to deim compatbile github repository
"    Help Page: ft-fx602p-plugin
"------------------------------------------------------------------------------

if exists("s:loaded_ftdetect_fx602p")
    finish
endif

let s:loaded_ftdetect_fx602p=25

   autocmd BufNewFile,BufRead *.[adp][ft] set filetype=fx602p

finish " 1}}}

"------------------------------------------------------------------------------
"   Vim is Charityware - see ":help license" or uganda.txt for licence details.
"------------------------------------------------------------------------------
" vim: set nowrap tabstop=8 shiftwidth=3 softtabstop=3 noexpandtab :
" vim: set textwidth=78 fileformat=unix filetype=vim foldmethod=marker nospell :
