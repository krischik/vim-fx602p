"------------------------------------------------------------------------------
"  Description: Perform FX-602P and FX-603P specific completion & tagging.
"     Language: FX-602P and FX-603P calculator programs and printouts
"    Copyright: Copyright © 2007 … 2022 Martin Krischik
"   Maintainer: Martin Krischik <krischik@users.sourceforge.net>
"      Version: 0.1
"      History: 26.08.2022 MK A new FX-602P and FX-603P Filetype Bundle
"               02.10.2022 MK Move to deim compatbile github repository
"    Help Page: ft-fx602p-plugin
"------------------------------------------------------------------------------

if version < 700
   finish
endif

" Section: Setup keywords {{{1
"
let g:fx602p#Keywords = []
let g:fx602p#Matches  = []

" Prepare window position restoring command:
if (strlen(@%))
    let s:Go_Back= 'buffer! ' . bufnr("%")
else
    let s:Go_Back = 'enew!'
endif

setlocal nomodeline
enew!
execute "read " . expand('<sfile>:p')
let s:Buffer = bufnr("%")
setlocal modeline noswapfile modifiable

norm zR

norm gg

let s:Start_Line = search ('\C^=\{3,}\s\+START_KEYWORDS') + 1
let s:End_Line	 = search ('\C^=\{3,}\s\+END_KEYWORDS') - 1
let s:Lines	 = getline (s:Start_Line, s:End_Line)

for s:I in s:Lines
   let s:Keyword = matchlist(s:I, '\(\S\)\s\{}\(\S\{}\)\s\{}\(\S\{}\)\s\{}\(.*\)')
   let g:fx602p#Keywords += [{
      \ 'word':  s:Keyword[3],
      \ 'menu':  s:Keyword[2],
      \ 'info':  s:Keyword[4],
      \ 'kind':  s:Keyword[1],
      \ 'icase': 0}]
endfor

let s:Start_Line = search ('\C^=\{3,}\s\+START_MATCH') + 1
let s:End_Line	 = search ('\C^=\{3,}\s\+END_MATCH') - 1
let s:Lines	 = getline (s:Start_Line, s:End_Line)

for s:I in s:Lines
   let s:Match = matchlist(s:I, '\(\S\)\s\{}\(\S\{}\)\s\{}\(\S\{}\)\s\{}\(.*\)')
   let g:fx602p#Matches += [{
      \ 'pattern':   s:Match[3],
      \ 'menu':	     s:Match[2],
      \ 'info':	     s:Match[4],
      \ 'kind':	     s:Match[1],
      \ 'icase':     0}]
endfor

execute s:Go_Back
execute 'bwipeout! ' . s:Buffer

unlet s:Go_Back
unlet s:Buffer
unlet s:Start_Line
unlet s:End_Line
unlet s:Lines

unlet s:Keyword
unlet s:I

" Section: Insert Completions {{{1
"
" Section: fx602p#User_Complete(findstart, base) {{{2
"
" This function is used for the 'complete' option.
"
function fx602p#User_Complete(findstart, base)
   if a:findstart == 1
      "
      " locate the start of the word
      "
      let line = getline ('.')
      let start = col ('.') - 1
      while start > 0 && line[start - 1] =~ '\i\|'''
	 let start -= 1
      endwhile
      return start
   else
      "
      " look up matches
      "
      let l:Pattern = '^' . a:base . '.*$'
      "
      " add keywords
      "
      for Tag_Item in g:fx602p#Keywords
	 if l:Tag_Item['word'] =~? l:Pattern
	    if complete_add (l:Tag_Item) == 0
	       return []
	    endif
	    if complete_check ()
	       return []
	    endif
	 endif
      endfor
      return []
   endif
endfunction fx602p#User_Complete

" }}}1

lockvar! g:fx602p#Keywords
lockvar! g:fx602p#Matches

finish " 1}}}

