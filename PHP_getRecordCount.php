<?php

// Connect (create a new MySQLi object) //////
			
		try {
			
			$conn = new MySQLi($servername, $username, $password, $dbname);

			if (mysqli_connect_error())	{ throw new Exception(mysqli_connect_error()); } else { }

			switch ($TableName) {
				case '{Table Name}':
					$TableName = '';
					break;
				case '{Table Name}':
					$TableName = '';
					break;
				case "{Table Name}":
					$TableName = '';
					break;
				case "{Table Name}":
					$TableName = '';
					break;
				case "{Table Name}":
					$TableName = '';
					break;
				case "{Table Name}":
					$TableName = '';
					break;
				case "{Table Name}":
					$TableName = '';
					break;
				 default:
					$TableName = '';
	   
			}
			
			$sql = "SELECT count(" . $TableName . ".Id) FROM " . $TableName . " WHERE 1=1 and " . $TableName . ".Id = " . $Id . " LIMIT 1"; 
					
			$result = $conn->query($sql);
			
			if (!$result) { throw new Exception($conn->error); } else { }
			
			if ($result->num_rows === 1) {
				
				echo '{"MESSAGE":["Database: Results found."],';
				echo '"SUCCESS":[1],';
				echo '"TOTALRECORDS":[' . $result->num_rows . '],';
				
				$row = $result->fetch_row();

				echo '"DATA":[' . $row[0] . ']';
					
				echo '}';
				
			} else { 
			
				echo '{"MESSAGE":["Database: No results found."],';				
				echo '"SUCCESS":[0],';
				echo '"TOTALRECORDS":[0],';
				echo '"DATA":[0]}';	
				
			}
	
			$conn->close();

		} catch (Exception $e) {
			
			echo '{"MESSAGE":["Error: ' . trim($e->getMessage()) .'"],';	
			echo '"SUCCESS":[0],';
			echo '"TOTALRECORDS":[0],';
			echo '"DATA":[0]}';

			$myfile = fopen('../logs/Database_error.txt', 'a') or die('Unable to open file!');
			fwrite($myfile, 'Error: ' . $e->getMessage());
			fclose($myfile);	
			
		}	
	
?>