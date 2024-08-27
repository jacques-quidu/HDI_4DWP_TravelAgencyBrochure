//%attributes = {"invisible":true}

var $flyerSel : cs:C1710.FlyerSelection
var flyerEnt : cs:C1710.FlyerEntity

var wpSummaryTable : Object
wpSummaryTable:=New object:C1471()

wpDoc:=cs:C1710.wp.document.new()


$flyerSel:=ds:C1482.Flyer.query("ID=1")

If ($flyerSel.length=1)
	
	//QUERY([Flyer]; [Flyer]ID=1)
	//If (Records in selection([Flyer])=1)
	
	flyerEnt:=$flyerSel[0]
	
	createStyleSheet
	
	
	/////////////////////////////////////////////
	// First Cover 
	//
	// Background image
	// Image in absolute position
	// Insert plain text from database
	
	insertFirstCover
	
	
	/////////////////////////////////////////////
	// Edito
	//
	// Image in absolute position
	// Insert plain text from database
	
	insertEdito
	
	
	/////////////////////////////////////////////
	// Intro
	//
	// Image in absolute position
	// Insert fragment of document from database
	// Insert 2 columns
	
	insertIntro
	
	
	/////////////////////////////////////////////
	// Summary
	//
	// Get page number
	// Insert leading characters
	
	insertSummary
	
	
	/////////////////////////////////////////////
	// List of Site
	//
	// Loop on records to create 1 page for each site records
	// Image in absolute position
	// Insert plain text from database
	// Insert header and footer
	// Insert page number expression in footer
	// Insert table in footer
	// Insert 3 columns
	
	
	insertSite
	
	
	/////////////////////////////////////////////
	// List of Hotels
	//
	// Insert table
	// Loop on records to populate the table
	// Insert unicode characters
	// Insert left and right subsection
	// Insert header and footer
	
	insertHotelTable
	
	
	/////////////////////////////////////////////
	// Back cover
	//
	// Image in absolute position
	// Insert plain text from database
	
	insertBackCover
	
	var $bookmarks : Collection
	$bookmarks:=wpDoc.getBookmarks()
	ARRAY TEXT:C222(arrBookmarks; 0)
	COLLECTION TO ARRAY:C1562($bookmarks; arrBookmarks)
	
End if 
