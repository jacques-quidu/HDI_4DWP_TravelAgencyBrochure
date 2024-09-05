//%attributes = {"invisible":true}

var $oRange; $obPict; $section : Object

$oRange:=wpDoc.textRange(wk end text:K81:164; wk end text:K81:164)

wpDoc.newBookmark($oRange; "BackCover")

// Insert title text
$oRange.appendText(Uppercase:C13(flyerEnt.Title)+Char:C90(Carriage return:K15:38))

// Format title text
$oRange.styleSheet:="BackCover_Title"

// Insert subtitle text
$oRange:=wpDoc.textRange(wk end text:K81:164; wk end text:K81:164)
$oRange.appendText(flyerEnt.Subtitle)

// Format subtitle text
$oRange.styleSheet:="BackCover_Text"


// Retrieve the current section
$section:=$oRange.getSection()

// Insert back cover image
$section.backgroundImage:=flyerEnt.BackCover


// Insert QR code in the current section
$obPict:=wpDoc.newAnchoredPicture(Get 4D folder:C485(Current resources folder:K5:16)+"QRCode.png")
$obPict.setAttributes({anchorSection: $section.sectionIndex; \
anchorOrigin: wk paper box:K81:215; \
anchorVerticalAlign: wk bottom:K81:98; \
anchorVerticalOffset: "1cm"; \
anchorHorizontalAlign: wk center:K81:99})

