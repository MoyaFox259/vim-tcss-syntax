" Vim syntax file
" Language:     Textual Cascading Stylesheet
" Last Change:  2024 March 26
" Maintainer:   Charles Winter
"
"
"               Syntax highlighting file for Textual CSS (.tcss)
"
"
"                [Keyword Reference]
"               'https://textual.textualize.io/reference/'
"
"
"                [Known Issues]
"               -Struggling with '#' and ':'
"               -Nesting may not work properly
"               -Property defenition must end with ';'
"               -Misspelling?
"
"
"                [TODO]
"               -Code optimization
"               -Solve issues
"               -Error detection (invalid names, missing braces, etc.)
"
"
"               Caution!
"               This syntax highlighting file is working in progress
"               and requires further testing.
"               Issues could possibly occur. Use at own risk.



if exists("b:current_syntax")
    finish
endif

let s:cpo_save = &cpo
set cpo&vim

syn case ignore


" 1. Numeric
syn match cssTextualUnit contained "\d\@<=\s*\(%\|fr\|w\|h\|vw\|vh\)\s*"
syn match cssTextualNumeric contained "[-+]\=\d\+\(\.\d*\)\="


" 2. Colors
" hex values and functions
syn match cssTextualColorHex contained "#\(\x\{3,4\}\|\x\{6\}\|\x\{8\}\)\>"
syn match cssTextualColorFunName contained "\<\(rgb\|hsl\)a\=\>" contains=cssTextualColorFun
syn region cssTextualColorFun contained start="\s*(" end="\s*)" oneline matchgroup=cssTextualBraceRound contains=cssTextualNumeric,cssTextualComma containedin=cssTextualColorFunName
" variables
syn match cssTextualColorVar contained "\$\(primary\|sencondary\|primary-background\|sencondary-background\|background\|surface\|panel\|boost\|warning\|error\|success\|accent\)\(-\(lighten\|darken\)-\(1\|2\|3\)\)\=\>"
syn match cssTextualColorVar contained "\$text\(-muted\|-disabled\)\=\>"
" color names
syn match cssTextualColorName contained "\<ansi_\(bright_\)\=\(black\|blue\|cyan\|green\|magenta\|red\|white\|yellow\)\>"
syn keyword cssTextualColorName contained aliceblue antiquewhite aqua aquamarine azure
syn keyword cssTextualColorName contained beige bisque black blanchedalmond blue blueviolet brown burlywood
syn keyword cssTextualColorName contained cadetblue chartreuse chocolate coral cornflowerblue cornsilk crimson cyan
syn match cssTextualColorName contained "\<dark\(blue\|cyan\|goldenrod\|gray\|grey\|green\|khaki\|magenta\|olivegreen\|orange\|orchid\|red\|salmon\|seagreen\|slateblue\|slategray\|slategrey\|turquoise\|violet\)\>"
syn keyword cssTextualColorName contained deeppink deepskyblue dimgray dimgrey dodgerblue
syn keyword cssTextualColorName contained firebrick floralwhite forestgreen fuchsia
syn keyword cssTextualColorName contained gainsboro ghostwhite gold goldenrod gray grey green greenyellow
syn keyword cssTextualColorName contained honeydew hotpink indianred indigo ivory khaki
syn match cssTextualColorName contained "\<light\(blue\|coral\|cyan\|goldenrodyellow\|gray\|grey\|green\|pink\|salmon\|seagreen\|skyblue\|slategray\|slategrey\|steelblue\|yellow\)\>"
syn keyword cssTextualColorName contained lavender lavenerblush lawngreen lemonchiffon lime limegreen linen
syn match cssTextualColorName contained "\<medium\(aquamarine\|blue\|orchid\|purple\|seagreen\|slateblue\|springgreen\|turquoise\|violetred\)\>"
syn keyword cssTextualColorName contained magenta maroon midnightblue mintcream mistyrose moccasin
syn keyword cssTextualColorName contained navajowhite navy oldlace olive olivedrab orange orangered orchid
syn match cssTextualColorName contained "\<pale\(goldenrod\|green\|turquoise\|violetred\)\>"
syn keyword cssTextualColorName contained papayawhip peachpuff peru pink plum powderblue purple
syn keyword cssTextualColorName contained rebeccapurple red rosybrown royalblue
syn keyword cssTextualColorName contained saddlebrown salmon sandybrown seagreen seashell sienna silver skyblue slateblue slategray slategrey snow springgreen steelblue
syn keyword cssTextualColorName contained tan teal thistle tomato turquoise
syn keyword cssTextualColorName contained violet wheat white whitesmoke yellow yellowgreen


