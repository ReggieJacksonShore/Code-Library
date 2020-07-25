<?php

	/*

		Programmer: Reggie (RShore@northwell.edu)
		
		Name: secure-connection-PHP-to-mySQLi.php

		Description: undefined. 

		Definition: 

			undefined.

		Inputs:

			undefined.

		Outputs: 

			undefined.

  */
  
  $conn = mysqli_init();
    mysqli_ssl_set($conn,NULL,NULL, "/var/www/html/{PATH TO CERT TRUST ROOT}.crt.pem", NULL, NULL) ; 
    mysqli_real_connect($conn, 'Server Address', 'Username', 'Password', 'Database', PORT, MYSQLI_CLIENT_SSL);
    if (mysqli_connect_errno($conn)) {
    die('Failed to connect to MySQL: '.mysqli_connect_error());
  }

?>