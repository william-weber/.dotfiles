" Vim syntax file
" Language:	tpl
" Version:	5.4-1
" Maintainer:	Dr. Charles E. Campbell, Jr. <Charles.E.Campbell.1@gsfc.nasa.gov>
" Last Change:	April 23, 1999

" Removes any old syntax stuff hanging around
syn clear

" Read the C syntax to start with
runtime syntax/c.vim
  
" A bunch of useful tpl keywords
syn keyword	aopStatement	aop
syn keyword	mfsStatement	mfs 
syn keyword	coStatement	co
syn keyword	roStatement	ro

syn keyword	aopFunction     Activate Write Tag InsertImports alu
syn keyword	aopFunction     Shift pdTransfer RTS PUSH POP FOR ENDFOR
syn keyword	aopFunction     Segmentation Read Alternate

syn keyword	coKeyword     Get Put

syn keyword	aopKeyword     Dump Matching Binary Normal All Load
syn keyword	aopKeyword     Mismatching 
syn keyword	aopKeyword     Ternary Bit Byte dByte Word Mask ab
syn keyword	aopKeyword     Complement Exchange
syn keyword	aopKeyword     Neighbour First ToEnd ToEndIncFirst
syn keyword	aopKeyword     Leftwards Rightwards
syn keyword	aopKeyword     Link Span SpanIncFirst

syn keyword	rtsFunction    Assign Move Plus Sub Mult Neg
syn keyword	rtsFunction    And Or Xor
syn keyword	rtsFunction    lt le gt ge
syn keyword	rtsFunction    Count Min Max

syn keyword	rtsKeyword     Bitset Card Int Real LongReal

syn keyword	aopType        mfs_t
syn keyword	aopConstant    tr1 tr2 tr3
syn keyword	aopStorageclass gswFifo lswFifo RdFifo pdtRdv sdtRdv
syn keyword	aopStorageclass None Seg16 agBus ScalarChannel ioChannel String

syn region	aopDefine		start="^\s*#\s*\(mfs\)\>" skip="\\$" end="$" contains=ALLBUT,@cPreProcGroup

syn region	spPreCondit	start="^\s*#\s*\(sp_if\|sp_ifdef\|sp_ifndef\|sp_elif\)\>" skip="\\$" end="$" end="//"me=s-1 contains=cComment,cCppString,cCharacter,cCppParen,cParenError,cNumbers,cCommentError,cSpaceError
syn match	spPreCondit	"^\s*#\s*\(sp_else\|sp_endif\)\>"
syn region	spIncluded	contained start=+"+ skip=+\\\\\|\\"+ end=+"+
syn match	spIncluded	contained "<[^>]*>"
syn match	spInclude	"^\s*#\s*sp_include\>\s*["<]" contains=cIncluded
"syn match cLineSkip	"\\$"
syn cluster	spPreProcGroup	contains=cPreCondit,cIncluded,cInclude,cDefine,cErrInParen,cErrInBracket,cUserLabel,cSpecial,cOctalZero,cCppOut,cCppOut2,cCppSkip,cFormat,cNumber,cFloat,cOctal,cOctalError,cNumbersCom,cString,cCommentSkip,cCommentString,cComment2String,@cCommentGroup,cParen,cBracket

syn region	spDefine		start="^\s*#\s*\(sp_define\|sp_undef\)\>" skip="\\$" end="$" contains=ALLBUT,@cPreProcGroup
syn region	spPreProc	start="^\s*#\s*\(sp_pragma\>\|sp_line\>\|sp_warning\>\|sp_warn\>\|sp_error\>\)" skip="\\$" end="$" keepend contains=ALLBUT,@cPreProcGroup

"ternary number
"syn match	cNumber		contained "0x\x\+\(u\=l\{0,2}\|ll\=u\)\>"

if !exists("did_tpl_syntax_inits")
 let did_tpl_syntax_inits = 1
  hi link aopStatement	Special
  hi link mfsStatement	Special
  hi link coStatement	Special
  hi link roStatement	Special
  hi link aopFunction Function
  hi link rtsFunction Function
  hi link aopKeyword Keyword
  hi link coKeyword Keyword
  hi link rtsKeyword Keyword
  hi link aopDefine Macro
  hi link aopType Type
  hi link aopConstant Constant
  hi link aopStorageclass StorageClass
  hi link spInclude	Include
  hi link spPreProc	PreProc
  hi link spDefine	Macro
  hi link spIncluded	cString
endif

let b:current_syntax = "tpl"

" vim: ts=8