=== START_KEYWORDS
d	label		LBL0	Label 0
d	label		LBL1	Label 1
d	label		LBL2	Label 2
d	label		LBL3	Label 3
d	label		LBL4	Label 4
d	label		LBL5	Label 5
d	label		LBL6	Label 6
d	label		LBL7	Label 7
d	label		LBL8	Label 8
d	label		LBL9	Label 9
d	program		P0	Program 0
d	program		P1	Program 1
d	program		P2	Program 2
d	program		P3	Program 3
d	program		P4	Program 4
d	program		P5	Program 5
d	program		P6	Program 6
d	program		P7	Program 7
d	program		P8	Program 8
d	program		P9	Program 9
d	program		P10	Program 10
d	program		P11	Program 11
d	program		P12	Program 12
d	program		P12	Program 12
d	program		P13	Program 13
d	program		P15	Program 15
d	program		P16	Program 16
d	program		P17	Program 17
d	program		P19	Program 19
c	repeat		DSZ	Decrement and skip on zero
c	repeat		ISZ	Increment and skip on zero
c	command		GOTO0	Go to Label 0
c	command		GOTO1	Go to Label 1
c	command		GOTO2	Go to Label 2
c	command		GOTO3	Go to Label 3
c	command		GOTO4	Go to Label 4
c	command		GOTO5	Go to Label 5
c	command		GOTO6	Go to Label 6
c	command		GOTO7	Go to Label 7
c	command		GOTO8	Go to Label 8
c	command		GOTO9	Go to Label 9
c	command		GSBP0	Go Sub Program 0
c	command		GSBP1	Go Sub Program 1
c	command		GSBP2	Go Sub Program 2
c	command		GSBP3	Go Sub Program 3
c	command		GSBP4	Go Sub Program 4
c	command		GSBP5	Go Sub Program 5
c	command		GSBP6	Go Sub Program 6
c	command		GSBP7	Go Sub Program 7
c	command		GSBP8	Go Sub Program 8
c	command		GSBP9	Go Sub Program 9
c	command		GSBP10	Go Sub Program 10
c	command		GSBP11	Go Sub Program 11
c	command		GSBP12	Go Sub Program 12
c	command		GSBP12	Go Sub Program 12
c	command		GSBP13	Go Sub Program 13
c	command		GSBP15	Go Sub Program 15
c	command		GSBP16	Go Sub Program 16
c	command		GSBP17	Go Sub Program 17
c	command		GSBP19	Go Sub Program 19
f	function	SIN	Sinus
f	function	COS	Cosinus
f	function	TAN	Tanges
f	function	ASN	Arc Sinus
f	function	ACS	Arc Cosinus
f	function	ATN	Arc Tanges
f	function	HYPSIN	Sinus Hyperbolicus
f	function	HYPCOS	Cosinus Hyperbolicus
f	function	HYPTAN	Tanges Hyperbolicus
f	function	LOG	10 logarithm
f	function	LN	natural logarithm
k	command		SAVE	Save program
k	command		LOAD	Load Program
k	command		RSSAVE	Save program
k	command		RSLOAD	Load Program
k	command		HLT	Load Program
k	command		PAUSE	Load Program
k	command		EXE	Execute
k	command		SEXE	Shift Execute
k	command		FEXE	2ndF Execute
f	operator	AND	Logical And
f	operator	NOT	Logical Not
f	operator	OR	Logical Or
f	operator	XOR	Exlusive Or
f	operator	NEG	Negate
f	operator	FRAC	Fracture
f	operator	INT	Integer
d	mode		DEG	Degree
d	mode		RAD	Radiants
d	mode		GRA	Gradians
d	mode		COMP	Floatingpoint
d	mode		BIN	Binary
d	mode		OCT	Octal
d	mode		DEC	Decimal
d	mode		HEX	Hexadecimal
v	constant	PI	π
d	command		AC	All Clear
d	command		IND	Indirect
f	function	cos	Cosinus (Printout)
f	function	cosH^-1	Arc Cosinus Hyperbolicus (Printout)
f	function	cos^-1	Arc Cosinus (Printout)
f	function	cosh	Cosinus Hyperbolicus (Printout)
f	function	ln	natural logarithm (Printout)
f	function	sin	Sinus (Printout)
f	function	sinH^-1	Arc Sinus Hyperbolicus (Printout)
f	function	sin^-1	Arc Sinus (Printout)
f	function	sinh	Sinus Hyperbolicus (Printout)
f	function	tan	Tanges (Printout)
f	function	tanH^-1	Arc Tanges Hyperbolicus (Printout)
f	function	tan^-1	Arc Tanges (Printout)
f	function	tanh	Tanges Hyperbolicus (Printout)
=== END_KEYWORDS

=== START_MATCH
c	command		\<GSB(0)\>	Go Sub indirect M00
c	conditional	\<X=0\>		x equal 0
c	conditional	\<X=F\>		x equal F
c	conditional	\<X>=0\>	x greater equal 0
c	conditional	\<X>=F\>	x greater equal F
f	function	\<10^X\>	10 power x
f	function	\<X<>Y\>	x exchange y
f	function	\<X^2\>		x power 2
f	function	\<e^X\>		e power x
f	operator	\<P>R\>		polar to rectangle
f	operator	\<R>P\>		rectangle to polar
v	variable	\<M+\dF\>	Memory plus in F
v	variable	\<M+\d\d\>	Memory plus iu M
v	variable	\<M-\dF\>	Memory minus in F
v	variable	\<M-\d\d\>	Memory minus in M
v	variable	\<MR\dF\>	Memory recall F
v	variable	\<MR\d\d\>	Memory recall M
v	variable	\<Min\dF\>	Memory in F
v	variable	\<Min\d\d\>	Memory in M
v	variable	\<X<>M\dF\>	X exchange F
v	variable	\<X<>M\d\d\>	X exchange M
v	variable	\<\[AR\dF\]\>	alpha recall F
v	variable	\<\[AR\d\d\]\>	alpha recall M
c	conditional	\<x=0\>		x equal 0 (Printout)
c	conditional	\<x=F\>		x equal F (Printout)
c	conditional	\<x>=0\>	x greater equal 0 (Printout)
c	conditional	\<x>=F\>	x greater equal F (Printout)
f	function	\<X↔Y\>		x exchange y (Printout)
f	function	\<e^x\>		e power x (Printout)
f	function	\<x²\>		x power 2 (Printout)
f	operator	\<P→R\>		polar to rectangle (Printout)
f	operator	\<R→P\>		rectangle to polar (Printout)
v	variable	\<X↔M\dF\>	X exchange F (Printout)
v	variable	\<X↔M\d\d\>	X exchange M (Printout)
=== END_MATCH

	v	variable
	f	function or method
	m	member of a struct or class
	t	typedef
	d	#define or macro

"------------------------------------------------------------------------------
"   Vim is Charityware - see ":help license" or uganda.txt for licence details.
"------------------------------------------------------------------------------
" vim: set nowrap tabstop=8 shiftwidth=3 softtabstop=3 noexpandtab :
" vim: set textwidth=78 fileformat=unix filetype=vim foldmethod=marker nospell :
