//%attributes = {"invisible":true}
var $oRange; $obPict; $section : Object

$oRange:=wpDoc.textRange(wk start text:K81:165; wk end text:K81:164)

wpDoc.newBookmark($oRange; "FirstCover")

// Insert title
$oRange.appendText(Uppercase:C13(flyerEnt.Title)+Char:C90(Carriage return:K15:38))

// Format title
$oRange.setAttributes({styleSheet: "Main_Title"})


// Insert subtitle

$oRange:=wpDoc.textRange(wk end text:K81:164; wk end text:K81:164)
$oRange.appendText(flyerEnt.Subtitle+Char:C90(Carriage return:K15:38))

// Format subtitle
$oRange.setAttributes({styleSheet: "Main_SubTitle"})

// Insert break
$oRange.appendBreak(wk section break:K81:187)

// Retrieve the current section
$section:=$oRange.getSection()

// Insert cover image
$section.setAttributes({backgroundImage: flyerEnt.Cover})

// Define the background image attributes for all sections
var $attributes : Object
$attributes:=New object:C1471
$attributes[wk background height:K81:28]:="100%"
$attributes[wk background width:K81:27]:="100%"
$attributes[wk background clip:K81:25]:=wk paper box:K81:215
$attributes[wk background origin:K81:26]:=wk paper box:K81:215
wpDoc.setAttributes($attributes)


// Insert 4D Travels logo in the current section
$obPict:=wpDoc.newAnchoredPicture(Get 4D folder:C485(Current resources folder:K5:16)+"logo.png")
$attributes:=New object:C1471
$attributes[wk anchor section:K81:228]:=$section.section.sectionIndex
$attributes[wk anchor origin:K81:235]:=wk paper box:K81:215
$attributes[wk anchor vertical align:K81:239]:=wk bottom:K81:98
$attributes[wk anchor vertical offset:K81:238]:="1cm"
$attributes[wk anchor horizontal align:K81:237]:=wk center:K81:99
$obPict.setAttributes($attributes)

