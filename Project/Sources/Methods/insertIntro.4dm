//%attributes = {"invisible":true}
var $oRange; $obPict; $section : Object
var $colParagraph : Collection

$oRange:=WP Text range:C1341(wpDoc; wk end text:K81:164; wk end text:K81:164)

WP NEW BOOKMARK:C1415($oRange; "Introduction")


// Insert fragment document from database
WP INSERT DOCUMENT:C1411($oRange; flyerEnt.Intro; wk append:K81:179; wk include in range:K81:180)

// Format all text in range
WP SET ATTRIBUTES:C1342($oRange; wk padding bottom:K81:19; "5pt")


// Add a specific format for the first and third paragraph
$colParagraph:=WP Get elements:C1550($oRange; wk type paragraph:K81:191)
WP SET ATTRIBUTES:C1342($colParagraph[0]; wk font bold:K81:68; wk true:K81:174; \
wk font size:K81:66; 16; \
wk text color:K81:64; "#2AB8C6")
WP SET ATTRIBUTES:C1342($colParagraph[3]; wk font bold:K81:68; wk true:K81:174; \
wk font size:K81:66; 16; \
wk text color:K81:64; "#2AB8C6")

// Insert section break
WP INSERT BREAK:C1413($oRange; wk section break:K81:187; wk append:K81:179)

// Retrieve the current section
$section:=WP Get section:C1581($oRange)

// Start page number from the introduction section
WP SET ATTRIBUTES:C1342($section; wk page first number:K81:271; 1)

// Format the current section
WP SET ATTRIBUTES:C1342($section; wk column count:K81:199; 2; \
wk column spacing:K81:249; "1cm"; \
wk page margin top:K81:268; "13.5cm")

// Insert image in the current section
$obPict:=WP Add picture:C1536(wpDoc; flyerEnt.IntroImage)
WP SET ATTRIBUTES:C1342($obPict; \
wk anchor section:K81:228; $section.sectionIndex; \
wk anchor origin:K81:235; wk paper box:K81:215)




