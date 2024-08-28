//%attributes = {"invisible":true}
var $oRange; $oNewRange : Object
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
$oNewRange.range.styleSheet:="Title_Right"
$header.element.marginLeft:="2.5cm"
$header.element.marginRight:="2.5cm"

// Insert footer
$footer:=$subSection.newFooter()
$oNewRange:=$footer.textRange(wk start text:K81:165; wk end text:K81:164)
$oNewRange.appendFormula(Formula:C1597(This:C1470.pageNumber))
$oNewRange.range.styleSheet:="PageNumber_Left"
$footer.element.marginLeft:="2.5cm"
$footer.element.marginRight:="2.5cm"


// Retrieve the reference to the right subsection
$subSection:=$section.getSubsection(wk right page:K81:205)

// Insert header
$header:=$subSection.newHeader()
$oNewRange:=$header.textRange(wk start text:K81:165; wk end text:K81:164)
$oNewRange.replaceByText("Lodgings")
$oNewRange.range.styleSheet:="Title_Left"
$header.element.marginLeft:="2.5cm"
$header.element.marginRight:="2.5cm"

// Insert footer
$footer:=$subSection.newFooter()
$oNewRange:=$footer.textRange(wk start text:K81:165; wk end text:K81:164)
$oNewRange.appendFormula(Formula:C1597(This:C1470.pageNumber))
$oNewRange.range.styleSheet:="PageNumber_Right"
$footer.element.marginLeft:="2.5cm"
$footer.element.marginRight:="2.5cm"



// Insert Lodging table
$wpTable:=$oRange.appendTable()

// append header row
$wpRow:=$wpTable.appendRow($colHeader[1]; $colHeader[2]; $colHeader[3]; $colHeader[4]; $colHeader[5]; $colHeader[6]; $colHeader[7]; $colHeader[8])

$oRange:=$wpTable.getColumns(1; 8)
$oRange.setAttributes({width: "50pt"; fontSize: "10pt"; borderColor: "#42cad7"})

$oRange:=$wpTable.getColumns(2; 3)
$oRange.range.width:="60pt"

$oRange:=$wpTable.getColumns(1; 1)
$oRange.range.width:="90pt"


var $hotelSel : cs:C1710.HotelSelection
var $hotelEnt : cs:C1710.HotelEntity
$hotelSel:=flyerEnt.toHotels.orderBy("toCountry.toContinent.Name, toCountry.Name, Name")

//set document data context and table datasource

var $data : Object
$data:=New object:C1471("hotels"; $hotelSel)
wpDoc.setDataContext($data)
$wpTable.table.dataSource:=Formula:C1597(This:C1470.data.hotels)

//add break row for continent name

$wpRow:=$wpTable.appendRow(""; ""; ""; ""; ""; ""; ""; "")
$wpRow.element.backgroundColor:="#42cad7"

var $breakFormula : Object
$breakFormula:=Formula:C1597(Uppercase:C13(This:C1470.item.toCountry.toContinent.Name))
$wpRow.element.breakFormula:=$breakFormula

$oRange:=$wpTable.getCells(1; $wpTable.table.rowCount; 1; 1)
$oRange.replaceByFormula($breakFormula)


//add data row

$wpRow:=$wpTable.appendRow(""; ""; ""; ""; ""; ""; ""; "")
//append row on default copy attributes from previous row so we need to reset break formula and background here
$wpRow.element.breakFormula:=Null:C1517
$wpRow.element.backgroundColor:=wk transparent:K81:134


$oRange:=$wpTable.getCells(1; $wpTable.table.rowCount; 1; 1)
$oRange.replaceByFormula(Formula:C1597(This:C1470.item.Name))

$oRange:=$wpTable.getCells(2; $wpTable.table.rowCount; 1; 1)
$oRange.replaceByFormula(Formula:C1597(This:C1470.item.toCountry.Name))

$oRange:=$wpTable.getCells(3; $wpTable.table.rowCount; 1; 1)
$oRange.replaceByFormula(Formula:C1597(Choose:C955(Num:C11(This:C1470.item.Rating); ""; "★"; "★★"; "★★★"; "★★★★"; "★★★★★")))

$oRange:=$wpTable.getCells(4; $wpTable.table.rowCount; 1; 1)
$oRange.replaceByFormula(Formula:C1597(This:C1470.item.Price))

$oRange:=$wpTable.getCells(5; $wpTable.table.rowCount; 1; 1)
$oRange.replaceByFormula(Formula:C1597(Choose:C955(Num:C11(This:C1470.item.Restaurant); ""; "★"; "★★"; "★★★")))

$oRange:=$wpTable.getCells(6; $wpTable.table.rowCount; 1; 1)
$oRange.replaceByFormula(Formula:C1597(Choose:C955(This:C1470.item.AllIncludes; "●"; "")))

$oRange:=$wpTable.getCells(7; $wpTable.table.rowCount; 1; 1)
$oRange.replaceByFormula(Formula:C1597(Choose:C955(This:C1470.item.Animation; "●"; "")))

$oRange:=$wpTable.getCells(8; $wpTable.table.rowCount; 1; 1)
$oRange.replaceByFormula(Formula:C1597(Choose:C955(This:C1470.item.Children; "●"; "")))

$wpTable.table.headerRowCount:=1

$oRange:=$wpTable.getColumns(1; 8)
$oRange.range.textAlign:=wk center:K81:99


