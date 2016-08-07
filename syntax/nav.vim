" Vim syntax file
" Language: nav configuration file
" Maintainer: Kevin Vollmer
" Last Change: 04-08-2016
" License: This file is placed in the public domain.

if version < 600
    syntax clear
elseif exists("b:current_syntax")
    finish
endif

setlocal iskeyword+=-

syn case ignore
syn match vimNotation "\(\\\|<lt>\)\=<\([scamd]-\)\{0,4}x\=\(f\d\{1,2}\|[^ \t:]\|cr\|lf\|linefeed\|return\|k\=del\%[ete]\|bs\|backspace\|tab\|esc\|right\|left\|help\|undo\|insert\|ins\|k\=home\|k\=end\|kplus\|kminus\|kdivide\|kmultiply\|kenter\|kpoint\|space\|k\=\(page\)\=\(\|down\|up\|k\d\>\)\)>" contains=vimBracket
syn match vimNotation "\(\\\|<lt>\)\=<\([scam2-4]-\)\{0,4}\(right\|left\|middle\)\(mouse\)\=\(drag\|release\)\=>" contains=vimBracket
syn match vimNotation "\(\\\|<lt>\)\=<\(bslash\|plug\|sid\|space\|bar\|nop\|nul\|lt\)>"  contains=vimBracket
syn match vimNotation '\(\\\|<lt>\)\=<C-R>[0-9a-z"%#:.\-=]'he=e-1   contains=vimBracket
syn match vimNotation '\(\\\|<lt>\)\=<\%(q-\)\=\(line[12]\|count\|bang\|reg\|args\|f-args\|lt\)>' contains=vimBracket
syn match vimNotation "\(\\\|<lt>\)\=<\([cas]file\|abuf\|amatch\|cword\|cWORD\|client\)>"  contains=vimBracket
syn match vimBracket contained "[\\<>]"
syn case match

syn match navNumber             "\<[0-9]\+\>\|\<0[xX][0-9a-fA-F]\+\>\|\<0[oO][0-7]\+\>"
syn match navFloat              "\<[0-9]\+\.[0-9]\+\([eE][-+]\=[0-9]\+\)\=\>"
syn match navVariable           /\w\+=/         display
syn match navVar                /\${\=\w\+}\=/  display
syn match navSymbol             /%{\=\w\+}\=/   display
syn match navModule             "\w\+\s*::"

syn keyword navTodo             contained FIXME TODO XXX

syn region  navComment          oneline start='\%(^\|\s*\)#' end='$'
                              \ contains=navTodo

syn match   navPreProc          '^\%1l#\%(!\|compdef\|autoload\).*$'

syn match   navQuoted           '\\.'
syn region  navString           matchgroup=navStringDelimiter start=+"+ end=+"+
                              \ contains=navQuoted,@navDerefs,@navSubst
syn region  navString           matchgroup=navStringDelimiter start=+'+ end=+'+

syn keyword navDelimiter        do done end en

syn keyword navConditional      if else el elseif elif

syn keyword navRepeat           while until repeat

syn keyword navRepeat           for foreach nextgroup=navVariable skipwhite

syn keyword navKeyword          function nextgroup=navKSHFunction skipwhite

syn match navFunction           "\<\h\w*\>\(\s\|\n\)*("me=e-1

syn match navOperator           '||\|&&\|;\|&!\='

syn keyword navCommands         augroup aug autocmd au bdelete bd buffer bu cd
                              \ close q delmark delm direct di echo ec edit ed
                              \ filter fil function doautocmd doau
                              \ fu highlight hi kill map mark
                              \ m new opcmd op qa reload rel return ret sort sor
                              \ source so syntax syn version ver vnew vne
                              \ plug plugin table tbl

syn keyword navStatement        let set

syn keyword navOptsSet          history jumplist menu_rows hintkeys shell sepchar
                              \ sort sortinherit sortreverse askdelete askrename
                              \ copy-pipe


syn keyword navGroups           BufSelActive BufSelInactive ComplSelected
                              \ BufText BufDir BufSz BufStdout BufStderr OverlaySep
                              \ OverlayLine OverlayBufNo
                              \ OverlayActive OverlayArgs OverlayInactive
                              \ OverlayTextInactive OverlayProgress
                              \ OverlayFilter ComplText ComplParam
                              \ MsgError MsgMessage MsgAsk

syn cluster navSubst            contains=navSubst,navOldSubst,navMathSubst
syn region  navSubst            matchgroup=navSubstDelim transparent
                              \ start='\$(' skip='\\)' end=')' contains=TOP
syn region  navSubst            matchgroup=navSubstDelim start='\${' skip='\\}'
                              \ end='}' contains=@navSubst,navBrackets,navQuoted,navString
syn region  navOldSubst         matchgroup=navSubstDelim start=+`+ skip=+\\`+
                              \ end=+`+ contains=TOP,navOldSubst

syn match   navBlockDelim       "(\|)\|\[\|\]\|,\|;\|_\|{\|}"

hi def link vimNotation         Special
hi def link vimMapMod           vimBracket
hi def link navTodo             Todo
hi def link navComment          Comment
hi def link navPreProc          PreProc
hi def link navQuoted           SpecialChar
hi def link navString           String
hi def link navStringDelimiter  navString
hi def link navPOSIXString      navString
hi def link navPrecommand       Special
hi def link navDelimiter        Keyword
hi def link navConditional      Conditional
hi def link navException        Exception
hi def link navRepeat           Repeat
hi def link navKeyword          Keyword
hi def link navFunction         cFunc
hi def link navModule           cFunc
hi def link navHereDoc          String
hi def link navOperator         Constant
hi def link navRedir            Operator
hi def link navVariable         PreProc
hi def link navVar              PreProc
hi def link navSymbol           Identifier
hi def link navDereferencing    PreProc

hi def link navCommands         Keyword
hi def link navGroups           Type
hi def link navOptsSet          Keyword
hi def link navStatement        Keyword
hi def link navSwitches         Special
hi def link navNumber           Number
hi def link navFloat            Float
hi def link navSubst            PreProc
hi def link navOldSubst         navSubst
hi def link navSubstDelim       navSubst
hi def link navBlockDelim       Delimiter

let b:current_syntax = "nav"
