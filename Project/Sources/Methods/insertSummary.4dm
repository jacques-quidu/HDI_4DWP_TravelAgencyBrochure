//%attributes = {"invisible":true}
var $oRange; $header; $section; $tab : Object

// Memorize the range of the summary to insert title
wpSummaryTable:=WP Text range:C1341(wpDoc; wk end text:K81:164; wk end text:K81:164)

WP NEW BOOKMARK:C1415(wpSummaryTable; "Summary")

// Format leading characters
$tab:=New object:C1471
$tab[wk offset:K81:280]:=16
$tab[wk type:K81:189]:=wk right:K81:96
$tab[wk leading:K81:281]:="."
WP SET ATTRIBUTES:C1342(wpSummaryTable; wk tabs:K81:278; New collection:C1472($tab))

// Insert section break
WP INSERT BREAK:C1413(wpSummaryTable; wk section break:K81:187; wk append:K81:179; wk exclude from range:K81:181)

// Retrieve the current section
$section:=WP Get section:C1581(wpSummaryTable)

// Insert header in the current section
$header:=WP New header:C1586($section)
$oRange:=WP Text range:C1341($header; wk start text:K81:165; wk end text:K81:164)
WP SET TEXT:C1574($oRange; "Summary"; wk replace:K81:177; wk include in range:K81:180)
WP SET ATTRIBUTES:C1342($oRange; wk style sheet:K81:63; "Title_Left")




