//%attributes = {"invisible":true}
var $oRange; $header; $section; $tab : Object

// Memorize the range of the summary to insert title
wpSummaryRange:=wpDoc.textRange(wk end text:K81:164; wk end text:K81:164)

wpDoc.newBookmark(wpSummaryRange; "Summary")


// Format leading characters
$tab:=New object:C1471
$tab[wk offset:K81:280]:=16
$tab[wk type:K81:189]:=wk right:K81:96
$tab[wk leading:K81:281]:="."
wpSummaryRange.setAttributes({tabs: New collection:C1472($tab)})


// Insert section break
wpSummaryRange.appendBreak(wk section break:K81:187)
wpSummaryRange:=wpDoc.textRange(wpSummaryRange.range.start; wpSummaryRange.range.start)

// Retrieve the current section
$section:=wpSummaryRange.getSection()

// Insert header in the current section
$header:=$section.newHeader()

$oRange:=$header.textRange(wk start text:K81:165; wk end text:K81:164)
$oRange.appendText("Summary")
$oRange.setAttributes({styleSheet: "Title_Left"})




