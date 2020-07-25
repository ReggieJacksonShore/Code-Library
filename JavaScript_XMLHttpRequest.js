// Function: XMLHttpRequest.

function XMLHttpRequest(data,action) {

	var request = new XMLHttpRequest();
	
	request.addEventListener('readystatechange', function(e) {
	
		// Holds the status of the XMLHttpRequest. 
			// 0: request not initialized 
			// 1: server connection established
			// 2: request received 
			// 3: processing request 
			// 4: request finished and response is ready

		if(request.readyState == 0) {
		
			// console.log('0: request not initialized');
			document.getElementById('request-progress').innerHTML = 'Starting...'
		
		}

		else if(request.readyState == 1) {
		
			// console.log('1: server connection established');
			document.getElementById('request-progress').innerHTML = 'Connecting...'
		
		}
						
		else if(request.readyState == 2) {
		
			// console.log('2: request received');
			document.getElementById('request-progress').innerHTML = 'Received...'
		
		}
		
		else if(request.readyState == 3) {
			
			// console.log('3: processing request');
			document.getElementById('request-progress').innerHTML = 'Processing...'
			
		}
		
		else if(request.readyState == 4 && request.status == 200) {
			
			// console.log('4: request finished and response is ready');
			document.getElementById('request-progress').innerHTML = 'Completed!'
		
		}
	
	});

	// Make the request. 
	
	request.open('POST', ''); 
	request.send(); 
	
}