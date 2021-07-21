//%attributes = {"invisible":true}
var $stylesheet : Object

// Normal
$stylesheet:=WP Get style sheet:C1656(wpDoc; "Normal")
WP SET ATTRIBUTES:C1342($stylesheet; wk font family:K81:65; "Helvetica Neue"; wk text align:K81:49; wk left:K81:95)


// Title
$stylesheet:=WP New style sheet:C1650(wpDoc; wk type paragraph:K81:191; "Main_Title")
WP SET ATTRIBUTES:C1342($stylesheet; \
wk font:K81:69; "Helvetica Neue"; \
wk font size:K81:66; "48pt"; \
wk font bold:K81:68; wk true:K81:174; \
wk text color:K81:64; "#363636"; \
wk text align:K81:49; wk center:K81:99)


// SubTitle
$stylesheet:=WP New style sheet:C1650(wpDoc; wk type paragraph:K81:191; "Main_SubTitle")
WP SET ATTRIBUTES:C1342($stylesheet; \
wk font:K81:69; "Helvetica Neue"; \
wk font size:K81:66; "32pt"; \
wk text color:K81:64; "#2AB8C6"; \
wk text align:K81:49; wk center:K81:99)

// Edito_Title
$stylesheet:=WP New style sheet:C1650(wpDoc; wk type paragraph:K81:191; "Edito_Title")
WP SET ATTRIBUTES:C1342($stylesheet; \
wk font:K81:69; "Helvetica Neue"; \
wk padding left:K81:16; "2cm"; \
wk padding right:K81:17; "2cm"; \
wk padding bottom:K81:19; "0.5cm"; \
wk text align:K81:49; wk left:K81:95; \
wk text color:K81:64; "#222222"; \
wk font bold:K81:68; wk true:K81:174; \
wk font size:K81:66; "20pt")

// Edito_Text
$stylesheet:=WP New style sheet:C1650(wpDoc; wk type paragraph:K81:191; "Edito_Text")
WP SET ATTRIBUTES:C1342($stylesheet; \
wk font:K81:69; "Helvetica Neue"; \
wk padding left:K81:16; "2cm"; \
wk padding right:K81:17; "2cm"; \
wk padding bottom:K81:19; "0.5cm"; \
wk text align:K81:49; wk left:K81:95; \
wk text color:K81:64; "#222222"; \
wk font bold:K81:68; wk false:K81:173; \
wk font size:K81:66; "12pt")

// Title
$stylesheet:=WP New style sheet:C1650(wpDoc; wk type paragraph:K81:191; "Title_Left")
WP SET ATTRIBUTES:C1342($stylesheet; \
wk font:K81:69; "Helvetica Neue"; \
wk font size:K81:66; 24; \
wk text color:K81:64; "#2AB8C6"; \
wk text align:K81:49; wk left:K81:95)

$stylesheet:=WP New style sheet:C1650(wpDoc; wk type paragraph:K81:191; "Title_Right")
WP SET ATTRIBUTES:C1342($stylesheet; \
wk font:K81:69; "Helvetica Neue"; \
wk font size:K81:66; 24; \
wk text color:K81:64; "#2AB8C6"; \
wk text align:K81:49; wk right:K81:96)

// BackCover_Title
$stylesheet:=WP New style sheet:C1650(wpDoc; wk type paragraph:K81:191; "BackCover_Title")
WP SET ATTRIBUTES:C1342($stylesheet; \
wk font:K81:69; "Helvetica Neue"; \
wk font size:K81:66; "48pt"; \
wk font bold:K81:68; wk true:K81:174; \
wk text color:K81:64; "#FFFFFF"; \
wk text align:K81:49; wk center:K81:99)

// BackCover_Text
$stylesheet:=WP New style sheet:C1650(wpDoc; wk type paragraph:K81:191; "BackCover_Text")
WP SET ATTRIBUTES:C1342($stylesheet; \
wk font:K81:69; "Helvetica Neue"; \
wk font size:K81:66; "32pt"; \
wk font bold:K81:68; wk false:K81:173; \
wk text color:K81:64; "#FFFFFF"; \
wk text align:K81:49; wk center:K81:99)

// PageNumber
$stylesheet:=WP New style sheet:C1650(wpDoc; wk type paragraph:K81:191; "PageNumber_Right")
WP SET ATTRIBUTES:C1342($stylesheet; wk font:K81:69; "Helvetica Neue"; wk font size:K81:66; "16pt"; wk text align:K81:49; wk right:K81:96)

$stylesheet:=WP New style sheet:C1650(wpDoc; wk type paragraph:K81:191; "PageNumber_Left")
WP SET ATTRIBUTES:C1342($stylesheet; wk font:K81:69; "Helvetica Neue"; wk font size:K81:66; "16pt"; wk text align:K81:49; wk left:K81:95)