" 3. Property
" display and visibility
syn keyword cssTextualProp contained display visibility
" align and dock
syn match cssTextualProp contained "\<align\(-\(horizontal\|vertical\)\)\=\>"
syn keyword cssTextualProp contained dock
" margin, padding and offset
syn match cssTextualProp contained "\<\(margin\|padding\)\(-\(top\|right\|bottom\|left\)\)\=\>"
syn match cssTextualProp contained "\<offset\(-\(x\|y\)\)\=\>"
" grid
syn match cssTextualProp contained "\<grid-\(size\|columns\|rows\|gutter\)\>"
syn match cssTextualProp contained "\<\(column\|row\)-span\>"
" color
syn keyword cssTextualProp contained background tint
syn keyword cssTextualProp contained opacity
" border and outline
syn match cssTextualProp contained "\<\(border\|outline\)\(-\(top\|right\|bottom\|left\)\)\=\>"
syn match cssTextualProp contained "\<border-\(sub\)\=title-\(align\|background\|color\|style\)\>"
" keyline
syn keyword cssTextualProp contained keyline
" dimensions and box-sizing
syn match cssTextualProp contained "\<\(\(max\|min\)-\)\=\(width\|height\)\>"
syn keyword cssTextualProp contained box-sizing
" layout and layers
syn keyword cssTextualProp contained layout
syn keyword cssTextualProp contained layer layers
" text
syn match cssTextualProp contained "\<content-align\(-\(horizontal\|vertical\)\)\=\>"
syn match cssTextualProp contained "\<text-\(align\|opacity\|style\)\>"
syn match cssTextualProp contained "\<link-\(background\|color\|style\)\(-hover\)\=\>"
syn keyword cssTextualProp contained color
" scrollbar
syn match cssTextualProp contained "\<overflow\(-\(x\|y\)\)\=\>"
syn match cssTextualProp contained "\<scrollbar-\(background\|color\)\(-\(hover\|active\)\)\=\>"
syn match cssTextualProp contained "\<scrollbar-size\(-\(horizontal\|vertical\)\)\=\>"
syn keyword cssTextualProp contained scrollbar-corner-color scrollbar-gutter


" 4. Property keywords
" display and visibility
syn keyword cssTextualPropKeyword contained block visible
" align
syn keyword cssTextualPropKeyword contained left center right
syn keyword cssTextualPropKeyword contained top middle bottom
" layout
syn keyword cssTextualPropKeyword contained grid horizontal vertical
" border/outline types
syn keyword cssTextualPropKeyword contained ascii blank dashed double heavy hkey inner outer panel round solid tall thick vkey wide
" keyline
syn keyword cssTextualPropKeyword contained thin
" box-sizing
syn keyword cssTextualPropKeyword contained border-box content-box
" text-align and text-style
syn keyword cssTextualPropKeyword contained start left justify center right end
syn keyword cssTextualPropKeyword contained bold italic reverse strike underline
" overflow
syn keyword cssTextualPropKeyword contained hidden scroll
" scrollbar-gutter
syn keyword cssTextualPropKeyword contained stable
" common
syn keyword cssTextualPropKeyword contained auto initial none


