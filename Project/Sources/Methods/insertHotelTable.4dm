//%attributes = {"invisible":true}
var $oRange; $oNewRange; $columns; $cell : Object
var $wpTable; $wpRow : Object
var $header; $footer; $info; $section; $subSection : Object
var $iContinent; $iHotel; $firstpage; $iCol : Integer
var $lastContinent : Text
$lastContinent:=""

var $colHeader : Collection
$colHeader:=New collection:C1472(""; "Hotel"; "Country"; "Rating"; "Price"; "Restaurant"; "All inclusive"; "Activities"; "Children's club")

$oRange:=wpDoc.textRange(wk end text:K81:164; wk end text:K81:164)

wpDoc.newBookmark($oRange; "Lodgings")

$oRange.appendBreak(wk section break:K81:187; wk exclude from range:K81:181)


// Retrieve the current section
$section:=$oRange.getSection()

// Format the current section
$section.setAttributes({pageMarginTop: "3cm"; pageMarginLeft: "1.5cm"; pageMarginRight: "1.5cm"})

// Create the left sub section
$subSection:=$section.newSubsection(wk left page:K81:204)


// Insert header
$header:=$subSection.newHeader()
$oNewRange:=$header.textRange(wk start text:K81:165; wk end text:K81:164)
$oNewRange.replaceByText("Lodgings")
$oNewRange.styleSheet:="Title_Right"
$header.marginLeft:="2.5cm"
$header.marginRight:="2.5cm"

// Insert footer
$footer:=$subSection.newFooter()
$oNewRange:=$footer.textRange(wk start text:K81:165; wk end text:K81:164)
$oNewRange.appendFormula(Formula:C1597(This:C1470.pageNumber))
$oNewRange.styleSheet:="PageNumber_Left"
$footer.marginLeft:="2.5cm"
$footer.marginRight:="2.5cm"


// Retrieve the reference to the right subsection
$subSection:=$section.getSubsection(wk right page:K81:205)

// Insert header
$header:=$subSection.newHeader()
$oNewRange:=$header.textRange(wk start text:K81:165; wk end text:K81:164)
$oNewRange.replaceByText("Lodgings")
$oNewRange.styleSheet:="Title_Left"
$header.marginLeft:="2.5cm"
$header.marginRight:="2.5cm"

// Insert footer
$footer:=$subSection.newFooter()
$oNewRange:=$footer.textRange(wk start text:K81:165; wk end text:K81:164)
$oNewRange.appendFormula(Formula:C1597(This:C1470.pageNumber))
$oNewRange.styleSheet:="PageNumber_Right"
$footer.marginLeft:="2.5cm"
$footer.marginRight:="2.5cm"



// Insert Lodging table
$wpTable:=$oRange.appendTable()

// append header row
$wpRow:=$wpTable.appendRow($colHeader[1]; $colHeader[2]; $colHeader[3]; $colHeader[4]; $colHeader[5]; $colHeader[6]; $colHeader[7]; $colHeader[8])

$columns:=$wpTable.getColumns(1; 8)
$columns.width:="50pt"
$columns.borderColor:="#42cad7"
$columns.textRange().fontSize:="10pt"

$columns:=$wpTable.getColumns(2; 3)
$columns.width:="60pt"

$columns:=$wpTable.getColumns(1; 1)
$columns.width:="90pt"


var $hotelSel : cs:C1710.HotelSelection
var $hotelEnt : cs:C1710.HotelEntity
$hotelSel:=flyerEnt.toHotels.orderBy("toCountry.toContinent.Name, toCountry.Name, Name")

//set document data context and table datasource

var $data : Object
$data:=New object:C1471("hotels"; $hotelSel)
wpDoc.setDataContext($data)
$wpTable.dataSource:=Formula:C1597(This:C1470.data.hotels)

//add break row for continent name

$wpRow:=$wpTable.appendRow(""; ""; ""; ""; ""; ""; ""; "")
$wpRow.backgroundColor:="#42cad7"

var $breakFormula : Object
$breakFormula:=Formula:C1597(Uppercase:C13(This:C1470.item.toCountry.toContinent.Name))
$wpRow.breakFormula:=$breakFormula

$cell:=$wpTable.getCells(1; $wpTable.table.rowCount; 1; 1)
$cell.replaceByFormula($breakFormula)


//add data row

$wpRow:=$wpTable.appendRow(""; ""; ""; ""; ""; ""; ""; "")
//append row on default copy attributes from previous row so we need to reset break formula and background here
$wpRow.breakFormula:=Null:C1517
$wpRow.backgroundColor:=wk transparent:K81:134


$cell:=$wpTable.getCells(1; $wpTable.table.rowCount; 1; 1)
$cell.replaceByFormula(Formula:C1597(This:C1470.item.Name))

$cell:=$wpTable.getCells(2; $wpTable.table.rowCount; 1; 1)
$cell.replaceByFormula(Formula:C1597(This:C1470.item.toCountry.Name))

$cell:=$wpTable.getCells(3; $wpTable.table.rowCount; 1; 1)
$cell.replaceByFormula(Formula:C1597(Choose:C955(Num:C11(This:C1470.item.Rating); ""; "★"; "★★"; "★★★"; "★★★★"; "★★★★★")))

$cell:=$wpTable.getCells(4; $wpTable.table.rowCount; 1; 1)
$cell.replaceByFormula(Formula:C1597(This:C1470.item.Price))

$cell:=$wpTable.getCells(5; $wpTable.table.rowCount; 1; 1)
$cell.replaceByFormula(Formula:C1597(Choose:C955(Num:C11(This:C1470.item.Restaurant); ""; "★"; "★★"; "★★★")))

$cell:=$wpTable.getCells(6; $wpTable.table.rowCount; 1; 1)
$cell.replaceByFormula(Formula:C1597(Choose:C955(This:C1470.item.AllIncludes; "●"; "")))

$cell:=$wpTable.getCells(7; $wpTable.table.rowCount; 1; 1)
$cell.replaceByFormula(Formula:C1597(Choose:C955(This:C1470.item.Animation; "●"; "")))

$cell:=$wpTable.getCells(8; $wpTable.table.rowCount; 1; 1)
$cell.replaceByFormula(Formula:C1597(Choose:C955(This:C1470.item.Children; "●"; "")))

$wpTable.headerRowCount:=1

$columns:=$wpTable.getColumns(1; 8)
$columns.textRange().textAlign:=wk center:K81:99




