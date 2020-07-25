
	// Document on ready.
	
	$(document).ready(function(){

		// Start Session
	
			function StartSession(duration) {
				
				var timer = duration, minutes, seconds;
				var myVar  = 
			
				setInterval(function () {
					minutes = parseInt(timer / 60, 10)
					seconds = parseInt(timer % 60, 10);

					minutes = minutes < 10 ? "0" + minutes : minutes;
					seconds = seconds < 10 ? "0" + seconds : seconds;

					var timeID = document.getElementById('timer');
					timeID.innerHTML = 'Session Timeout ' + minutes + ' Min ' + seconds + ' Sec';
					// console.log('Session Timeout ' + minutes + ' Min ' + seconds + ' Sec');
					
					if (--timer < 600) {
						timeID.style.display='block';
						timeID.style.color = 'Red';
					} else { }
					
					if (--timer < 0) {
						timer = 0;
						window.location.assign('/?Logout=SessionTimeout');
						clearInterval(myVar);
					} else { }
				}, 1000);
				
			}
		
		// Call Start Session				
			
			var SessionTimeout = <?php echo $_SESSION['Timeout'] - ($_SESSION['Timeout'] - 600); ?>;
			<!-- StartSession(SessionTimeout); -->
			<?php if($_SESSION['Id'] === 0) { } else { echo 'StartSession(SessionTimeout);'; } ?>

			
	});