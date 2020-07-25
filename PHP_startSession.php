<?php

	// Restrict Access
	
		if ($_SERVER['SCRIPT_NAME'] === '/startSession.php') { header('location:/Login.php?InvalidAccess=RestrictAccess'); die(); } else { }
	
	// Restrict Access to HTTP (non-secure) Protocol.
	
		if (isset($_SERVER['HTTPS'])		
			&& $_SERVER['HTTPS'] === 'on') {  } else { 
		
			// header('location:https://url' . $_SERVER['SCRIPT_NAME']); die(); 
		
		}

	// Restrict Access. For extra security, check Nonce on POST Request. 

		if ($_SERVER['REQUEST_METHOD'] === 'POST' 
			&& isset($_SESSION['Nonce']) 
			&& $_SESSION['Nonce'] !== $_POST['Nonce']) { 
			
			header('location:/Login.php?InvalidAccess'); die(); 
			
		} else {  }
		
	// Initialize Application 
	
		session_start(); // Start the session 		
		error_reporting(0); // Turn off all error reporting
		date_default_timezone_set('UTC');	// Default Timezone

		$Date_Year = date('Y');
		$Date_TimeStamp = date('Y-m-d H:i:s');
		$Date_TimeStampStripped = date('YmdHis');
		$Date_UserFriendly = date('D, M jS T');
		$Date_Today = date('Y-m-d');

		$get = null;
		$post = null;
		$session = null;
		$field = null;
		$value = null;
		
		$tempString = null;		// Temp string
		$tempNumeric = 0;		// Temp index
		
	// Email Variables
		
		$headers = '';
		$to = '';
		$cc = '';
		$subject = 'Email Subject';
		$recipient = 'Email Recipient';
		$message = 'Email Message';
		$html_message = 'Email HTML Message';
		
	// Development vs. Production

		if (strpos($$_SERVER['SERVER_NAME'], '')) {

			$ServerName = '';	// Database Connection.
		
		} else { 

			$ServerName = 'localhost';	// Database Connection.
		
		}
		
	// Unset (remove) and destroy the session.
		
		if (isset($_GET['Logout'])) { 
			
			session_unset(); 
			session_destroy(); 
		
		} else { }
		
	// Initialize Session if it is empty.

		if(empty($_SESSION)) {

			$_SESSION['Id'] = 0;
			
		} else { 
		
		}
			
		foreach($_SESSION as $field => $value) { ${$field} = CleanData($value); $session .= $field . '=>' . $value . "\r\n"; }
		
		// Renew the session timeout. 
			
			$_SESSION['Timeout'] = time();

	// Close the Session.
	
		session_write_close();	// Can't write to the session anymore. 
		
	// Initialize Parameters: URL (GET).
	
		if (empty($_GET)) { } else { foreach($_GET as $field => $value) { ${$field} = CleanData($value); $get .= $field . '=>' . $value . "\r\n"; } }	
	
	// Initialize Parameters: FORM (POST). For extra security, check Nonce on POST Request
	
		if (empty($_POST)){ } else { foreach($_POST as $field => $value) { ${$field} = cleanData($value); $post .= $field . '=>' . $value . "\r\n"; } }
		
	// Clean Data.
	
		function CleanData($data) {
			
		  $data = trim($data);
		  $data = stripslashes($data);
		  $data = htmlspecialchars($data);
		  $data = filter_var($data, FILTER_SANITIZE_STRING);
		  
		  return $data;
		
		}

	// Create Random Password. 
		
		function Password_Random() { 
			
			// Initialize variables.
			
				$upper 			= rand(2, 5);
				$lower 			= rand(2, 5);
				$numeric 		= rand(2, 5);
				$other 			= rand(2, 5);
				$other_chrs 	= Array("!","@","#","$","%","^","*","(",")","+","{","}","?",".","|","~");
				
				$pass_order		= Array(); 
				$passWord 		= ''; 

			// Create contents of the random password.		 
			
				for ($i = 0; $i < $upper; $i++) { $pass_order[] = chr(rand(65, 90)); } 
				for ($i = 0; $i < $lower; $i++) { $pass_order[] = chr(rand(97, 122)); } 
				for ($i = 0; $i < $numeric; $i++) { $pass_order[] = chr(rand(48, 57)); } 
				for ($i = 0; $i < $other; $i++) { $pass_order[] = $other_chrs[array_rand($other_chrs, 1)]; }
				
			// Using shuffle() to shuffle the order.
				
				shuffle($pass_order); 

			// Final password string. 
				
				foreach ($pass_order as $char) { $passWord .= $char; } 
			
			// Return out. 
			
				return $passWord; 
				
		} 	
		
?>