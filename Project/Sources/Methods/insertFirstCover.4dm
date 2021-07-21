//%attributes = {"invisible":true}
var $oRange; $obPict; $section : Object

$oRange:=WP Text range:C1341(wpDoc; wk start text:K81:165; wk end text:K81:164)

WP NEW BOOKMARK:C1415($oRange; "FirstCover")

// Insert title
WP SET TEXT:C1574($oRange; Uppercase:C13(flyerEnt.Title)+Char:C90(Carriage return:K15:38); wk append:K81:179; wk include in range:K81:180)

// Format title
WP SET ATTRIBUTES:C1342($oRange; wk style sheet:K81:63; "Main_Title")

// Insert subtitle
$oRange:=WP Text range:C1341(wpDoc; wk end text:K81:164; wk end text:K81:164)
WP SET TEXT:C1574($oRange; flyerEnt.Subtitle+Char:C90(Carriage return:K15:38); wk append:K81:179; wk include in range:K81:180)

// Format subtitle
WP SET ATTRIBUTES:C1342($oRange; wk style sheet:K81:63; "Main_SubTitle")

// Insert break
WP INSERT BREAK:C1413($oRange; wk section break:K81:187; wk append:K81:179)


// Retrieve the current section
$section:=WP Get section:C1581($oRange)

// Insert cover image
WP SET ATTRIBUTES:C1342($section; wk background image:K81:21; flyerEnt.Cover)

// Define the background image attributes for all sections
WP SET ATTRIBUTES:C1342(wpDoc; \
wk background height:K81:28; "100%"; \
wk background width:K81:27; "100%"; \
wk background clip:K81:25; wk paper box:K81:215; \
wk background origin:K81:26; wk paper box:K81:215)

// Insert 4D Travels logo in the current section
$obPict:=WP Add picture:C1536(wpDoc; Get 4D folder:C485(Current resources folder:K5:16)+"logo.png")
WP SET ATTRIBUTES:C1342($obPict; \
wk anchor section:K81:228; $section.sectionIndex; \
wk anchor origin:K81:235; wk paper box:K81:215; \
wk anchor vertical align:K81:239; wk bottom:K81:98; \
wk anchor vertical offset:K81:238; "1cm"; \
wk anchor horizontal align:K81:237; wk center:K81:99)
