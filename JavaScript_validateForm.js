// Initialize global variables. 

var form = '';

// Validate Form. Takes all form fields and cross-checks atr=value to atr=pattern. Pass if match, fail if non-match.

function validateForm(thisMethodName,thisFormName,thisRecordID) { 
	
	// Initialize function variables.

		var errors = 0;

	// Get all the form data into an object. i.e. field=value,field=value
	
		var kvpairs = [];
		form = document.getElementsByName(thisFormName)[0];

		var pattern = '';
	
	// Try: Test value against pattern. 

		try {
			
			for ( var i = 0; i < form.elements.length; i++ ) {

				var e = form.elements[i];
			
				kvpairs.push(encodeURIComponent(e.name) + "=" + encodeURIComponent(e.value));
				
				pattern = RegExp(e.pattern);
				value = e.value;
				
				try { 
					
					var str = e.value;
					str = str.trim();
					str = str.length;

					if (str === 0 || pattern.test(value) === true) {
						
						// Matches

					} else { 
						
						// Non-matching
					
					}
				
				} catch(err) { 
					
				}
				
			}
				
		} catch(err) {

		}

}