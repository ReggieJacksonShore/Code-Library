<?php
								
	// Connect (create a new MySQLi object) //////
			
		try {
			
			$conn = new MySQLi($servername, $username, $password, $dbname);

			if (mysqli_connect_error())	{ throw new Exception(mysqli_connect_error()); } else { }

			$COLUMN_1 = mysqli_real_escape_string($conn, $COLUMN_1);
			$COLUMN_2 = mysqli_real_escape_string($conn, $COLUMN_2);
			$COLUMN_3 = mysqli_real_escape_string($conn, $COLUMN_3);
			$COLUMN_4 = mysqli_real_escape_string($conn, $COLUMN_4);
			$COLUMN_5 = mysqli_real_escape_string($conn, $COLUMN_5);
			
			$WhereClause = '';
			
			if($COLUMN_1 === ''){ } else { $WhereClause .= ' and {TABLE NAME}.COLUMN_1 like \'' . $COLUMN_1 . '%\' '; }
			if($COLUMN_2 === ''){ } else { $WhereClause .= ' and {TABLE NAME}.COLUMN_2 like \'' . $COLUMN_2 . '%\' '; }
			if($COLUMN_3 === ''){ } else { $WhereClause .= ' and {TABLE NAME}.COLUMN_3 like \'' . $COLUMN_3 . '%\' '; }
			if($COLUMN_4 === ''){ } else { $WhereClause .= ' and {TABLE NAME}.COLUMN_4 like \'' . $COLUMN_4 . '%\' '; }
			if($COLUMN_5 === ''){ } else { $WhereClause .= ' and {TABLE NAME}.COLUMN_5 like \'' . $COLUMN_5 . '%\' '; }
			
			$sql = "SELECT {TABLE NAME}.COLUMN_1
							,{TABLE NAME}.COLUMN_2
							,{TABLE NAME}.COLUMN_3
							,{TABLE NAME}.COLUMN_4
							,{TABLE NAME}.COLUMN_5
			
			FROM {TABLE NAME} 
			
			WHERE 1=1	
			
				and {TABLE NAME}.COLUMN_1 = " . $COLUMN_1 . "
				and {TABLE NAME}.COLUMN_2 = " . $COLUMN_2 . $WhereClause . "
			
			Order By {TABLE NAME}.COLUMN_1 DESC
			
			LIMIT 100"; 
					
			$result = $conn->query($sql);
			
			if (!$result) { throw new Exception($conn->error); } else { }
			
			if ($result->num_rows > 0) {
				
				echo '{"MESSAGE":["Database: Results found."],';
				echo '"SUCCESS":[1],';
				echo '"TOTALRECORDS":[' . $result->num_rows . '],';
				echo '"DATA":[["0","","","","","","","","","","","","","",""]';
				
				while($row = $result->fetch_assoc()) {
					
					echo ',[';
					echo '"' . $row["COLUMN_1"] . '",';
					echo '"' . $row["COLUMN_2"] . '",';
					echo '"' . $row["COLUMN_3"] . '",';
					echo '"' . $row["COLUMN_4"] . '",';
					echo '"' . $row["COLUMN_5"] . '",';
					echo ']';
					
				}
					
				echo ']}';
				
			} else { 
			
				echo '{"MESSAGE":["Database: No results found."],';				
				echo '"SUCCESS":[0],';
				echo '"TOTALRECORDS":[0],';
				echo '"DATA":[["0","","","","","","","","","","","","","",""]]}';	
				
			}
	
			$conn->close();

		} catch (Exception $e) {

			// Write to logs 
			
				if ((@fopen('/logs/website_error.txt', 'a')) === TRUE){ 
				
					fwrite($myfile, $Date_TimeStamp . ' ' . $_SERVER['PHP_SELF'] . ' ' . '{"MESSAGE":["Error: ' . trim($e->getMessage()) .'"]}');
					fclose($myfile);
				
				} else {


				}
			
			// Return JSON
			
				echo '{"MESSAGE":["Error: ' . trim($e->getMessage()) .'"],';	
				echo '"SUCCESS":[0],';
				echo '"TOTALRECORDS":[0],';
				echo '"DATA":[["0","","","","","","","","","","","","","",""]]}';
			
		}	
	
?>