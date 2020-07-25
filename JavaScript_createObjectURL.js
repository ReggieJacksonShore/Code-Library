// Initialize global variables. 

var _OBJECT_URL;
var percentComplete;

// Function: Create Object URL.

function createObjectURL(data,action) {
	
	// Initalize User buttons and progress meter.
	
		document.getElementById('download-button-' + action + data).style.display = 'none';
		document.getElementById('download-ui-container-' + action + data).style.display = 'block';
		document.getElementById('start-download-' + action + data).style.display = 'block';
				
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
			document.getElementById('download-progress-container-' + action + data).style.display = 'block';
			
		}
		
		else if(request.readyState == 4 && request.status == 200) {
			
			// console.log('4: request finished and response is ready');
			document.getElementById('request-progress').innerHTML = 'Completed!'
			
			// Create Object URL
				
				_OBJECT_URL = URL.createObjectURL(request.response);

			// Wait for 2 seconds, show save file button.

			setTimeout(function() {
				
				document.getElementById('save-file-' + action + data).style.display = 'block';
				document.getElementById('start-download-' + action + data).style.display = 'none';
				document.getElementById('download-progress-container-' + action + data).style.display = 'none';
				
			}, 1*1000);
			
			// Wait 5 seconds, revoke object URL, remove save file button and start the User over. 

			setTimeout(function() {
				
				console.log(_OBJECT_URL);
				window.URL.revokeObjectURL(_OBJECT_URL);
				document.getElementById('download-button-' + action + data).style.display = 'block';
				document.getElementById('save-file-' + action + data).style.display = 'none';
			
			}, 5*1000);
						
		}
	
	});

	// Make the request. 
	
	request.responseType = 'blob';
	request.open('get', ''); 
	request.send(); 
	
}