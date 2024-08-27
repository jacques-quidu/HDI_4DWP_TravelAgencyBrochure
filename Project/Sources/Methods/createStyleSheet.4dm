//%attributes = {"invisible":true}
var $stylesheet : Object

// Normal

$styleSheet:=wpDoc.getStyleSheet("Normal")
$styleSheet.setAttributes({fontFamily: "Helvetica Neue"; textAlign: wk left:K81:95})


// Title

$styleSheet:=wpDoc.newStyleSheet(wk type paragraph:K81:191; "Main_Title")

var $attributes : Object

$attributes:=New object:C1471
$attributes[wk font:K81:69]:="Helvetica Neue"
$attributes[wk font size:K81:66]:="48pt"
$attributes[wk font bold:K81:68]:=wk true:K81:174
$attributes[wk text color:K81:64]:="#363636"
$attributes[wk text align:K81:49]:=wk center:K81:99
$styleSheet.setAttributes($attributes)


// SubTitle

$styleSheet:=wpDoc.newStyleSheet(wk type paragraph:K81:191; "Main_SubTitle")

$attributes[wk font size:K81:66]:="32pt"
$attributes[wk font bold:K81:68]:=wk false:K81:173
$attributes[wk text color:K81:64]:="#2AB8C6"
$styleSheet.setAttributes($attributes)


// Edito_Title

$styleSheet:=wpDoc.newStyleSheet(wk type paragraph:K81:191; "Edito_Title")
$attributes:=New object:C1471
$attributes[wk font:K81:69]:="Helvetica Neue"
$attributes[wk padding left:K81:16]:="2cm"
$attributes[wk padding right:K81:17]:="2cm"
$attributes[wk padding bottom:K81:19]:="0.5cm"
$attributes[wk text align:K81:49]:=wk left:K81:95
$attributes[wk text color:K81:64]:="#222222"
$attributes[wk font bold:K81:68]:=wk true:K81:174
$attributes[wk font size:K81:66]:="20pt"
$styleSheet.setAttributes($attributes)


// Edito_Text

$styleSheet:=wpDoc.newStyleSheet(wk type paragraph:K81:191; "Edito_Text")
$attributes[wk font bold:K81:68]:=wk false:K81:173
$attributes[wk font size:K81:66]:="12pt"
$styleSheet.setAttributes($attributes)


// Title

$styleSheet:=wpDoc.newStyleSheet(wk type paragraph:K81:191; "Title_Left")

$attributes:=New object:C1471
$attributes[wk font:K81:69]:="Helvetica Neue"
$attributes[wk font size:K81:66]:="24pt"
$attributes[wk text color:K81:64]:="#2AB8C6"
$attributes[wk text align:K81:49]:=wk left:K81:95
$styleSheet.setAttributes($attributes)


$styleSheet:=wpDoc.newStyleSheet(wk type paragraph:K81:191; "Title_Right")

$attributes[wk text align:K81:49]:=wk right:K81:96
$styleSheet.setAttributes($attributes)


// BackCover_Title
$styleSheet:=wpDoc.newStyleSheet(wk type paragraph:K81:191; "BackCover_Title")

$attributes:=New object:C1471
$attributes[wk font:K81:69]:="Helvetica Neue"
$attributes[wk font size:K81:66]:="48pt"
$attributes[wk font bold:K81:68]:=wk true:K81:174
$attributes[wk text color:K81:64]:="#FFFFFF"
$attributes[wk text align:K81:49]:=wk center:K81:99
$styleSheet.setAttributes($attributes)


// BackCover_Text
$styleSheet:=wpDoc.newStyleSheet(wk type paragraph:K81:191; "BackCover_Text")

$attributes[wk font size:K81:66]:="32pt"
$attributes[wk font bold:K81:68]:=wk false:K81:173
$styleSheet.setAttributes($attributes)



// PageNumber
$styleSheet:=wpDoc.newStyleSheet(wk type paragraph:K81:191; "PageNumber_Right")

$attributes:=New object:C1471
$attributes[wk font:K81:69]:="Helvetica Neue"
$attributes[wk font size:K81:66]:="16pt"
$attributes[wk text align:K81:49]:=wk right:K81:96
$styleSheet.setAttributes($attributes)

$styleSheet:=wpDoc.newStyleSheet(wk type paragraph:K81:191; "PageNumber_Left")

$attributes[wk text align:K81:49]:=wk left:K81:95
$styleSheet.setAttributes($attributes)




