<?php
	
// Debugging SESSION Variables

	if (empty($_SESSION)) { } else {
		
		$fields = array();
		$values = array();
		
		foreach($_SESSION as $field => $value) {
			
			$fields[] = $field;
			$values[] = $value;
			echo 'SESSION ' . $field . '=>' . $value . '<br />';
		
		}
		
	}
	
// Debugging POST Variables

	if (empty($_POST)) { } else {
		
		$fields = array();
		$values = array();
		
		foreach($_POST as $field => $value) {
			
			$fields[] = $field;
			$values[] = $value;
			echo 'POST ' . $field . '=>' . $value . '<br />';
		
		}
		
	}

// Debugging GET Variables
	
	if (empty($_GET)) { } else {
		
		$fields = array();
		$values = array();
		
		foreach($_GET as $field => $value) {
			
			$fields[] = $field;
			$values[] = $value;
			echo 'GET ' . $field . '=>' . $value . '<br />';
		
		}
		
	}
	
	
?>