
Case of 
	: (Form event code:C388=On Data Change:K2:15)
		
		var $oRange : Object
		
		$oRange:=WP Bookmark range:C1416(wpDocForm; arrBookmarks{arrBookmarks})
		
		WP SELECT:C1348(wpDocForm; $oRange)
		
End case 
