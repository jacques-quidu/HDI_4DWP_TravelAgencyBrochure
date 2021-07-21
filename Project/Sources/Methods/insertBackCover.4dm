//%attributes = {"invisible":true}

var $oRange; $obPict; $section : Object

$oRange:=WP Text range:C1341(wpDoc; wk end text:K81:164; wk end text:K81:164)

WP NEW BOOKMARK:C1415($oRange; "BackCover")

// Insert title text
WP SET TEXT:C1574($oRange; Uppercase:C13(flyerEnt.Title); wk append:K81:179)
WP SET TEXT:C1574($oRange; Char:C90(Carriage return:K15:38); wk append:K81:179)

// Format title text
WP SET ATTRIBUTES:C1342($oRange; wk style sheet:K81:63; "BackCover_Title")

// Insert subtitle text
$oRange:=WP Text range:C1341(wpDoc; wk end text:K81:164; wk end text:K81:164)
WP SET TEXT:C1574($oRange; flyerEnt.Subtitle; wk append:K81:179)

// Format subtitle text
WP SET ATTRIBUTES:C1342($oRange; wk style sheet:K81:63; "BackCover_Text")

// Retrieve the current section
$section:=WP Get section:C1581($oRange)

// Insert back cover image
WP SET ATTRIBUTES:C1342($section; wk background image:K81:21; flyerEnt.BackCover)


// Insert QR code in the current section
$obPict:=WP Add picture:C1536(wpDoc; Get 4D folder:C485(Current resources folder:K5:16)+"QRCode.png")
WP SET ATTRIBUTES:C1342($obPict; wk anchor section:K81:228; $section.sectionIndex)
WP SET ATTRIBUTES:C1342($obPict; \
wk anchor origin:K81:235; wk paper box:K81:215; \
wk anchor vertical align:K81:239; wk bottom:K81:98; \
wk anchor vertical offset:K81:238; "1cm"; \
wk anchor horizontal align:K81:237; wk center:K81:99)
