
Case of 
	: (Form event code:C388=On Data Change:K2:15)
		
		var $oRange : Object
		
		$oRange:=WP Bookmark range:C1416(wpDocForm; arrBookmarks{arrBookmarks})
		
		INVOKE ACTION:C1439("bookmark?index="+String:C10(arrBookmarks))  //must use action in order to scroll to the top of page with a jump to bookmark
		//WP SELECT(wpDocForm; $oRange)
		
End case 
