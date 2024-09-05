//%attributes = {"invisible":true}
var $oRange; $obPict; $section : Object
var $colParagraph : Collection

$oRange:=wpDoc.textRange(wk end text:K81:164; wk end text:K81:164)

wpDoc.newBookmark($oRange; "Introduction")


// Insert fragment document from database
$oRange.appendBody(flyerEnt.Intro)

// Format all text in range
$oRange.paddingBottom:="5pt"


// Add a specific format for the first and third paragraph


$colParagraph:=$oRange.getElements(wk type paragraph:K81:191)
$colParagraph[0].setAttributes({fontBold: wk true:K81:174; fontSize: 16; color: "#2AB8C6"})
$colParagraph[3].setAttributes({fontBold: wk true:K81:174; fontSize: 16; color: "#2AB8C6"})

// Insert section break
$oRange.appendBreak(wk section break:K81:187)

// Retrieve the current section
$section:=$oRange.getSection()

// Start page number from the introduction section
$section.pageFirstNumber:=1

// Format the current section
$section.setAttributes({columnSpacing: "1cm"; columnCount: 2; pageMarginTop: "13.5cm"})

// Insert image in the current section
$obPict:=wpDoc.newAnchoredPicture(flyerEnt.IntroImage)
$obPict.setAttributes({anchorSection: $section.sectionIndex; anchorOrigin: wk paper box:K81:215})