" 5. Defenition regions
" body
syn region cssTextualPropDef transparent contained start=":\s*" end="\s*;" matchgroup=cssTextualPropDefSE contains=cssTextualNumeric,cssTextualUnit,cssTextualVariable,cssTextualColorHex,cssTextualColorVar,cssTextualColorFunName,cssTextualColorName,cssTextualPropKeyword,cssTextualImportant,cssTextualComma,cssTextualCommentBlock
syn region cssTextualSelectorInnards transparent contained start="\(\(&\|>\|+\|\~\|\w\|\*\)\s*\)\@<={" end="\(;.*\)\@=}" matchgroup=cssTextualBraceCurly contains=cssTextualProp,cssTextualPropDef,cssTextualVariable,cssTextualCommentBlock,cssTextualCommentLine,cssTextualSelectorUniversal,cssTextualSelectorComplex,cssTextualSelectorType,cssTextualSelectorID,cssTextualSelectorClass,cssTextualSelectorPseudoColon,cssTextualSelectorPseudoClass fold
syn region cssTextualSelector transparent start="\(\%^\|;\|{\|}\|\*\/\)\ze" end="\ze{" contains=cssTextualSelectorType,cssTextualSelectorID,cssTextualSelectorClass,cssTextualSelectorUniversal,cssTextualSelectorComplex,cssTextualComma,cssTextualSelectorPseudoColon,cssTextualSelectorPseudoClass,cssTextualSelectorInnards
" comments
syn region cssTextualCommentBlock start="/\*" end="\*/"
syn region cssTextualCommentLine contained start="#" end="$"


" 6. Miscs
syn match cssTextualComma "," containedin=cssTextualSelector,cssTextualSelectorInnards,cssTextualColorFun
syn match cssTextualImportant contained "!\s*important\>" containedin=cssTextualSelectorInnards
syn match cssTextualVariable contained "\$\h\w*"


" 7. Selectors
" (very brutal matching)
syn match cssTextualSelectorUniversal contained "\*" containedin=cssTextualSelector,cssTextualSelectorInnards
syn match cssTextualSelectorComplex contained "&\|>\|+\|\~" containedin=cssTextualSelector,cssTextualSelectorInnards
syn match cssTextualSelectorType contained  "\(\s\|&\|>\|+\|\~\|^\|,\|{\|}\)\@<=\h\(\w\|-\)*\>\s*\(:.*;\s*\_$\|-\)\@!" containedin=cssTextualSelector,cssTextualSelectorInnards
syn match cssTextualSelectorID contained "#\h\(\w\|-\)*\>\(\s*\({\@!.*\_$\)\@!\)" containedin=cssTextualSelector,cssTextualSelectorInnards
syn match cssTextualSelectorClass contained "\.\h\(\w\|-\)*\>" containedin=cssTextualSelector,cssTextualSelectorInnards
syn match cssTextualSelectorPseudoColon contained ":\(\(disabled\|enabled\|focus\|focus-within\|hover\)\>\)\@=" contains=cssTextualSelectorPseudoClass containedin=cssTextualSelector,cssTextualSelectorInnards
syn match cssTextualSelectorPseudoClass contained ":\@<=\(disabled\|enabled\|focus\|focus-within\|hover\)\>" containedin=cssTextualSelectorPseudoColon,cssTextualSelector,cssTextualSelectorInnards


" Sync
syn sync fromstart
syn sync minlines=10


" 8. Highlight links
" Override them to suit your preferences.
hi def link cssTextualBraceCurly Normal
hi def link cssTextualBraceRound Normal
hi def link cssTextualComma Normal
hi def link cssTextualPropDefSE Normal
hi def link cssTextualUnit Operator
hi def link cssTextualNumeric Number
hi def link cssTextualColorHex Number
hi def link cssTextualColorFunName Function
hi def link cssTextualColorVar Statement
hi def link cssTextualColorName Constant
hi def link cssTextualProp StorageClass
hi def link cssTextualPropKeyword Constant
hi def link cssTextualImportant Repeat
hi def link cssTextualVariable Statement
hi def link cssTextualSelectorUniversal Function
hi def link cssTextualSelectorComplex Function
hi def link cssTextualSelectorType Function
hi def link cssTextualSelectorID Function
hi def link cssTextualSelectorClass Function
hi def link cssTextualSelectorPseudoColon Function
hi def link cssTextualSelectorPseudoClass Function
hi def link cssTextualCommentBlock Comment
hi def link cssTextualCommentLine Comment


let b:current_syntax = "tcss"

let &cpo = s:cpo_save
unlet s:cpo_save

" vim:set sw=4 sts=4 ts=4 noet:
