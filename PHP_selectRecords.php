<?php

		try {

			$conn = new MySQLi($servername, $username, $password, $dbname);

			if (mysqli_connect_error())	{ throw new Exception(mysqli_connect_error()); } else { }
					
			$TableName = '{TABLE NAME}';
			$ColumnNames = '{COLOUMN NAMES}';
			$sql = "SELECT "  . $ColumnNames . " FROM " . $TableName . " WHERE 1=1"; 
	
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
			
			// Was there a result and was the result === 1.

			// is there a connection error?

				$fp = fopen('php://output', 'w');
				if ($fp && $result) {
					header('Content-Type: text/csv');
					header('Content-Disposition: attachment; filename="export.csv"');
					header('Pragma: no-cache');
					header('Expires: 0');
				
					while ($property = mysqli_fetch_field($result)) {
						fputcsv($fp, array_values($property->name));
					}
					
					fwrite($fp, $ColumnNames); 
					fwrite($fp, "\r\n"); 
					
					if ($result->num_rows > 0) {
						
						while($row = $result->fetch_assoc()) {
							fputcsv($fp, array_values($row));
							fwrite($fp, "\r\n"); 
						}
					
					} else { 
						
						fwrite($fp, "No records found. \r\n"); 
		
					}
		
					die;
				}
						
				
		} catch (Exception $e) {

			$myfile = fopen('../logs/File_error.txt', 'a') or die('Unable to open file!');
			fwrite($myfile, 'File error: ' . $e->getMessage());
			fclose($myfile);

		}

?>