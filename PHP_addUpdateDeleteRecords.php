<?php
	
		try {
			
			// Connect (create new MySQLi object).

				$conn = mysqli_connect($servername, $username, $password, $dbname);

			// is there a connection error?

				if (mysqli_connect_errno())	{
					
					throw new Exception('Database connection error, try again.');
				
				} else { }
				
			// Initialize variables.
			
				$Id = mysqli_real_escape_string($conn, $Id);
			
			// SQL Select Statement. 

				switch ($TableAction) {
					case "Add":
					
		
							$sql = "INSERT INTO `{TABLE NAME}` 
								
								(`COLUMN_1`
									,`COLUMN_2`
									,`COLUMN_3`
									,`COLUMN_4`
									,`COLUMN_5`) VALUES 
									
									('" . $COLUMN_1 .  "'
										, '" . $COLUMN_2 . "'
										, '" . $COLUMN_3 . "'
										, '" . $COLUMN_4 . "'
										, '" . $COLUMN_5 . "');";
							
							$sql = str_replace("''","NULL",$sql);
			
							
						break;
					
					
					case "Update":
					
								$sql = "UPDATE `{TABLE NAME}` SET 
									
										`COLUMN_1`='".$COLUMN_1."' 
										,`COLUMN_2`='".$COLUMN_2."' 
										,`COLUMN_3`='".$COLUMN_3."'
										,`COLUMN_4`='".$COLUMN_4."' 
										,`COLUMN_5`='".$COLUMN_5."' 
										
								WHERE 1=1 and `{TABLE NAME}`.`COLUMN_1` = " . $COLUMN_1 . ";";
								
								$sql = str_replace("''","NULL",$sql);
								
						break;
						
					case "Delete":

						$sql = "DELETE FROM `{TABLE NAME}" . $TableName . "` WHERE 1=1 and `{TABLE NAME}" . $TableName . "`.`COLUMN_1` = " . $COLUMN_1 . ";";
							
						break;

					case "DeleteAll":

						$sql = "DELETE FROM `{TABLE NAME}" . $TableName . "` WHERE 1=1 and `{TABLE NAME}" . $TableName . "`.`Session_Id` = " . $SessionId . ";";
							
						break;
						
				}
				
				$result = mysqli_query($conn,$sql);
				$LastId = mysqli_insert_id($conn); 
				
				// mysqli_insert_id :: Returns the auto generated id used in the latest query.
				// mysqli_insert_id :: If the modified table does not have a column with the AUTO_INCREMENT attribute, this function will return zero. 
				
				// mysqli_affected_rows($conn) === 1

				if ($result) {
			
						echo '{"MESSAGE":["Database. ' . $TableAction . ' Record Successful!"],';
						echo '"SUCCESS":[1],';
						echo '"LASTINSERTID":["' . $LastId . '"],';
						echo '"DATA":[["' . $Id . '","","","","","","","","","","","","","",""]]}';
						
				} else {
					
						echo '{"MESSAGE":["Connection error. ' . mysqli_error($conn) . '"],';
						echo '"SUCCESS":[0],';
						echo '"LASTINSERTID":["0"],';
						echo '"DATA":[["0","","","","","","","","","","","","","",""]]}';
				
				}		
			
			// 
			
			// Disconnect (close MySQLi object).
				
				mysqli_close($conn);
				
		} catch (Exception $e) {

			// Write to logs 
			
				if ((@fopen('/logs/{PATH TO FILE}.txt', 'a')) === TRUE){ 
				
					fwrite($myfile, $Date_TimeStamp . '<br />' . $_SERVER['PHP_SELF'] . '<br />{"MESSAGE":["Error: ' . trim($e->getMessage()) .'"]}<br /><br />');
					fclose($myfile);
				
				} else { }
			
			// Return JSON
			
				echo '{"MESSAGE":["Connection error. ' . trim($e->getMessage()) .'"],';
				echo '"SUCCESS":[0],';
				echo '"LASTINSERTID":["0"],';
				echo '"DATA":[["0","","","","","","","","","","","","","",""]]}';
	
		}	

?>