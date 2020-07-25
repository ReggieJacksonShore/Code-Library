<?php 
	
	// Get Profile. 
		
	$msg = '
			{
				"getProfile": {
					"merchantAuthentication": {
						"name": "{NAME}",
						"transactionKey": "{TRANSACTION KEY}"
					},
					"profileId": "{CUSTOMER PROFILE ID}"
				}
			}
		';	
		
	$ch=curl_init($APIEndpoint);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
		curl_setopt_array($ch, array(
		CURLOPT_POST => true,
		CURLOPT_POSTFIELDS => $msg,
		CURLOPT_HEADER => false,
		CURLOPT_SSL_VERIFYPEER => false,
		CURLOPT_TIMEOUT =>30,
		CURLOPT_USERAGENT => "'" . $_SERVER['HTTP_USER_AGENT'] . "'",
		CURLOPT_HTTPHEADER => array('Content-Type:application/json', 'Content-Length: ' . strlen($msg)))
	);

	$result = curl_exec($ch);
	curl_close($ch);
		
	print $result;  

		
?>