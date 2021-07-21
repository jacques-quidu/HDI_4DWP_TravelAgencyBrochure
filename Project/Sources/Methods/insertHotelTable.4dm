//%attributes = {"invisible":true}
var $oRange; $oNewRange : Object
var $wpTable; $wpRow : Object
var $header; $footer; $info; $section; $subSection : Object
var $iContinent; $iHotel; $firstpage; $iCol : Integer
var $lastContinent : Text
$lastContinent:=""

var $colHeader : Collection
$colHeader:=New collection:C1472(""; "Hotel"; "Country"; "Rating"; "Price"; "Restaurant"; "All inclusive"; "Activities"; "Children's club")

$oRange:=WP Text range:C1341(wpDoc; wk end text:K81:164; wk end text:K81:164)

WP NEW BOOKMARK:C1415($oRange; "Lodgings")

WP INSERT BREAK:C1413($oRange; wk section break:K81:187; wk append:K81:179; wk exclude from range:K81:181)


// Retrieve the current section
$section:=WP Get section:C1581($oRange)

// Format the current section
WP SET ATTRIBUTES:C1342($section; wk page margin top:K81:268; "3cm"; wk page margin left:K81:266; "1.5cm"; wk page margin right:K81:267; "1.5cm")

// Create the left sub section
$subSection:=WP New subsection:C1583($section; wk left page:K81:204)

// Insert header
$header:=WP New header:C1586($subSection)
$oNewRange:=WP Text range:C1341($header; wk start text:K81:165; wk end text:K81:164)
WP SET TEXT:C1574($oNewRange; "Lodgings"; wk replace:K81:177; wk include in range:K81:180)
WP SET ATTRIBUTES:C1342($oNewRange; wk style sheet:K81:63; "Title_Right")
WP SET ATTRIBUTES:C1342($header; wk margin left:K81:11; "2.5cm"; wk margin right:K81:12; "2.5cm")

// Insert footer
$footer:=WP New footer:C1587($subSection)
$oNewRange:=WP Text range:C1341($footer; wk start text:K81:165; wk end text:K81:164)
ST INSERT EXPRESSION:C1281($oNewRange; "$wp_pageNumber")
$oNewRange:=WP Text range:C1341($footer; wk start text:K81:165; wk end text:K81:164)
WP SET ATTRIBUTES:C1342($oNewRange; wk style sheet:K81:63; "PageNumber_Left")
WP SET ATTRIBUTES:C1342($footer; wk margin left:K81:11; "2.5cm"; wk margin right:K81:12; "2.5cm")


// Retrieve the reference to the right subsection
$subSection:=WP Get subsection:C1582($section; wk right page:K81:205)

// Insert header
$header:=WP New header:C1586($subSection)
$oNewRange:=WP Text range:C1341($header; wk start text:K81:165; wk end text:K81:164)
WP SET TEXT:C1574($oNewRange; "Lodgings"; wk replace:K81:177; wk include in range:K81:180)
WP SET ATTRIBUTES:C1342($oNewRange; wk style sheet:K81:63; "Title_Left")
WP SET ATTRIBUTES:C1342($header; wk margin left:K81:11; "2.5cm"; wk margin right:K81:12; "2.5cm")

// Insert footer
$footer:=WP New footer:C1587($subSection)
$oNewRange:=WP Text range:C1341($footer; wk start text:K81:165; wk end text:K81:164)
ST INSERT EXPRESSION:C1281($oNewRange; "$wp_pageNumber")
$oNewRange:=WP Text range:C1341($footer; wk start text:K81:165; wk end text:K81:164)
WP SET ATTRIBUTES:C1342($oNewRange; wk style sheet:K81:63; "PageNumber_Right")
WP SET ATTRIBUTES:C1342($footer; wk margin left:K81:11; "2.5cm"; wk margin right:K81:12; "2.5cm")


// Insert Lodging table
$wpTable:=WP Insert table:C1473($oRange; wk append:K81:179; wk include in range:K81:180)
$wpRow:=WP Table append row:C1474($wpTable; $colHeader[1]; $colHeader[2]; $colHeader[3]; $colHeader[4]; $colHeader[5]; $colHeader[6]; $colHeader[7]; $colHeader[8])

$info:=WP Get position:C1577($wpRow)
$firstpage:=$info.page

