" Vim syntax file
" Language: 	Katahdin
" Maintainer:   Rainer Schuster (schuster-rainer@web.de)
" Updated:  	2010-12-01
"               Based on Tomas Restrepo (tomas@winterdom.com) boo syntax
"

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif


syn keyword katahdinStatement	option pattern 
syn keyword katahdinStatement	try catch new 
syn keyword katahdinStatement   precedence whitespace leftRecursive rightRecursive buildTextNodes recursive 
syn keyword katahdinSpecial     globals
syn keyword katahdinStatement	return field
syn keyword katahdinStatement	function method pattern nextgroup=katahdinFunction skipwhite
syn keyword katahdinClass   	module class this nextgroup=katahdinFunction skipwhite 
"syn keyword katahdinClass       module
syn match   katahdinFunction	"[a-zA-Z_][a-zA-Z0-9_]*" contained
syn keyword katahdinRepeat  	for while
syn keyword katahdinConditional	if else 
syn keyword katahdinPreCondit	import 
syn keyword katahdinOpWords 	in is as
"syn region  katahdinIdentifier  start=/[^A-Za-z0-9_]/ end=/:/

syn region  katahdinComment		start="/\*"  end="\*/" contains=katahdinTodo
syn match   katahdinComment		"//.*$" contains=katahdinTodo

syn keyword katahdinTodo    	TODO FIXME XXX contained

" strings
syn region katahdinString   	matchgroup=katahdinStringDel start=+[uU]\="+ end=+"+ skip=+\\\\\|\\"+ contains=kathadinEscape
"syn region katahdinString		start=+"+  end=+"+ end=+$+ 
syn match  katahdinEscape   	+\\[abfnrtv'"\\]+ contained

syn region katahdinRegex        matchgroup=katahdinRegexDel start="/\ze[^\/\*]" end="/" skip="\\/" contains=katahdinEscape

 " numbers (including longs and complex)
syn match   katahdinNumber	"\<0x\x\+[Ll]\=\>"
syn match   katahdinNumber	"\<\d\+[LljJ]\=\>"
syn match   katahdinNumber	"\.\d\+\([eE][+-]\=\d\+\)\=[jJ]\=\>"
syn match   katahdinNumber	"\<\d\+\.\([eE][+-]\=\d\+\)\=[jJ]\=\>"
syn match   katahdinNumber	"\<\d\+\.\d\+\([eE][+-]\=\d\+\)\=[jJ]\=\>"

syn keyword katahdinTypes	int byte short long object string 
syn keyword katahdinTypes  	uint ushort ulong sbyte date bool

syn keyword katahdinConstant	true false null

" built in functions and macros
syn keyword katahdinBuiltins    test assert throw throws print
syn sync maxlines=2000

if !exists("did_katahdin_syn_inits")
  let did_katahdin_syn_inits = 1

  " The default methods for highlighting.  Can be overridden later
  hi link katahdinClass         Type  
  hi link katahdinMeta          Statement 
  hi link katahdinTypes	        Type
  hi link katahdinStatement 	Statement
  hi link katahdinFunction	    Function
  hi link katahdinMethod	    Function
  hi link katahdinConditional	Conditional
  hi link katahdinRepeat	    Repeat
  hi link katahdinString	    String
  hi link katahdinEscape	    Special
  hi link katahdinOpWords       Operator
  hi link katahdinOperators	    Comment
  hi link katahdinConstant	    Constant
  hi link katahdinPreCondit	    Preproc
  hi link katahdinComment	    Comment
  hi link katahdinTodo		    Todo
  hi link katahdinSpecial       Special
  hi link katahdinAttribute     Identifier
  hi link katahdinIdentifier    Identifier
  hi link katahdinNumber	    Number
  hi link katahdinBuiltins      Statement 
  hi link katahdinMacros        Special 
endif

let b:current_syntax = "katahdin"

" vim: ts=4
