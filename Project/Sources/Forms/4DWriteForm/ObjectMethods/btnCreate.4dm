GenerateFlyer
wpDocForm:=OB Copy:C1225(wpDoc.document)  //now that document has been generated, we can copy it to the form object variable

var $doc : Object
$doc:=cs:C1710.wp.document.new(wpDocForm)
var $dataContext : Object
$dataContext:=wpDoc.getDataContext()
$doc.setDataContext($dataContext)  //datacontext is not stored in the document but in the object so we must copy also the datacontext
$doc.computeFormulas()

