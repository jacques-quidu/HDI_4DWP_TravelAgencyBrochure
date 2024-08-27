//%attributes = {"invisible":true}
var $oRange; $section : Object
var $colParagraph : Collection

$oRange:=wpDoc.textRange(wk end text:K81:164; wk end text:K81:164)
wpDoc.newBookmark($oRange; "Editorial")

// Insert text
$oRange.appendText(flyerEnt.Edito)

// Format text
$oRange.setAttributes({styleSheet: "Edito_Text"})

// Format first paragraph
$colParagraph:=$oRange.getElements(wk type paragraph:K81:191)
$colParagraph[0].setAttributes({styleSheet: "Edito_Title"})


// Insert break
$oRange.appendBreak(wk section break:K81:187)

// Retrieve the current section
$section:=$oRange.getSection()

// Insert Edito image 
$section.setAttributes({backgroundImage: flyerEnt.EditoImage})
