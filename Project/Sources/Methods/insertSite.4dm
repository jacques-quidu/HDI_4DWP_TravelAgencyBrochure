//%attributes = {"invisible":true}
var $oRange; $section; $header; $footer; $info; $obPict; $wpTable; $wpRow : Object
var $colParagraph : Collection
var $iContinent; $pageNumber; $col; $cell1; $cell2; $pair1; $pair2 : Integer
var $lastContinent : Text
$lastContinent:=""

var $siteSel : cs:C1710.SiteSelection
var $siteEnt : cs:C1710.SiteEntity
$siteSel:=flyerEnt.toSites.orderBy("toCountry.toContinent.Name, toCountry.Name, Name")

// loop on Site
For each ($siteEnt; $siteSel)
	
	$oRange:=WP Text range:C1341(wpDoc; wk end text:K81:164; wk end text:K81:164)
	WP NEW BOOKMARK:C1415($oRange; Replace string:C233($siteEnt.Name; " "; ""))
	
	// Insert text
	WP SET TEXT:C1574($oRange; $siteEnt.Description; wk append:K81:179; wk include in range:K81:180)
	
	// Insert column break
	WP INSERT BREAK:C1413($oRange; wk column break:K81:254; wk append:K81:179)
	
	// Insert text
	$oRange:=WP Text range:C1341(wpDoc; wk end text:K81:164; wk end text:K81:164)
	WP SET TEXT:C1574($oRange; $siteEnt.Highlights+Char:C90(Carriage return:K15:38); wk append:K81:179; wk include in range:K81:180)
	
	// Format text
	$colParagraph:=WP Get elements:C1550($oRange; wk type paragraph:K81:191)
	
	For ($col; 0; $colParagraph.length-1)
		WP SET ATTRIBUTES:C1342($colParagraph[$col]; wk background color:K81:20; "#42cad7"; \
			wk padding left:K81:16; "5pt"; \
			wk padding right:K81:17; "5pt")
		
		If ($col=0)
			WP SET ATTRIBUTES:C1342($colParagraph[$col]; wk padding top:K81:18; "5pt"; \
				wk padding bottom:K81:19; "10pt"; \
				wk text align:K81:49; wk center:K81:99; \
				wk font bold:K81:68; wk true:K81:174)
		Else 
			WP SET ATTRIBUTES:C1342($colParagraph[$col]; wk text align:K81:49; wk left:K81:95; \
				wk padding bottom:K81:19; "5pt"; \
				wk font bold:K81:68; wk false:K81:173)
		End if 
		
	End for 
	
	WP RESET ATTRIBUTES:C1344($colParagraph[$colParagraph.length-1]; wk background color:K81:20; wk padding left:K81:16; wk padding right:K81:17; wk padding top:K81:18)
	
	// Insert break section
	WP INSERT BREAK:C1413($oRange; wk section break:K81:187; wk append:K81:179)
	
	// Retrieve the current section
	$section:=WP Get section:C1581($oRange)
	
	// Format the current section
	WP SET ATTRIBUTES:C1342($section; wk column count:K81:199; 3)
	WP SET ATTRIBUTES:C1342($section; wk column spacing:K81:249; "0.5cm")
	WP SET ATTRIBUTES:C1342($section; wk page margin top:K81:268; "13cm")
	
	// Insert footer in the current section
	$footer:=WP New footer:C1587($section)
	$oRange:=WP Text range:C1341($footer; wk start text:K81:165; wk end text:K81:164)
	
	// Insert table in the footer
	$wpTable:=WP Insert table:C1473($oRange; wk append:K81:179; wk include in range:K81:180)
	
	// Odd or Even page
	$info:=WP Get position:C1577($oRange)
	$pageNumber:=$info.page
	If (($pageNumber%2)=0)
		$wpRow:=WP Table append row:C1474($wpTable; "page"; $siteEnt.Condition)
		$pair1:=wk right:K81:96
		$pair2:=wk left:K81:95
		$cell1:=2
		$cell2:=1
	Else 
		$wpRow:=WP Table append row:C1474($wpTable; $siteEnt.Condition; "page")
		$pair1:=wk left:K81:95
		$pair2:=wk right:K81:96
		$cell1:=1
		$cell2:=2
	End if 
	
	// Format table in the footer
	$oRange:=WP Table get cells:C1477($wpTable; $cell1; 1)
	WP SET ATTRIBUTES:C1342($oRange; wk text color:K81:64; "#66746B"; wk font size:K81:66; "8pt"; wk font:K81:69; "Helvetica Neue"; wk text align:K81:49; $pair1)
	WP SET ATTRIBUTES:C1342($oRange; wk width:K81:45; "13.5cm"; wk border style:K81:29; wk none:K81:91)
	
	$oRange:=WP Table get cells:C1477($wpTable; $cell2; 1)
	WP SET ATTRIBUTES:C1342($oRange; wk font size:K81:66; "16pt"; wk font:K81:69; "Helvetica Neue"; wk text align:K81:49; $pair2)
	WP SET ATTRIBUTES:C1342($oRange; wk width:K81:45; "2cm"; wk border style:K81:29; wk none:K81:91)
	
	// Insert page number expression in footer
	$colParagraph:=WP Get elements:C1550($oRange)
	$oRange:=WP Text range:C1341($colParagraph[0]; wk start text:K81:165; wk end text:K81:164)
	WP INSERT FORMULA:C1703($oRange; Formula:C1597(This:C1470.pageNumber); wk replace:K81:177)
	
	
	//Insert site image
	$obPict:=WP Add picture:C1536(wpDoc; $siteEnt.Image1)
	WP SET ATTRIBUTES:C1342($obPict; wk anchor section:K81:228; $section.sectionIndex)
	WP SET ATTRIBUTES:C1342($obPict; wk anchor origin:K81:235; wk paper box:K81:215; \
		wk anchor vertical offset:K81:238; "80pt"; \
		wk anchor horizontal align:K81:237; $pair1)
	
	$obPict:=WP Add picture:C1536(wpDoc; $siteEnt.Image2)
	WP SET ATTRIBUTES:C1342($obPict; wk anchor section:K81:228; $section.sectionIndex)
	WP SET ATTRIBUTES:C1342($obPict; wk anchor origin:K81:235; wk paper box:K81:215; \
		wk anchor vertical offset:K81:238; "80pt"; \
		wk anchor horizontal align:K81:237; $pair2)
	
	$obPict:=WP Add picture:C1536(wpDoc; $siteEnt.Image3)
	WP SET ATTRIBUTES:C1342($obPict; wk anchor section:K81:228; $section.sectionIndex)
	WP SET ATTRIBUTES:C1342($obPict; wk anchor origin:K81:235; wk paper box:K81:215; \
		wk anchor vertical offset:K81:238; "213pt"; \
		wk anchor horizontal align:K81:237; $pair2)
	
	// Insert continent map
	$obPict:=WP Add picture:C1536(wpDoc; $siteEnt.toCountry.toContinent.Image)
	WP SET ATTRIBUTES:C1342($obPict; wk anchor section:K81:228; $section.sectionIndex)
	WP SET ATTRIBUTES:C1342($obPict; wk anchor origin:K81:235; wk paper box:K81:215; \
		wk anchor horizontal offset:K81:236; "20pt"; \
		wk anchor vertical offset:K81:238; "0.8cm"; \
		wk anchor horizontal align:K81:237; $pair2)
	
	
	// Insert header in the current section
	$header:=WP New header:C1586($section)
	$oRange:=WP Text range:C1341($header; wk start text:K81:165; wk end text:K81:164)
	WP SET TEXT:C1574($oRange; $siteEnt.Name+" - "+Uppercase:C13($siteEnt.toCountry.Name); wk replace:K81:177; wk include in range:K81:180)
	WP SET ATTRIBUTES:C1342($oRange; wk font:K81:69; "Helvetica Neue"; \
		wk font size:K81:66; 24; \
		wk text color:K81:64; "#2AB8C6"; \
		wk text align:K81:49; $pair1)
	
	
	
	// Insert the continent name in the summary page
	If ($lastContinent#$siteEnt.toCountry.toContinent.Name)
		wpSummaryTable:=WP Text range:C1341(wpSummaryTable; wpSummaryTable.end; wpSummaryTable.end)
		WP SET TEXT:C1574(wpSummaryTable; Char:C90(Carriage return:K15:38)+$siteEnt.toCountry.toContinent.Name+Char:C90(Carriage return:K15:38); wk append:K81:179; wk include in range:K81:180)
		WP SET ATTRIBUTES:C1342(wpSummaryTable; wk font size:K81:66; 14; wk font bold:K81:68; wk true:K81:174)
		$lastContinent:=$siteEnt.toCountry.toContinent.Name
	End if 
	
	// Insert the site name and the page number in the summary page
	wpSummaryTable:=WP Text range:C1341(wpSummaryTable; wpSummaryTable.end; wpSummaryTable.end)
	WP SET TEXT:C1574(wpSummaryTable; $siteEnt.Name+" - "+Uppercase:C13($siteEnt.toCountry.Name)+Char:C90(Tab:K15:37); wk append:K81:179; wk include in range:K81:180)
	wpSummaryTable:=WP Text range:C1341(wpSummaryTable; wpSummaryTable.end; wpSummaryTable.end)
	WP SET TEXT:C1574(wpSummaryTable; String:C10($pageNumber)+Char:C90(Carriage return:K15:38); wk append:K81:179; wk include in range:K81:180)
	WP SET ATTRIBUTES:C1342(wpSummaryTable; wk font size:K81:66; 12)
	
	
	WP SET LINK:C1642(wpSummaryTable; New object:C1471("bookmark"; Replace string:C233($siteEnt.Name; " "; "")))
	
End for each 
