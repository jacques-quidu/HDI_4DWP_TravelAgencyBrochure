//%attributes = {"invisible":true}
var $oRange; $section : Object
var $colParagraph : Collection

$oRange:=WP Text range:C1341(wpDoc; wk end text:K81:164; wk end text:K81:164)

WP NEW BOOKMARK:C1415($oRange; "Editorial")

// Insert text
WP SET TEXT:C1574($oRange; flyerEnt.Edito; wk append:K81:179; wk include in range:K81:180)

// Format text
WP SET ATTRIBUTES:C1342($oRange; wk style sheet:K81:63; "Edito_Text")

// Format first paragraph
$colParagraph:=WP Get elements:C1550($oRange; wk type paragraph:K81:191)
WP SET ATTRIBUTES:C1342($colParagraph[0]; wk style sheet:K81:63; "Edito_Title")

// Insert break
WP INSERT BREAK:C1413($oRange; wk section break:K81:187; wk append:K81:179)

// Retrieve the current section
$section:=WP Get section:C1581($oRange)

// Insert Edito image 
WP SET ATTRIBUTES:C1342($section; wk background image:K81:21; flyerEnt.EditoImage)