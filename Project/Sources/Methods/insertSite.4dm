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
	
	$oRange:=wpDoc.textRange(wk end text:K81:164; wk end text:K81:164)
	wpDoc.newBookmark($oRange; Replace string:C233($siteEnt.Name; " "; ""))
	
	// Insert text
	$oRange.appendText($siteEnt.Description)
	
	// Insert column break
	$oRange.appendBreak(wk column break:K81:254)
	
	// Insert text
	$oRange:=wpDoc.textRange(wk end text:K81:164; wk end text:K81:164)
	$oRange.appendText($siteEnt.Highlights+Char:C90(Carriage return:K15:38))
	
	// Format text
	$colParagraph:=$oRange.getElements(wk type paragraph:K81:191)
	
	For ($col; 0; $colParagraph.length-1)
		$colParagraph[$col].setAttributes({backgroundColor: "#42cad7"; paddingLeft: "5pt"; paddingRight: "5pt"})
		
		If ($col=0)
			$colParagraph[$col].setAttributes({paddingTop: "5pt"; paddingBottom: "10pt"; textAlign: wk center:K81:99; fontBold: wk true:K81:174})
		Else 
			$colParagraph[$col].setAttributes({paddingBottom: "5pt"; textAlign: wk left:K81:95; fontBold: wk false:K81:173})
		End if 
		
	End for 
	
	$colParagraph[$colParagraph.length-1].resetAttributes([wk background color:K81:20; wk padding left:K81:16; wk padding right:K81:17; wk padding top:K81:18])
	
	
	// Insert break section
	$oRange.appendBreak(wk section break:K81:187)
	
	// Retrieve the current section
	$section:=$oRange.getSection()
	
	// Format the current section
	$section.setAttributes({columnCount: 3; columnSpacing: "0.5cm"})
	
	// Insert footer in the current section
	$footer:=$section.newFooter()
	$oRange:=$footer.textRange(wk start text:K81:165; wk end text:K81:164)
	
	// Insert table in the footer
	$wpTable:=$oRange.appendTable()
	
	// Odd or Even page
	$info:=$oRange.getPosition()
	$pageNumber:=$info.page
	If (($pageNumber%2)=0)
		$wpRow:=$wpTable.appendRow("page"; $siteEnt.Condition)
		$pair1:=wk right:K81:96
		$pair2:=wk left:K81:95
		$cell1:=2
		$cell2:=1
	Else 
		$wpRow:=$wpTable.appendRow($siteEnt.Condition; "page")
		$pair1:=wk left:K81:95
		$pair2:=wk right:K81:96
		$cell1:=1
		$cell2:=2
	End if 
	
	// Format table in the footer
	$oRange:=$wpTable.getCells($cell1; 1)
	$oRange.setAttributes({color: "#66746B"; fontSize: "8pt"; font: "Helvetica Neue"; textAlign: $pair1; width: "13.5cm"; borderStyle: wk none:K81:91})
	
	$oRange:=$wpTable.getCells($cell2; 1)
	$oRange.setAttributes({fontSize: "16pt"; font: "Helvetica Neue"; textAlign: $pair2; width: "2cm"; borderStyle: wk none:K81:91})
	
	// Insert page number expression in footer
	$colParagraph:=$oRange.getElements(wk type paragraph:K81:191)
	$oRange:=$colParagraph[0].textRange(wk start text:K81:165; wk end text:K81:164)
	$oRange.replaceByFormula(Formula:C1597(This:C1470.pageNumber))
	
	//Insert site image
	$obPict:=wpDoc.newAnchoredPicture($siteEnt.Image1)
	$obPict.setAttributes({anchorLayout: wk text wrap top bottom:K81:379; marginBottom: "0.5cm"; anchorSection: $section.section.sectionIndex; anchorOrigin: wk paper box:K81:215; anchorVerticalOffset: "80pt"; anchorHorizontalAlign: $pair1})
	
	$obPict:=wpDoc.newAnchoredPicture($siteEnt.Image2)
	$obPict.setAttributes({anchorLayout: wk text wrap top bottom:K81:379; marginBottom: "0.5cm"; anchorSection: $section.section.sectionIndex; anchorOrigin: wk paper box:K81:215; anchorVerticalOffset: "80pt"; anchorHorizontalAlign: $pair2})
	
	$obPict:=wpDoc.newAnchoredPicture($siteEnt.Image3)
	$obPict.setAttributes({anchorLayout: wk text wrap top bottom:K81:379; marginBottom: "0.5cm"; anchorSection: $section.section.sectionIndex; anchorOrigin: wk paper box:K81:215; anchorVerticalOffset: "213pt"; anchorHorizontalAlign: $pair2})
	
	// Insert continent map
	$obPict:=wpDoc.newAnchoredPicture($siteEnt.toCountry.toContinent.Image)
	$obPict.setAttributes({anchorSection: $section.section.sectionIndex; anchorOrigin: wk paper box:K81:215; anchorHorizontalOffset: "20pt"; anchorVerticalOffset: "0.8cm"; anchorHorizontalAlign: $pair2})
	
	
	// Insert header in the current section
	$header:=$section.newHeader()
	$oRange:=$header.textRange(wk start text:K81:165; wk end text:K81:164)
	$oRange.replaceByText($siteEnt.Name+" - "+Uppercase:C13($siteEnt.toCountry.Name))
	$oRange.setAttributes({font: "Helvetica Neue"; fontSize: 24; color: "#2AB8C6"; textAlign: $pair1})
	
	
	// Insert the continent name in the summary page
	If ($lastContinent#$siteEnt.toCountry.toContinent.Name)
		wpSummaryRange:=wpDoc.textRange(wpSummaryRange.range.end; wpSummaryRange.range.end)
		wpSummaryRange.appendText(Char:C90(Carriage return:K15:38)+$siteEnt.toCountry.toContinent.Name+Char:C90(Carriage return:K15:38))
		wpSummaryRange.setAttributes({fontSize: 14; fontBold: wk true:K81:174})
		$lastContinent:=$siteEnt.toCountry.toContinent.Name
	End if 
	
	// Insert the site name and the page number in the summary page
	wpSummaryRange.appendText($siteEnt.Name+" - "+Uppercase:C13($siteEnt.toCountry.Name)+Char:C90(Tab:K15:37))
	wpSummaryRange:=wpDoc.textRange(wpSummaryRange.range.end; wpSummaryRange.range.end)
	wpSummaryRange.appendText(String:C10($pageNumber)+Char:C90(Carriage return:K15:38))
	wpSummaryRange.setAttributes({fontSize: 12})
	wpSummaryRange.setLink(New object:C1471("bookmark"; Replace string:C233($siteEnt.Name; " "; "")))
	
End for each 