$oRange:=WP Table get columns:C1476($wpTable; 1; 8)
WP SET ATTRIBUTES:C1342($oRange; wk width:K81:45; "50pt"; \
wk font size:K81:66; "10pt"; \
wk border color:K81:34; "#42cad7")

$oRange:=WP Table get columns:C1476($wpTable; 2; 3)
WP SET ATTRIBUTES:C1342($oRange; wk width:K81:45; "60pt")

$oRange:=WP Table get columns:C1476($wpTable; 1; 1)
WP SET ATTRIBUTES:C1342($oRange; wk width:K81:45; "90pt")

var $hotelSel : cs:C1710.HotelSelection
var $hotelEnt : cs:C1710.HotelEntity
$hotelSel:=flyerEnt.toHotels.orderBy("toCountry.toContinent.Name, toCountry.Name, Name")
For each ($hotelEnt; $hotelSel)
	
	If ($lastContinent#$hotelEnt.toCountry.toContinent.Name)
		$wpRow:=WP Table append row:C1474($wpTable; Uppercase:C13($hotelEnt.toCountry.toContinent.Name); ""; ""; ""; ""; ""; ""; "")
		WP SET ATTRIBUTES:C1342($wpRow; wk background color:K81:20; "#42cad7")
		$lastContinent:=$hotelEnt.toCountry.toContinent.Name
		
		$info:=WP Get position:C1577($wpRow)
		If ($info.page#$firstpage)
			WP TABLE DELETE ROWS:C1693($wpRow)
		End if 
	End if 
	
	$wpRow:=WP Table append row:C1474($wpTable; \
		$hotelEnt.Name; \
		$hotelEnt.toCountry.Name; \
		Choose:C955(Num:C11($hotelEnt.Rating); ""; "★"; "★★"; "★★★"; "★★★★"; "★★★★★"); \
		$hotelEnt.Price; \
		Choose:C955(Num:C11($hotelEnt.Restaurant); ""; "★"; "★★"; "★★★"); \
		Choose:C955($hotelEnt.AllIncludes; "●"; ""); \
		Choose:C955($hotelEnt.Animation; "●"; ""); \
		Choose:C955($hotelEnt.Children; "●"; ""))
	WP SET ATTRIBUTES:C1342($wpRow; wk background color:K81:20; wk transparent:K81:134)
	
	$info:=WP Get position:C1577($wpRow)
	If ($info.page#$firstpage)
		// The row is on another page - Insert table header again
		
		For ($iCol; 1; 8)
			
			// Replace the cell contents
			$oRange:=WP Table get cells:C1477($wpTable; $iCol; $wpRow.firstRow; 1; 1)
			$oNewRange:=WP Text range:C1341($oRange; wk start text:K81:165; wk end text:K81:164)
			WP SET TEXT:C1574($oNewRange; $colHeader[$iCol]; wk replace:K81:177)
			
		End for 
		
		// Insert continent name again
		$wpRow:=WP Table append row:C1474($wpTable; Uppercase:C13($hotelEnt.toCountry.toContinent.Name); ""; ""; ""; ""; ""; ""; "")
		WP SET ATTRIBUTES:C1342($wpRow; wk background color:K81:20; "#42cad7")
		
		// Re insert the lodging
		$wpRow:=WP Table append row:C1474($wpTable; \
			$hotelEnt.Name; \
			$hotelEnt.toCountry.Name; \
			Choose:C955(Num:C11($hotelEnt.Rating); ""; "★"; "★★"; "★★★"; "★★★★"; "★★★★★"); \
			$hotelEnt.Price; \
			Choose:C955(Num:C11($hotelEnt.Restaurant); ""; "★"; "★★"; "★★★"); \
			Choose:C955($hotelEnt.AllIncludes; "●"; ""); \
			Choose:C955($hotelEnt.Animation; "●"; ""); \
			Choose:C955($hotelEnt.Children; "●"; ""))
		WP SET ATTRIBUTES:C1342($wpRow; wk background color:K81:20; wk transparent:K81:134)
		
		$firstpage:=$info.page
	End if 
	
	
	If ($iHotel=1)
		WP SET ATTRIBUTES:C1342($wpRow; wk background color:K81:20; wk transparent:K81:134)
	End if 
	
	
End for each 

$oRange:=WP Table get columns:C1476($wpTable; 1; 8)
WP SET ATTRIBUTES:C1342($oRange; wk text align:K81:49; wk center:K81:99)